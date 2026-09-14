#Requires -Version 5.1
<#
.SYNOPSIS
  Audits project text encodings: all human-readable text artifacts must be UTF-8
  with BOM; JSON data must be UTF-8 without BOM. Detects CP1251 and mojibake.

.DESCRIPTION
  Default run checks every text file (known text extensions, no binaries):
    - .md .txt .csv .tsv .ps1 .js .py .yml .yaml .toml .ini .cfg .properties
      and .editorconfig / .gitattributes  -> UTF-8 with BOM;
    - .json                                -> UTF-8 without BOM.
  Bytes that are not valid UTF-8  -> CP1251_CANDIDATE (fail).
  Valid UTF-8 containing U+FFFD   -> MOJIBAKE_CANDIDATE (fail; manual rewrite needed).
  -AuditAll prints every file kind; -Fix rewrites text artifacts as UTF-8 with BOM,
  strips BOM from JSON data, and transcodes CP1251 candidates to UTF-8.
#>
param(
  [switch]$AuditAll,
  [switch]$Fix
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$utf8Strict = New-Object System.Text.UTF8Encoding -ArgumentList $false, $true
$utf8Bom = New-Object System.Text.UTF8Encoding -ArgumentList $true
$utf8NoBom = New-Object System.Text.UTF8Encoding -ArgumentList $false
$cp1251 = [System.Text.Encoding]::GetEncoding(1251)
$replacement = [char]0xFFFD

$textExtensions = @('.md', '.txt', '.csv', '.tsv', '.ps1', '.js', '.ts', '.py', '.yml', '.yaml', '.toml', '.ini', '.cfg', '.properties')
$jsonExtensions = @('.json')

function Test-JsonPath([string]$fullPath) {
  return $jsonExtensions -contains [System.IO.Path]::GetExtension($fullPath).ToLowerInvariant()
}

function Test-TextPath([string]$fullPath) {
  $extension = [System.IO.Path]::GetExtension($fullPath).ToLowerInvariant()
  if ($jsonExtensions -contains $extension) { return $false }
  if ($textExtensions -contains $extension) { return $true }
  $name = [System.IO.Path]::GetFileName($fullPath).ToLowerInvariant()
  return ($name -eq '.editorconfig' -or $name -eq '.gitattributes')
}

function Get-EncodingInfo([string]$path) {
  $bytes = [System.IO.File]::ReadAllBytes($path)
  $hasBom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
  try {
    $text = if ($hasBom) { $utf8Strict.GetString($bytes, 3, $bytes.Length - 3) } else { $utf8Strict.GetString($bytes) }
    return [pscustomobject]@{ Kind = $(if ($hasBom) { 'UTF8_BOM' } else { 'UTF8_NO_BOM' }); Text = $text }
  }
  catch [System.Text.DecoderFallbackException] {
    return [pscustomobject]@{ Kind = 'CP1251_CANDIDATE'; Text = $cp1251.GetString($bytes) }
  }
}

$excludeDirs = @('node_modules', '.git', 'dist', 'build', 'out', 'vendor', 'coverage', '.next', '.cache', '__pycache__', '.venv', 'venv', 'obj', 'Prompts')
function Test-Excluded([string]$fullPath) {
  $rel = $fullPath.Substring($root.Length).TrimStart('\')
  foreach ($p in ($rel -split '[\\/]')) { if ($excludeDirs -contains $p) { return $true } }
  return $false
}

$allTextFiles = @(Get-ChildItem -LiteralPath $root -Recurse -File | Where-Object {
  -not (Test-Excluded $_.FullName) -and ((Test-TextPath $_.FullName) -or (Test-JsonPath $_.FullName))
})
$files = $allTextFiles

$counts = @{ UTF8_BOM = 0; UTF8_NO_BOM = 0; CP1251_CANDIDATE = 0 }
$nonCompliantText = New-Object System.Collections.Generic.List[string]
$nonCompliantJson = New-Object System.Collections.Generic.List[string]
$mojibake = New-Object System.Collections.Generic.List[string]

foreach ($file in $files) {
  $info = Get-EncodingInfo $file.FullName
  $counts[$info.Kind]++
  $relative = $file.FullName.Substring($root.Length).TrimStart('\')
  $isJson = Test-JsonPath $file.FullName

  if ($AuditAll) { Write-Output ($info.Kind + ' ' + $relative) }
  if ($info.Kind -eq 'CP1251_CANDIDATE') { Write-Output ('CP1251_CANDIDATE ' + $relative) }
  if ($info.Text.Contains($replacement)) {
    Write-Output ('MOJIBAKE_CANDIDATE ' + $relative)
    $mojibake.Add($relative)
  }

  if ($isJson) {
    if ($info.Kind -ne 'UTF8_NO_BOM') {
      $nonCompliantJson.Add($relative)
      if ($Fix -and $info.Kind -ne 'CP1251_CANDIDATE') {
        [System.IO.File]::WriteAllText($file.FullName, $info.Text, $utf8NoBom)
        Write-Output ('FIXED_UTF8_NO_BOM ' + $relative)
      }
    }
  }
  else {
    if ($info.Kind -ne 'UTF8_BOM') {
      $nonCompliantText.Add($relative)
      if ($Fix) {
        [System.IO.File]::WriteAllText($file.FullName, $info.Text, $utf8Bom)
        Write-Output ('FIXED_UTF8_BOM ' + $relative)
      }
    }
  }
}

Write-Output ('SUMMARY files=' + $files.Count + ' utf8_bom=' + $counts.UTF8_BOM + ' utf8_no_bom=' + $counts.UTF8_NO_BOM + ' cp1251_candidates=' + $counts.CP1251_CANDIDATE + ' mojibake=' + $mojibake.Count)

if ($Fix) {
  Write-Output ('FIXED text_files=' + $nonCompliantText.Count)
  Write-Output ('FIXED json_files=' + $nonCompliantJson.Count)
  if ($mojibake.Count -gt 0) { exit 1 }
  if (@($nonCompliantJson | Where-Object { (Get-EncodingInfo (Join-Path $root $_)).Kind -eq 'CP1251_CANDIDATE' }).Count -gt 0) { exit 1 }
  exit 0
}

if ($nonCompliantText.Count -gt 0 -or $nonCompliantJson.Count -gt 0 -or $mojibake.Count -gt 0) {
  Write-Output ('FAIL text_without_utf8_bom=' + $nonCompliantText.Count)
  Write-Output ('FAIL json_not_utf8_no_bom=' + $nonCompliantJson.Count)
  Write-Output ('FAIL mojibake_candidates=' + $mojibake.Count)
  exit 1
}
Write-Output 'PASS all text artifacts are UTF-8 with BOM; JSON data is UTF-8 without BOM; no mojibake.'
