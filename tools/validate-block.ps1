#Requires -Version 5.1
<#
.SYNOPSIS
  Structural validator for vave-suno-multiprompts section 5 parser blocks + Lyrics tag-cement check.
  Role (honest): STRUCTURAL/SYNTACTIC pass only - shape, key tags, blanks, MOREOPTIONS grammar, INFO stamps (incl. lang), bracket bans, tag cement, closer count, Styles 4-line shape, Exclude count+length, Title length, working caps, tier ceilings when flagged. NOT a full Skill validator.
  Out of scope by design (stay human in Self-check): mood-tension coherence, sung-line vocabulary (genre/mood/tempo words), artist-name/likeness/rights judgment, render-behavior prediction, the tier choice itself.
  Usage: powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate-block.ps1 -Path <block.txt> [-LyricsTier S|M|L|XL] [-StylesTier S|M|L|XL]
  Exit 0 = VALID (warnings allowed, listed). Exit 1 = INVALID (failures listed).
  Strictness model (closed vocab + E shapes): bare/parens heads matching A/B names FAIL
  (bracket it) -- checked on non-bracket lines, not just [lines]; other bracket heads
  outside A/B FAIL (unknown-tag) except an explicit color-noun allowlist (Acid Phase,
  Main theme -- extend only with operator-attested nouns); comma-shaped lines
  pass only as recognized concrete SFX cues; non-dictionary dash lines pass
  only as recognized instrument/gear cues; detail prefixes (Theme/Main motif/Dynamics/
  Transition/Vocal chops/Leads into) pass; gated tags WARN.
  STYLES brackets FAIL (rule 10: sound words only); MOREOPTIONS field
  names/order and invalid values FAIL.
  Instrument-cue colon lines (Drums/Bass/Guitar/Piano/Strings/Synth/Keys/Organ/Brass/Percussion, <=8 words) pass.
  F-lexicon combos (gender + F-group words parsed from the section F table, single line ending in vocal(s), <=8 words) pass via Test-VocalCombo.
  Cross-field semantics FAIL: Vocal Gender switch must agree with the lead vocal tags; instrumental STYLES ("no vocals, instrumental") forbids vocal tags and sung lines; INFO lang must be a 2-3 letter code. WARN: competing deliveries in one section, repeated Styles descriptors.
  Blank-line map: exactly one blank line before each A-table head, else FAIL (missing or multiple).
#>
param(
  [Parameter(Mandatory = $true)][string]$Path,
  [string]$TagsPath = '',
  [ValidateSet('S', 'M', 'L', 'XL')][string]$LyricsTier = '',
  [ValidateSet('S', 'M', 'L', 'XL')][string]$StylesTier = ''
)
$ErrorActionPreference = 'Stop'

# Emit stdout as UTF-8 so non-ASCII content (e.g. a non-English head quoted in a
# FAIL line) is not re-encoded to the console ANSI codepage (CP1251/CP866) and
# captured as mojibake. Hosts without a console keep their defaults.
try { [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding -ArgumentList $false } catch { }

$fail = New-Object System.Collections.ArrayList
$warn = New-Object System.Collections.ArrayList
function Add-Fail([string]$m) { [void]$fail.Add("FAIL: $m") }
function Add-Warn([string]$m) { [void]$warn.Add("WARN: $m") }

if ([string]::IsNullOrWhiteSpace($TagsPath)) {
  $TagsPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'SUNO-TAGS.md'
}
if (-not (Test-Path -LiteralPath $Path)) { Write-Output "FAIL: block file not found: $Path"; exit 1 }
if (-not (Test-Path -LiteralPath $TagsPath)) { Write-Output "FAIL: dictionary not found: $TagsPath"; exit 1 }

$lines = [System.IO.File]::ReadAllText((Resolve-Path -LiteralPath $Path).Path, [System.Text.Encoding]::UTF8) -split "`r?`n"
$tagLines = [System.IO.File]::ReadAllText((Resolve-Path -LiteralPath $TagsPath).Path, [System.Text.Encoding]::UTF8) -split "`r?`n"
$firstContent = @($lines | Where-Object { $_.Trim() -ne '' } | Select-Object -First 1)
if ($firstContent.Count -eq 0 -or $firstContent[0].Trim() -ne 'TRACK:->') { Add-Fail "TRACK:-> must be the first non-empty content" }
if (@($lines | Where-Object { $_.Trim().StartsWith('```') }).Count -gt 0) { Add-Fail "Markdown fences are not part of a raw parser block" }

function Get-SectionRange($all, $fromPrefix, $toPrefix) {
  $a = -1; $b = $all.Count
  for ($i = 0; $i -lt $all.Count; $i++) {
    if ($a -lt 0 -and $all[$i].Trim() -like ($fromPrefix + '*')) { $a = $i + 1 }
    elseif ($a -ge 0 -and $all[$i].Trim() -like ($toPrefix + '*')) { $b = $i; break }
  }
  if ($a -lt 0) { return @() }
  return $all[$a..($b - 1)]
}

function Get-BracketTokens($rows) {
  $out = @()
  foreach ($r in $rows) {
    if ($r -notmatch '^\|') { continue }
    $firstCell = ($r -split '\|')[1]
    if ($firstCell -eq $null) { continue }
    $ms = [regex]::Matches($firstCell, '`(\[[^\]]+\])`')
    foreach ($m in $ms) { $out += $m.Groups[1].Value }
  }
  return $out
}

$cementA = @()
$cementB = @()
$retired = @()
foreach ($t in (Get-BracketTokens (Get-SectionRange $tagLines '## A. Structure tags' '### A-gated'))) { $cementA += $t }
foreach ($t in (Get-BracketTokens (Get-SectionRange $tagLines '## B. Vocal tags' '## C. Service info'))) { $cementB += $t }
foreach ($t in (Get-BracketTokens (Get-SectionRange $tagLines '## X. Retired' '## E. Brief'))) { $retired += $t }
if ($cementA.Count -eq 0) {
  foreach ($t in (Get-BracketTokens (Get-SectionRange $tagLines '## A. Core structure heads' '## B. Core vocal tags'))) { $cementA += $t }
}
if ($cementB.Count -eq 0) {
  foreach ($t in (Get-BracketTokens (Get-SectionRange $tagLines '## B. Core vocal tags' '## E. Core brief patterns'))) { $cementB += $t }
}
if ($retired.Count -eq 0) { $retired = @('[Start]', '[Male]', '[Female]', '[Woman]', '[no vocals]', '[Dubstep Drop]', '[Emotional Moment]', '[Instrumental Hook]') }
# head prefixes of colon-form dictionary entries (e.g. Female Vocal Hook) are legal heads too
$extraHeads = @()
foreach ($t in ($cementA + $cementB)) {
  if ($t -match '^\[(.+?)\s*:') { $extraHeads += ('[' + $Matches[1].Trim() + ']') }
}
$allowedHeads = @($cementA + $cementB + $extraHeads | Sort-Object -Unique)

# Bare/parens-head names (lowercased, number- and tail-stripped) for the
# non-bracket-line check in section 7: CHORUS / Chorus 2 / (Chorus) must be
# bracketed per R4-1. Sung lines rarely equal a bare head name exactly, so an
# exact short match FAILs; comma-shaped SFX and punctuated sentences skip.
$bareNames = @()
foreach ($h in ($allowedHeads + @('[Key Change]', '[Tempo: slow]', '[Tempo Change]', '[Accel]', '[Ritardando]'))) {
  $inner = $h.Trim()
  if ($inner.StartsWith('[') -and $inner.EndsWith(']')) { $inner = $inner.Substring(1, $inner.Length - 2) }
  $inner = $inner.Trim()
  if ($inner -match ':') { $inner = ($inner -split ':', 2)[0].Trim() }
  if ($inner -match ' - ') { $inner = ($inner -split ' - ', 2)[0].Trim() }
  $inner = $inner -replace ' \d+$', ''
  if ($inner -ne '') { $bareNames += $inner.ToLower() }
}
$bareNames = @($bareNames | Sort-Object -Unique)

function Test-HeadAllowed($head) {
  if ($allowedHeads -contains $head) { return $true }
  $numbered = $head -replace ' \d+\]$', ']'
  if ($allowedHeads -contains $numbered) { return $true }
  return $false
}

function Test-StructHead($head) {
  if ($cementA -contains $head) { return $true }
  $numbered = $head -replace ' \d+\]$', ']'
  if ($cementA -contains $numbered) { return $true }
  return $false
}

# F-lexicon words parsed from the SUNO-TAGS.md section F table itself
# (single source of truth: no second hardcoded copy to drift).
function Get-LexiconWords($tagLines) {
  $rows = Get-SectionRange $tagLines '## F. Vocal spec lexicon' '## G. Mood parens lexicon'
  $out = @()
  foreach ($r in $rows) {
    if ($r -notmatch '^\|') { continue }
    $cells = $r -split '\|'
    if ($cells.Count -lt 3) { continue }
    $group = $cells[1].Trim()
    $words = $cells[2].Trim()
    if ($group -eq 'Group' -or $words -eq 'Words') { continue }
    if ($group -match '^[-\s]+$' -or $words -match '^[-\s]+$') { continue }
    foreach ($w in ($words -split ',')) {
      $t = $w.Trim().ToLower()
      if ($t -ne '') { $out += $t }
    }
  }
  return ($out | Sort-Object -Unique)
}
$lexWords = Get-LexiconWords $tagLines
$comboGender = @('male', 'female')

  # Tier ceilings (heuristic_cap, SKILL.md size tiers) + working caps (lyrics 5000 / styles 1000 / title 100 / exclude 1000 chars - all officially unverified, enforced until live says otherwise).
$lyricsTiers = @{ S = 1000; M = 3000; L = 4000; XL = 5000 }
$stylesTiers = @{ S = 250; M = 600; L = 800; XL = 900 }
$workLyricsCap = 5000
$workStylesCap = 1000
$workTitleCap = 100
$heurTitleCap = 80
$workExcludeCap = 1000
$closers = @('[Outro]', '[Ending]', '[Fade Out]', '[End]', '[Big Finish]')
$workInfoCap = 4000

function Test-SfxCue($inner) {
  if ($inner -notmatch ',') { return $false }
  $soundWords = '(?i)\b(crackle|waves?|shouting|slam|thunder|rain|wind|siren|footsteps?|door|crowd|glass|gunshot|explosion|birds?|traffic|phone|bells?|alarm|static|heartbeat|applause|laughter|scream|whisper|clap|snap|bang|hum|buzz|roar|rumble|drip|splash|engine|train|clock|tick|chain|rattle)\b'
  $parts = @($inner -split ',')
  if ($parts.Count -lt 2 -or $parts.Count -gt 3) { return $false }
  foreach ($p in $parts) {
    if ($p.Trim() -notmatch $soundWords) { return $false }
  }
  return $true
}

function Test-InstrumentDashCue($base) {
  # Broad real-gear vocabulary (word-boundary anchored) so a free instrument
  # brief "[<gear> - <settings>]" is not rejected merely for an uncommon name;
  # invented heads ("Nebula Machine", "Organism") still miss every token.
  return ($base -match '(?i)\b(kick|snare|hi-?hat|hats?|drums?|bass(?:es)?|sub[- ]?bass|guitars?|guit|riffs?|piano|rhodes|wurlitzer|clavinet|harpsichord|celesta|organ|harmonium|accordion|concertina|bandoneon|melodeon|synths?|moog|prophet|juno|mellotron|pads?|keys|arp(?:eggio)?|strings?|violin|viola|cello|contrabass|harp|lute|oud|sitar|sarod|erhu|koto|shamisen|pipa|bouzouki|mandolin|banjo|ukulele|dobro|brass|trumpet|flugelhorn|trombone|tuba|horn|sax(?:ophone)?|clarinet|oboe|bassoon|recorder|flute|piccolo|ocarina|whistle|harmonica|theremin|percussion|congas?|bongos?|djembe|tabla|taiko|timbales|timpani|tympani|gong|chimes?|bells?|glockenspiel|xylophone|vibraphone|marimba|kalimba|shaker|tambourine|cymbal|toms?|woodwinds?)\b')
}

function Test-IsoDate($value) {
  $parsed = [datetime]::MinValue
  return [datetime]::TryParseExact($value, 'yyyy-MM-dd', [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None, [ref]$parsed)
}

# F-lexicon combo: single line ending in vocal(s), every word partitioned
# into gender + F-group phrases, <=8 words total, >=1 real F-group word.
# Anything outside the classes (names, inventions) falls through to unknown-tag.
function Test-VocalCombo($inner) {
  $s = $inner.Trim().ToLower() -replace '\s+', ' '
  if (($s -split ' ').Count -gt 8) { return $false }
  $m = [regex]::Match($s, '^(.*)\s+vocal(s)?$')
  if (-not $m.Success) { return $false }
  $body = $m.Groups[1].Value.Trim()
  if ($body -eq '') { return $false }
  $phrases = @($lexWords + $comboGender | Sort-Object -Unique)
  $words = @($body -split ' ')
  $i = 0
  $usedF = $false
  while ($i -lt $words.Count) {
    $hit = $null; $hitLen = 0
    for ($len = 3; $len -ge 1; $len--) {
      if ($i + $len -gt $words.Count) { continue }
      $cand = ($words[$i..($i + $len - 1)] -join ' ')
      if ($phrases -contains $cand) { $hit = $cand; $hitLen = $len; break }
    }
    if ($hit -eq $null) { return $false }
    if ($lexWords -contains $hit) { $usedF = $true }
    $i += $hitLen
  }
  return $usedF
}

function Get-HeadBase($inner) {
  $b = $inner
  if ($b -match ':') { $b = ($b -split ':', 2)[0] }
  elseif ($b -match ' - ') { $b = ($b -split ' - ', 2)[0] }
  return $b.Trim()
}

# Single definition of "well-formed [bracket] line" for the tag loop, 7b, 7c.
# Returns inner text ('' for "[]"), or $null for anything else (empty, plain,
# or unbalanced lines). Callers keep their own malformed-vs-skip policy.
function Get-BracketInner($line) {
  $t = $line.Trim()
  if ($t.Length -lt 2 -or $t[0] -ne '[' -or $t[-1] -ne ']') { return $null }
  return $t.Substring(1, $t.Length - 2)
}

# ---- 1. key tags: exactly 5, in order, alone on their lines ----
$expected = @('TRACK:->', 'LYRICS:->', 'STYLES:->', 'MOREOPTIONS:->', 'INFO:->')
$found = @()
for ($i = 0; $i -lt $lines.Count; $i++) {
  $t = $lines[$i].Trim()
  if ($t -match '^[A-Z]+:->$') { $found += @{ Tag = $t; Line = $i } }
}
$foundSeq = @($found | ForEach-Object { $_.Tag })
if (($foundSeq -join '|') -ne ($expected -join '|')) {
  Add-Fail ("key tags must be exactly [" + ($expected -join ', ') + "] in order; found [" + ($foundSeq -join ', ') + "]")
} else {
  # ---- 2. blank-line contract ----
  foreach ($f in $found) {
    $li = $f.Line
    if ($li + 1 -ge $lines.Count -or $lines[$li + 1].Trim() -ne '') { Add-Fail ("no blank line after key tag " + $f.Tag); continue }
    if ($f.Tag -ne 'TRACK:->') {
      if ($lines[$li - 1].Trim() -ne '') { Add-Fail ("no blank line before key tag " + $f.Tag) }
    }
  }
  # ---- 3. section values ----
  $vals = @{}
  for ($k = 0; $k -lt $found.Count; $k++) {
    $start = $found[$k].Line + 2
    if ($k + 1 -lt $found.Count) { $end = $found[$k + 1].Line - 2 } else { $end = $lines.Count - 1 }
    $v = @()
    if ($start -le $end) { $v = $lines[$start..$end] }
    while ($v.Count -gt 0 -and $v[-1].Trim() -eq '') { $v = $v[0..($v.Count - 2)] }
    $vals[$found[$k].Tag] = $v
  }
  foreach ($tag in $expected) {
    if ($vals[$tag].Count -eq 0) { Add-Fail ("empty value for " + $tag) }
  }
  # ---- 3b. section lengths, computed once and reused below (INFO line, 6e) ----
  $nLyrics = ($vals['LYRICS:->'] -join "`n").Length
  $nStyles = ($vals['STYLES:->'] -join "`n").Length
  # ---- 4. MOREOPTIONS grammar ----
  if ($vals.ContainsKey('MOREOPTIONS:->')) {
    $ml = @($vals['MOREOPTIONS:->'] | Where-Object { $_.Trim() -ne '' })
    if ($ml.Count -ne 2) { Add-Fail ("MOREOPTIONS must be exactly 2 lines (7-field + Exclude), found " + $ml.Count + " (a merged Personalize/Exclude junction is the usual cause - split them)") }
    else {
      if ((($ml[0] -split '\|').Count) -ne 7) { Add-Fail "MOREOPTIONS 7-field line must have 7 pipe-separated fields" }
      else {
        $names = @(($ml[0] -split '\|') | ForEach-Object { ($_ -split ':', 2)[0].Trim().ToLower() })
        $canon = @('vocal gender', 'duration', 'max mode', 'weirdness', 'style influence', 'variety', 'personalize')
        if (($names -join '|') -ne ($canon -join '|')) { Add-Fail "MOREOPTIONS field names/order differ from canonical 7 (Vocal Gender/Duration/Max Mode/Weirdness/Style Influence/Variety/Personalize)" }
        else {
          $parts = @($ml[0] -split '\|')
          $values = @()
          foreach ($part in $parts) { $values += (($part -split ':', 2)[1]).Trim() }
          if ($values[0] -notmatch '^(?i:Male|Female|none)$') { Add-Fail ("invalid Vocal Gender value: " + $values[0]) }
          if ($values[1] -notmatch '^(?i:Auto|Custom [0-9]{1,2}:[0-5][0-9])$') { Add-Fail ("invalid Duration value: " + $values[1]) }
          if ($values[2] -notmatch '^(?i:Off|On)$') { Add-Fail ("invalid Max Mode value: " + $values[2]) }
          foreach ($pair in @(@('Weirdness', $values[3]), @('Style Influence', $values[4]))) {
            if ($pair[1] -notmatch '^(100|[0-9]{1,2})%$') { Add-Fail ("invalid " + $pair[0] + " value: " + $pair[1]) }
          }
          if ($values[5] -notmatch '^(?i:Off|Normal|High|Extra|Max)$') { Add-Fail ("invalid Variety value: " + $values[5]) }
          if ($values[6] -notmatch '^(?i:Off)$') { Add-Fail ("invalid Personalize value (policy requires Off): " + $values[6]) }
        }
      }
      if ($ml[1] -notmatch '^Exclude:') { Add-Fail "MOREOPTIONS second line must be the Exclude: line" }
    }
  }
  # ---- 5. INFO required stamps + provenance warnings ----
  if ($vals.ContainsKey('INFO:->')) {
    $info = ($vals['INFO:->'] -join "`n")
    $infoLines = @($vals['INFO:->'] | Where-Object { $_.Trim() -ne '' })
    if ($infoLines.Count -ne 1) { Add-Fail ("INFO must be exactly one physical value line; found " + $infoLines.Count) }
    if ($info.Length -gt $workInfoCap) { Add-Fail ("INFO N=" + $info.Length + " exceeds working cap " + $workInfoCap) }
    foreach ($fieldSpec in @('request[_ ]shape', 'summary', 'vibe', 'model', 'version', '(?:created|time)', 'Suno version', 'docs')) {
      $fieldCount = [regex]::Matches($info, ('(?i)(?:^|[;/|]\s*)' + $fieldSpec + ':')).Count
      if ($fieldCount -ne 1) { Add-Fail ("INFO must contain exactly one " + $fieldSpec + " field; found " + $fieldCount) }
    }
    if ($info -notmatch '(?i)(?:^|[;/|]\s*)model:\s*(v6|v6-wild|v6-mini)\s*(?:[;/|]|$)') { Add-Fail "INFO model must be v6 | v6-wild | v6-mini" }
    if ($info -notmatch '(?i)(?:^|[;/|]\s*)lang:\s*[A-Za-z]{2,3}\s*(?:[;/|]|$)') { Add-Fail "INFO lang must be a 2-3 letter code (en | ru | ...)" }
    if ($info -notmatch 'Suno version:') { Add-Fail "INFO missing 'Suno version:'" }
    elseif ($info -notmatch 'Suno version:\s*(v6 family \([^;]+\), reference v[0-9]{4}-[0-9]{2}-[0-9]{2}|current web custom mode, exact build unavailable)') { Add-Fail "INFO has unsupported or malformed 'Suno version:' value" }
    $versionDateHit = [regex]::Match($info, 'Suno version:\s*v6 family \([^;]+\), reference v([0-9]{4}-[0-9]{2}-[0-9]{2})')
    if ($versionDateHit.Success -and -not (Test-IsoDate $versionDateHit.Groups[1].Value)) { Add-Fail "INFO Suno version reference carries an impossible date" }
    if ($info -notmatch 'docs:') { Add-Fail "INFO missing 'docs:'" }
    $fileFields = [regex]::Matches($info, '(?:^|[;/]\s*)(?:file|filename):')
    if ($fileFields.Count -ne 1) { Add-Fail ("INFO must contain exactly one file/filename field; found " + $fileFields.Count) }
    $fileHit = [regex]::Match($info, '(?:^|[;/]\s*)(?:file|filename):\s*([a-z0-9_-]+)_v([0-9]+)_([0-9]{8}-[0-9]{4})\.txt\s*(?:;|/|$)')
    if (-not $fileHit.Success) { Add-Fail "INFO missing canonical filename <slug>_v<N>_<YYYYMMDD-HHMM>.txt" }
    else {
      if ($fileHit.Groups[1].Value.Length -gt 40) { Add-Fail "INFO filename slug exceeds 40 chars" }
      $fileDate = [datetime]::MinValue
      if (-not [datetime]::TryParseExact($fileHit.Groups[3].Value, 'yyyyMMdd-HHmm', [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None, [ref]$fileDate)) { Add-Fail "INFO filename carries an impossible date/time" }
    }
    if ($info -notmatch 'docs:\s*(synced [0-9]{4}-[0-9]{2}-[0-9]{2} \([^;]+\)|not synced, embedded reference only|Lite v[0-9.]+ snapshot dated [0-9]{4}-[0-9]{2}-[0-9]{2}|LITE\.md v[0-9.]+ and LITE-TAGS\.md [0-9]{4}-[0-9]{2}-[0-9]{2})') { Add-Fail "INFO has malformed docs stamp" }
    $docsDateHit = [regex]::Match($info, 'docs:\s*(?:synced |Lite v[0-9.]+ snapshot dated |LITE\.md v[0-9.]+ and LITE-TAGS\.md )([0-9]{4}-[0-9]{2}-[0-9]{2})')
    if ($docsDateHit.Success -and -not (Test-IsoDate $docsDateHit.Groups[1].Value)) { Add-Fail "INFO docs stamp carries an impossible date" }
    if ($info -match '(?i)(?:^|[;/|]\s*)(STATE\s+v|DNA:|TRACK:)') { Add-Fail "INFO contains reserved STATE/DNA/TRACK field" }
    # Provenance (contract CORE C2/R1, enforced as WARN to never break
    # non-reference tracks): reference-like INFO without ref_track, or
    # ref_url without import:.
    if (($info -match '(?i)reference track|sound-alike|Like .+-') -and ($info -notmatch 'ref_track:')) { Add-Warn "INFO mentions a reference track but misses 'ref_track:' (provenance required)" }
    if ($info -match 'ref_url:') {
      if ($info -notmatch '(?i)(?:^|[;/|]\s*)import:\s*(full|partial|reference-only|refused\+why)\s*(?:[;/|]|$)') { Add-Fail "INFO ref_url requires import: full | partial | reference-only | refused+why" }
    }
    $refHit = [regex]::Match($info, '(?i)ref_track:\s*([^;|]+?)\s+[-\u2013\u2014]\s+([^;|]+)')
    if ($refHit.Success) {
      $artist = $refHit.Groups[1].Value.Trim()
      $refTitle = $refHit.Groups[2].Value.Trim()
      $sunoRows = @($vals['TRACK:->'] + $vals['LYRICS:->'] + $vals['STYLES:->'] + $vals['MOREOPTIONS:->'])
      $sunoFields = ($sunoRows -join "`n")
      $artistPattern = '(?i)(?<![A-Za-z0-9])' + [regex]::Escape($artist) + '(?![A-Za-z0-9])'
      if ($artist.Length -ge 2 -and $sunoFields -match $artistPattern) { Add-Fail "reference artist leaked into Suno fields" }
      if ($refTitle.Length -ge 8 -and $refTitle -match '\s' -and $sunoFields.IndexOf($refTitle, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) { Add-Fail "reference title leaked into Suno fields" }
      elseif (@($sunoRows | Where-Object { $_.Trim().Equals($refTitle, [System.StringComparison]::OrdinalIgnoreCase) }).Count -gt 0) { Add-Fail "reference title leaked as an exact Suno-field line" }
    }
    if (($info -match '(?i)(?:^|[;/|]\s*)ref_track:') -and ($info -notmatch '(?i)(?:^|[;/|]\s*)ref_sources:\s*\S')) { Add-Fail "INFO ref_track requires ref_sources: (provenance required; ADAPTERS A7 / RULES R1)" }
  }
  # ---- 6b. STYLES carries no bracket tags (rule 10: sound words only) ----
  if ($vals.ContainsKey('STYLES:->')) {
    $sHit = @($vals['STYLES:->'] | Where-Object { $_ -match '\[' -or $_ -match '\]' })
    if ($sHit.Count -gt 0) { Add-Fail "STYLES:-> must carry no bracket tags (sound words only)" }
  }
  # ---- 6c. STYLES is exactly 4 physical lines (one part per line) ----
  if ($vals.ContainsKey('STYLES:->')) {
    $sLines = @($vals['STYLES:->'] | Where-Object { $_.Trim() -ne '' })
    if ($sLines.Count -ne 4) { Add-Fail ("STYLES must be exactly 4 physical lines (one part per line), found " + $sLines.Count) }
  }
  # ---- 6d. Exclude holds at most 3 items ----
  if ($vals.ContainsKey('MOREOPTIONS:->')) {
    $exLine = @($vals['MOREOPTIONS:->'] | Where-Object { $_ -match '^Exclude:' })
    if ($exLine.Count -gt 0) {
      $exVal = ($exLine[0] -replace '^Exclude:', '').Trim()
      if ($exVal -ne '' -and $exVal.ToLower() -ne 'none') {
        $exCount = @($exVal -split ',' | Where-Object { $_.Trim() -ne '' }).Count
        if ($exCount -gt 3) { Add-Fail ("Exclude holds at most 3 items, found " + $exCount) }
        # Exclude char cap (1000) is the live-observed box limit (2026-09-14; earlier 200 lineage superseded).
        # corroboration) -- enforced as WARN, not FAIL; the count above stays FAIL.
        if ($exVal.Length -gt $workExcludeCap) { Add-Warn ("Exclude text N=" + $exVal.Length + " over working cap " + $workExcludeCap + " (single lineage, verify live)") }
      }
    }
  }
  # ---- 6e. working caps (always) + tier ceilings (only when flagged) ----
  if ($vals.ContainsKey('LYRICS:->')) {
    if ($nLyrics -gt $workLyricsCap) { Add-Fail ("LYRICS N=" + $nLyrics + " exceeds working cap " + $workLyricsCap) }
    if ($LyricsTier -ne '' -and $nLyrics -gt $lyricsTiers[$LyricsTier]) { Add-Fail ("LYRICS N=" + $nLyrics + " exceeds " + $LyricsTier + " ceiling " + $lyricsTiers[$LyricsTier]) }
  }
  if ($vals.ContainsKey('STYLES:->')) {
    if ($nStyles -gt $workStylesCap) { Add-Fail ("STYLES N=" + $nStyles + " exceeds working cap " + $workStylesCap) }
    if ($StylesTier -ne '' -and $nStyles -gt $stylesTiers[$StylesTier]) { Add-Fail ("STYLES N=" + $nStyles + " exceeds " + $StylesTier + " ceiling " + $stylesTiers[$StylesTier]) }
  }
  # ---- 6f. Title working cap 100 (FAIL) + heuristic 80 (WARN) ----
  if ($vals.ContainsKey('TRACK:->')) {
    $nT = ($vals['TRACK:->'] -join "`n").Length
    if ($nT -gt $workTitleCap) { Add-Fail ("Title N=" + $nT + " exceeds working cap " + $workTitleCap) }
    elseif ($nT -gt $heurTitleCap) { Add-Warn ("Title N=" + $nT + " over heuristic cap 80 (auto-shorten policy)") }
  }
  # ---- 7. LYRICS tag-cement check ----
  if ($vals.ContainsKey('LYRICS:->')) {
    $lv = ($vals['LYRICS:->'] -join "`n")
    if ($lv -match '\(x2\)' -or $lv -match '\(repeat\)') { Add-Fail "LYRICS uses banned (x2)/(repeat) notation -- write repeats out" }
    foreach ($ln in $vals['LYRICS:->']) {
      $t = $ln.Trim()
      if ($t -eq '') { continue }
      if ($t[0] -ne '[') {
        # Bare/parens-head check (R4-1): CHORUS / Chorus 2 / (Chorus) must be
        # bracketed. Only exact short matches FAIL; sung sentences skip.
        $pm = [regex]::Match($t, '^\((.+)\)$')
        if ($pm.Success) {
          $pinner = $pm.Groups[1].Value.Trim() -replace ' \d+$', ''
          if ($bareNames -contains $pinner.ToLower()) { Add-Fail ("bare/parens head, bracket it: " + $t) }
          continue
        }
        $bl = ($t -replace ' \d+$', '').Trim()
        if (($bareNames -contains $bl.ToLower()) -and ($t -notmatch '[.,!?;:]') -and (($t -split '\s+').Count -le 3)) { Add-Fail ("bare head, bracket it: " + $t) }
        continue
      }
      if ($t[-1] -ne ']') { Add-Fail ("malformed bracket line: " + $t); continue }
      $inner = Get-BracketInner $ln
      if ($inner -match '\p{IsCyrillic}') { Add-Fail ("non-English head: " + $t); continue }
      if ($inner -match '^\s*(Tempo|Key|BPM)\s*:' -and $inner -match '[0-9]') { Add-Fail ("numeric tempo/key control in Lyrics: " + $t); continue }
      $base = Get-HeadBase $inner
      if (($retired -contains ('[' + $inner + ']')) -or ($retired -contains ('[' + $base + ']'))) { Add-Fail ("retired/denied form (section X): " + $t); continue }
      if ($inner -match '^(Theme|Main motif|Dynamics|Transition)\s*:') { continue }
      if ($inner -match '^(Female |Male )?Vocal Hook\b') { continue }
      if ($inner -match '^(Drums|Bass|Guitar|Piano|Strings|Synth|Keys|Organ|Brass|Percussion)\s*:' -and (($inner -split '\s+').Count -le 8)) { continue }
      if ($inner -match '^(Drums|Bass|Guitar|Piano|Strings|Synth|Keys|Organ|Brass|Percussion)\s*:') { Add-Fail ("instrument cue over 8 words: " + $t); continue }
      if (Test-VocalCombo $inner) { continue }
      if (Test-HeadAllowed ('[' + $inner + ']')) { continue }
      if (Test-HeadAllowed ('[' + $base + ']')) { continue }
      $gatedHit = $false
      foreach ($g in @('[Key Change]', '[Tempo: slow]', '[Tempo Change]', '[Accel]', '[Ritardando]')) {
        if (('[' + $base + ']') -eq $g) { Add-Warn ("gated tag needs explicit request or proven render: " + $t); $gatedHit = $true }
      }
      if ($gatedHit) { continue }
      if ($base -match '^(Theme|Main motif|Dynamics|Transition|Vocal chops|Leads into)\b') { continue }
      if ($base -match ',') {
        if (Test-SfxCue $inner) { continue }
        Add-Fail ("unknown comma-shaped bracket line (not a concrete SFX cue): " + $t); continue
      }
      if (@('Acid Phase', 'Main theme') -contains $base) { continue }
      if ($inner -match ' - ') {
        if (Test-InstrumentDashCue $base) { continue }
        Add-Fail ("non-dictionary dash line: " + $t); continue
      }
      Add-Fail ("unknown-tag (closed vocab A/B + E shapes; color nouns Acid Phase/Main theme only): " + $t)
    }
    # ---- 7b. exactly one blank line before each structure (A-table) head ----
    # Vocal (B) heads, briefs, cues and sung lines stay glued: only A-heads
    # open a section, so only they require the blank. Head at value start (i=0) needs none.
    $lr = $vals['LYRICS:->']
    for ($i = 0; $i -lt $lr.Count; $i++) {
      $inner = Get-BracketInner $lr[$i]
      if ($inner -eq $null) { continue }
      $t = $lr[$i].Trim()
      $base = Get-HeadBase $inner
      if (-not (Test-StructHead ('[' + $base + ']'))) { continue }
      if ($i -eq 0) { continue }
      if ($lr[$i - 1].Trim() -ne '') { Add-Fail ("missing blank line before structure head: " + $t); continue }
      if ($i -ge 2 -and $lr[$i - 2].Trim() -eq '') { Add-Fail ("multiple blank lines before structure head: " + $t); continue }
    }
    # ---- 7c. exactly one closer (RULES R4-5) ----
    $closeCount = 0
    $lastCloserIndex = -1
    $laterStructAfterCloser = $false
    for ($ci = 0; $ci -lt $vals['LYRICS:->'].Count; $ci++) {
      $ln = $vals['LYRICS:->'][$ci]
      $inner = Get-BracketInner $ln
      if ($inner -eq $null) { continue }
      $cb = Get-HeadBase $inner
      $cbNorm = '[' + ($cb -replace ' \d+$', '') + ']'
      if ($closers -contains $cbNorm) { $closeCount++; $lastCloserIndex = $ci; continue }
      if ($lastCloserIndex -ge 0 -and (Test-StructHead ('[' + $cb + ']'))) { $laterStructAfterCloser = $true }
    }
    if ($closeCount -ne 1) { Add-Fail ("LYRICS must end with exactly one closer (Outro/Ending/Fade Out/End/Big Finish), found " + $closeCount) }
    elseif ($laterStructAfterCloser) { Add-Fail "LYRICS contains a structure section after its sole closer" }
    # ---- 7d. cross-field semantics (a/b/c FAIL; d/e WARN) ----
    $sLinesAll = @($vals['STYLES:->'] | Where-Object { $_.Trim() -ne '' })
    $inst = ($sLinesAll.Count -ge 3 -and $sLinesAll[2] -match '(?i)\b(no vocals|instrumental)\b')
    $vg = ''
    if ($vals.ContainsKey('MOREOPTIONS:->')) {
      $ml0 = @($vals['MOREOPTIONS:->'] | Where-Object { $_.Trim() -ne '' })
      if ($ml0.Count -ge 1 -and $ml0[0] -match '(?i)Vocal Gender:\s*(Male|Female|none)') { $vg = $Matches[1] }
    }
    $maleLead = $false; $femaleLead = $false; $anyVocal = $false
    $secWhisper = $false; $secLoud = $false; $secName = ''
    foreach ($ln in $vals['LYRICS:->']) {
      $t = $ln.Trim(); if ($t -eq '') { continue }
      $inner = Get-BracketInner $ln
      if ($inner -eq $null) { continue }
      $b = ($inner -split ':', 2)[0]; $b = (($b -split ' - ', 2)[0]).Trim()
      $bracket = '[' + $b + ']'
      if (Test-StructHead $bracket) {
        if ($secWhisper -and $secLoud) { Add-Warn ("competing vocal deliveries in section " + $secName + " (whisper + loud)") }
        $secWhisper = $false; $secLoud = $false; $secName = $t; continue
      }
      $isVocal = ($cementB -contains $bracket) -or ($extraHeads -contains $bracket) -or (Test-VocalCombo $inner)
      if ($isVocal) {
        $anyVocal = $true
        $lb = $inner.ToLower()
        if ($lb -match '(^|\s)male(\s|$)' -or $lb -match '^male vocal') { $maleLead = $true }
        if ($lb -match '(^|\s)female(\s|$)' -or $lb -match '^female vocal') { $femaleLead = $true }
        if ($lb -match 'whisper') { $secWhisper = $true }
        if ($lb -match 'belt|shout|scream|brutal|aggressive') { $secLoud = $true }
      }
    }
    if ($secWhisper -and $secLoud) { Add-Warn ("competing vocal deliveries in section " + $secName + " (whisper + loud)") }
    if ($vg -eq 'Male' -and $femaleLead -and -not $maleLead) { Add-Fail "Vocal Gender: Male but Lyrics has only female vocal leads" }
    if ($vg -eq 'Female' -and $maleLead -and -not $femaleLead) { Add-Fail "Vocal Gender: Female but Lyrics has only male vocal leads" }
    if (($vg -eq 'Male' -or $vg -eq 'Female') -and -not $anyVocal -and -not $inst) { Add-Warn ("Vocal Gender: " + $vg + " set but no per-part vocal tag in Lyrics") }
    if ($inst) {
      if ($anyVocal) { Add-Fail "STYLES say instrumental but Lyrics carries vocal tags" }
      $sung = @($vals['LYRICS:->'] | Where-Object { $_.Trim() -ne '' -and -not $_.Trim().StartsWith('[') })
      if ($sung.Count -gt 0) { Add-Fail ("STYLES say instrumental but Lyrics carries sung lines (" + $sung.Count + ")") }
      elseif ($vg -eq 'Male' -or $vg -eq 'Female') { Add-Warn "STYLES say instrumental but Vocal Gender switch is set" }
    }
    $stop = @('vocals', 'vocal', 'voice', 'lead', 'backing', 'hook', 'hooks', 'drums', 'drum', 'bass', 'layers', 'layer', 'synth', 'synths', 'texture', 'rhythm', 'energy', 'delivery', 'groove', 'sound', 'style', 'chord', 'chords', 'mix', 'room', 'main', 'theme')
    $seen = @{}; $dup = @()
    foreach ($l in $sLinesAll) {
      $toks = @(($l.ToLower() -split '[^a-z0-9]+') | Where-Object { $_.Length -ge 5 -and ($stop -notcontains $_) } | Select-Object -Unique)
      foreach ($tk in $toks) { if ($seen.ContainsKey($tk)) { if ($dup -notcontains $tk) { $dup += $tk } } else { $seen[$tk] = $true } }
    }
    if ($dup.Count -gt 0) { Add-Warn ("Styles parts share descriptors: " + ($dup -join ', ')) }
    Write-Output ("INFO: N lyrics=" + $nLyrics + " styles=" + $nStyles)
  }
}

foreach ($w in $warn) { Write-Output $w }
foreach ($m in $fail) { Write-Output $m }
if ($fail.Count -gt 0) { Write-Output ("INVALID: " + $fail.Count + " failure(s) in " + $Path); exit 1 }
Write-Output ("VALID: " + $Path)
exit 0
