#Requires -Version 5.1
<#
.SYNOPSIS
  Minimal smoke harness for vave-suno-multiprompts (no fixtures, no network).
  Usage: powershell -NoProfile -ExecutionPolicy Bypass -File tools/smoke.ps1
  Checks: expected files exist; fences balanced in *.md; source encoding policy;
  validate-block.ps1 verdicts on two embedded ASCII micro-blocks (VALID + INVALID)
  plus a cross-field semantic bad-block (gender mismatch) and an INFO-lang probe;
  README metric row (M:chars marker) matches fresh measure.ps1 numbers.
  Exit 0 = all green. Exit 1 = list failures.
#>
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$fail = New-Object System.Collections.ArrayList
function Bad([string]$m) { [void]$fail.Add("SMOKE-FAIL: $m") }

$expected = @('SKILL.md','SKILL-CORE.md','RULES.md','SUNO-TAGS.md','ADAPTERS.md','LITE.md','LITE-TAGS.md','DEFAULTS.md','GUIDE.md','STYLE-NOTES.md','LINKS.md','README.md','VERSION.md','CHANGELOG.md','ENCODING.md','.editorconfig')
foreach ($f in $expected) { if (-not (Test-Path -LiteralPath (Join-Path $root $f))) { Bad ("missing file: " + $f) } }
foreach ($t in @('tools\validate-block.ps1','tools\suno-fill.user.js','tools\measure.ps1','tools\check-encoding.ps1')) { if (-not (Test-Path -LiteralPath (Join-Path $root $t))) { Bad ("missing tool: " + $t) } }

foreach ($f in (Get-ChildItem -LiteralPath $root -Filter '*.md' -Recurse | Where-Object { $_.FullName -notmatch '[\\/](tests|node_modules|\.git|dist|build|out|vendor|coverage|\.next|__pycache__)[\\/]' })) {
  $t = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
  if (([regex]::Matches($t, '```')).Count % 2 -ne 0) { Bad ("odd fences: " + $f.Name) }
}
$encodingOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools\check-encoding.ps1'))
if ($LASTEXITCODE -ne 0) { Bad ('source encoding policy failed: ' + ($encodingOut -join ' | ')) }

$validator = Join-Path $root 'tools\validate-block.ps1'
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) 'vave-smoke'
if (-not (Test-Path -LiteralPath $tmp)) { [void](New-Item -ItemType Directory -Path $tmp) }
$good = @'
TRACK:->

Smoke Good

LYRICS:->

[Intro]
[Main motif: soft piano lift]

[Verse 1]
[Male Vocal: low lead, calm]
Morning light across the floor,
Coffee steam and nothing more.

[End]

STYLES:->

120 BPM, gentle indie folk, 4/4 sway, key of C major, warm room tone,
Soft piano chords, brushed drums, airy pads,
Gentle male lead, warm backing on hooks,
Calm sunrise energy, tender and hopeful

MOREOPTIONS:->

Vocal Gender: none | Duration: Auto | Max Mode: Off | Weirdness: 40% | Style Influence: 70% | Variety: Normal | Personalize: Off
Exclude: Metal

INFO:->

request_shape: smoke; summary: smoke ok; vibe: calm; model: v6; lang: en; filename: smoke_good_v1_20260912-0000.txt; version: v1; created: 2026-09-12 00:00; Suno version: v6 family (v6), reference v2026-09-11; docs: synced 2026-09-12 (help.suno.com)
'@
$bad = $good -replace '\[Verse 1\]', '[SuperDropopy]'
$enc = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-good.txt'), $good, $enc)
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-bad.txt'), $bad, $enc)
$goodOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-good.txt') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -ne 0) { Bad ('validator rejected the micro good-block: ' + ($goodOut -join ' | ')) }
$goodLiteOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-good.txt') -TagsPath (Join-Path $root 'LITE-TAGS.md') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -ne 0) { Bad ('validator rejected the micro good-block with Lite tags: ' + ($goodLiteOut -join ' | ')) }
$badOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-bad.txt'))
if ($LASTEXITCODE -eq 0) { Bad ('validator accepted the micro bad-block: ' + ($badOut -join ' | ')) }

# Cross-field semantics: gender-switch mismatch must fail; INFO lang is required.
$semGender = ($good -replace 'Vocal Gender: none', 'Vocal Gender: Male') -replace '\[Male Vocal: low lead, calm\]', '[Female Vocal: low lead, calm]'
$noLang = $good -replace '; lang: en', ''
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-gender.txt'), $semGender, $enc)
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-nolang.txt'), $noLang, $enc)
$genderOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-gender.txt') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -eq 0) { Bad ('validator accepted the gender-mismatch block: ' + ($genderOut -join ' | ')) }
$noLangOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-nolang.txt') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -eq 0) { Bad ('validator accepted a block without INFO lang: ' + ($noLangOut -join ' | ')) }

# Reference provenance: ref_track requires ref_sources (ADAPTERS A7 / RULES R1).
$refOk = $good -replace 'docs: synced', 'ref_track: Someband - Some Song; ref_sources: MusicBrainz, Discogs; docs: synced'
$refBad = $good -replace 'docs: synced', 'ref_track: Someband - Some Song; docs: synced'
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-ref-ok.txt'), $refOk, $enc)
[System.IO.File]::WriteAllText((Join-Path $tmp 'smoke-ref-bad.txt'), $refBad, $enc)
$refOkOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-ref-ok.txt') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -ne 0) { Bad ('validator rejected ref_track+ref_sources: ' + ($refOkOut -join ' | ')) }
$refBadOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $validator -Path (Join-Path $tmp 'smoke-ref-bad.txt') -LyricsTier M -StylesTier M)
if ($LASTEXITCODE -eq 0) { Bad ('validator accepted ref_track without ref_sources: ' + ($refBadOut -join ' | ')) }

$readme = Join-Path $root 'README.md'
$rt = [System.IO.File]::ReadAllText($readme, [System.Text.Encoding]::UTF8)
# Metrics come from measure.ps1 (single source of truth: no duplicated file list here).
$measureOut = @(& powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools\measure.ps1'))
if ($LASTEXITCODE -ne 0) { Bad 'tools/measure.ps1 failed' }
$pro = $null; $lite = $null
foreach ($ln in $measureOut) {
  if ($ln -match '^PRO : (\d+) chars') { $pro = [int]$Matches[1] }
  elseif ($ln -match '^LITE: (\d+) chars') { $lite = [int]$Matches[1] }
}
if ($null -eq $pro -or $null -eq $lite) {
  Bad ('measure.ps1 output not parsed: ' + ($measureOut -join ' | '))
} else {
  foreach ($ln in ($rt -split "`r?`n")) {
    if ($ln -like '*M:chars*') {
      $cells = $ln -split '\|'
      if ([int]$cells[2] -ne $lite) { Bad ("README chars LITE stale: file has " + $cells[2].Trim() + ", fresh is " + $lite) }
      if ([int]$cells[3] -ne $pro) { Bad ("README chars PRO stale: file has " + $cells[3].Trim() + ", fresh is " + $pro) }
    }
  }
}
Remove-Item (Join-Path $tmp 'smoke-good.txt'), (Join-Path $tmp 'smoke-bad.txt'), (Join-Path $tmp 'smoke-gender.txt'), (Join-Path $tmp 'smoke-nolang.txt'), (Join-Path $tmp 'smoke-ref-ok.txt'), (Join-Path $tmp 'smoke-ref-bad.txt') -Force -ErrorAction SilentlyContinue

if ($fail.Count -gt 0) { foreach ($m in $fail) { Write-Output $m }; exit 1 }
Write-Output 'SMOKE-PASS: files, fences, UTF-8 BOM sources, validator micro-blocks, README metrics.'
exit 0
