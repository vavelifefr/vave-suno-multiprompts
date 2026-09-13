#Requires -Version 5.1
<#
.SYNOPSIS
  Measures canonical file sizes for vave-suno-multiprompts; optionally patches README.md numbers.
  Usage: powershell -NoProfile -ExecutionPolicy Bypass -File tools/measure.ps1 [-UpdateReadme]
  Pro stack  = SKILL.md + SKILL-CORE.md + RULES.md + SUNO-TAGS.md + ADAPTERS.md + GUIDE.md + LINKS.md + DEFAULTS.md
  Lite pair  = LITE.md + LITE-TAGS.md.
  README rows carrying <!-- M:chars --> get fresh numbers with -UpdateReadme; the GUIDE status line
  (matched by /50000) gets the fresh GUIDE size. This file stays ASCII-only: patterns avoid
  non-ASCII literals (markers are ASCII; row cells are patched by position, never matched by content).
#>
param(
  [switch]$UpdateReadme
)
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
function Size-Of([string]$name) {
  return [System.IO.File]::ReadAllText((Join-Path $root $name), [System.Text.Encoding]::UTF8).Length
}

$proFiles = @('SKILL.md', 'SKILL-CORE.md', 'RULES.md', 'SUNO-TAGS.md', 'ADAPTERS.md', 'GUIDE.md', 'LINKS.md', 'DEFAULTS.md')
$liteFiles = @('LITE.md', 'LITE-TAGS.md')
$pro = 0
foreach ($f in $proFiles) { $n = Size-Of $f; $pro += $n; Write-Output ("{0,16}: {1,7} chars" -f $f, $n) }
$lite = 0
foreach ($f in $liteFiles) { $n = Size-Of $f; $lite += $n; Write-Output ("{0,16}: {1,7} chars" -f $f, $n) }
$inv = [System.Globalization.CultureInfo]::InvariantCulture
$ratio = [math]::Round($pro / [double]$lite, 1).ToString('0.0', $inv)
$guide = Size-Of 'GUIDE.md'
Write-Output ("PRO : {0} chars" -f $pro)
Write-Output ("LITE: {0} chars" -f $lite)
Write-Output ("RATIO: {0}x  GUIDE: {1}/50000" -f $ratio, $guide)

if ($UpdateReadme) {
  $readmePath = Join-Path $root 'README.md'
  $enc = New-Object System.Text.UTF8Encoding $true
  $text = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
  $lines = $text -split "`r?`n"
  for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -like '*M:chars*') {
      $cells = $lines[$i] -split '\|'
      $cells[2] = ' ' + [string]$lite + ' '
      $cells[3] = ' ' + [string]$pro + ' '
      $cells[4] = $cells[4] -replace '[\d.]+', ([string]$ratio)
      $lines[$i] = $cells -join '|'
    }
    elseif ($lines[$i] -match '\d+/50000') {
      $lines[$i] = $lines[$i] -replace '\d+(?=/50000)', ([string]$guide)
    }
  }
  [System.IO.File]::WriteAllText($readmePath, ($lines -join "`r`n"), $enc)
  Write-Output "README.md patched (chars/GUIDE rows)."
}
