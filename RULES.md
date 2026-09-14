# RULES.md — normative policy for vave-suno-multiprompts (all variants, all stands)

- Status: HARD policy — no stand, profile, or variant degrades this file. Process lives in `SKILL-CORE.md`; vocabulary in `SUNO-TAGS.md`; all environment verbs (read, write, run, fetch, remember) live in adapters. This file contains zero of them.
- How to read: R1 = rights boundary; R2 = never-mix; R3 = budgets, tiers, caps; R4 = combination rules; R5 = brackets verdict; R6 = Styles 4-part; R7 = detail budget and engine; R8 = More Options table and presets; R9 = Self-check gate.
- Precedence: R1 > safety > explicit user edit > correction minimality.

## Scope (out of scope everywhere, all stands)

API bots, batch generation, billing/keys, covers/video, mastering outside Suno, music lessons, ESuno app/C#/ini edits, programmatic LLM-API work (code, keys, JSON schemas in outputs), secrets. Local fill via the userscript is allowed (4 text fields + the seven More Options controls, forces Advanced; never submits). No API keys, no login automation — ever.

## R1. Copyright hard boundary

Suno policy (community guidelines) covers: uploading copyrighted material, reproducing existing songs, using a real person's voice or likeness without permission. This skill additionally never emits real artist names as style targets and never bypasses blocks.

- Refuse + explain + offer a sound-alike for: real performer/group names, unlicensed third-party track titles in Styles/Lyrics, unlicensed third-party lyric matches (whole verses/choruses or protected fragments).
- Existing songs' hook lines never enter any field — not even inside user-supplied examples or chop demos. Rewrite the function with original syllables and words (chant the rhythm, not the line).
- Allowed and required: real instrument, style, technique, and slang names (`808 drum machine`, `Hammond organ`, `falsetto`, `gated reverb`). This is vocabulary, not rights.
- Broad timbre archetypes (`gritty`, `soulful`, `chest voice`, `rough-edged rap tone`) are vocabulary too. Imitating a real named singer's voice stays banned.
- Detail breakdown never lifts the ban: closer study means stricter sound-alike discipline, not looser.
- Reference work is provenance, not content: real names and titles belong ONLY in the human summary and INFO `ref_track`/`ref_sources` (optional compact `ref_dossier`). The Reference Dossier (CORE Injects / ADAPTERS A7) never reaches Lyrics/Styles/Title/Exclude — only its traits (genre, era, instrumentation, arrangement, vocal, production) do, re-authored as original vocabulary.

## R2. Never-mix rules

- No prose sentences in Styles. No genre/mood/tempo words in sung lines (bracket briefs per E carry production vocabulary; full genre/mood/tempo spec lives in Styles). No artist names, unlicensed third-party titles, or unlicensed third-party lyric chunks in Suno fields; summary/INFO may name a reference only as provenance. No engineering parameters (compression ratios, EQ numbers, mix automation, exact dB) — describe the musical result instead. No `do not infer`-style broad bans: state the positive scope (`deduce strictly from the provided text; introduce no outside facts`). Instrumental tracks: Styles part 3 = `no vocals, instrumental` (vocal part never invented for instrumentals).

## R3. Budgets, tiers, caps

- Size tiers are ceilings only (no lower bound, no target band). The chosen tier is the ceiling for the package; working caps stay above it as the outer wall; tier tops are heuristic operating ceilings.
- `lyrics_size`: S≤1000 / M≤3000 / L≤4000 / XL≤5000 chars. `styles_size`: S≤250 / M≤600 / L≤800 / XL≤900 chars (XL parked under the working cap ~1000, V6 unverified — raise only after live verification). Default M/M. An explicit tier choice always wins. No-padding rule: stuffing filler to reach the band is forbidden; below-top is allowed with a `filled N — no filler` report. Texture rule: when the ceiling would audibly cost signature texture (backing stacks, peak layers), raise the tier explicitly and note it — never silently cut signature texture.
- Cap classes (never mix them):
  - `verified_cap`: a number published in a Suno-owned source. Today Suno publishes NO char caps — every number below is working or heuristic until confirmed. (Feature facts ARE verified: v6 family/tiers, Variety Off=0, Max Mode cost, Vocal Gender presence. Char counts are not.)
  - `working_cap`: best-known value from multi-source observation — enforced, re-verified live; if the live box disagrees, the box wins. Lyrics 5000 (HG V6 + stable use). Styles 1000 (live maxlength observed 2026-09-12 via on-page diagnostics; still unpublished by Suno; earlier lineage V4.5–V5.5 third-party). Title 100 (live-observed). Exclude 200 chars (single lineage — needs corroboration; the validator enforces the ≤3-item count as FAIL and the 200-char length as WARN).
  - `heuristic_cap`: operator-safe policy — title 80 conservative (auto-shorten over), Exclude ≤3 focused items, all tier tops.
- Claim strength: OFFICIAL > MULTI-SOURCE OBSERVED > OPERATOR HEURISTIC. Cap classes map 1:1 (verified = OFFICIAL numbers, none published today; working = MULTI-SOURCE OBSERVED; heuristic = OPERATOR HEURISTIC policy).

## R4. Combination rules

1. One tag per line. A tag opens a section: everything below it belongs to that section until the next tag. Tags are case-insensitive; emit Title Case. Bare heads (`CHORUS`) and parens heads (`(Chorus)`) are not tags — bracket them. Separate sections with exactly one blank line before each structure (A-table) head — readability for humans and editors; costs ~1 char per section, no blank lines inside a section.
2. Sequence structure, never stack it: `[Verse 1]` then lines then `[Chorus]` — never two structure tags on the same block.
3. Vocal tags attach UNDER a structure tag on the next line (`[Chorus]` newline `[Choir]`): direction applies to that section only.
4. Number every repeat (`[Verse 1]`, `[Verse 2]`, `[Chorus 1]`): unnumbered repeats blur together in the render. Exception: Variation skeleton may drop numbers.
5. End every draft with exactly one ending tag: `[Outro]`, `[Ending]`, `[Fade Out]`, `[End]`, or `[Big Finish]` — one of the five, never two.
6. `[Drop]`/`[Instrumental]` sections carry no sung lines (one short bracket brief at most); sung lines there confuse the arrangement. Same for `[Hook]` with instrumental handling (no vocal lines in that section).
7. `(...)` lines are vocalized: max one short line per section, otherwise cut. No `(x2)`/`(repeat)` notation anywhere — write repeated lines out physically.
8. If a tag is ignored in the render: simplify (fewer tags, standard order `[Intro] -> [Verse] -> [Chorus] -> [Bridge] -> [Outro]`) and restate the intent as Styles production words.
9. Closed heads, typed briefs: a structure/vocal HEAD outside the dictionary A/B (+aliases) is forbidden output; modifier/brief/color lines must match an E pattern (short, typed) and are exempt from the A/B check.
10. Bracket tags never appear in Styles or Title. Styles carries sound words; Exclude carries plain names (the UI displays the `-` prefix itself).
11. Brief length: colon head + tail ≤8 words total; dash descriptor tail ≤45 chars / 3-4 keywords (HG working pattern, e.g. `[Chorus - Belted]`); longer content moves to Styles or gets cut. One dominant mood per section, no contradictions.
12. Canonical shapes for wild forms: short colon tails stay INLINE on the head (`[Verse: whispered vocals, acoustic guitar only]`, ≤8 words); short dash descriptor tails stay INLINE too (`[Chorus - Belted]`, hard cap ≤45 chars / 3-4 keywords); longer briefs split to the next line(s); `[A][B]` stacks split into two lines; dash/colon color proper-nouns always detach into their own line (`[Bridge - Acid Phase]` → `[Bridge]` + `[Acid Phase]`); custom heads map via the dictionary table (Part/Phase/Climax/Stinger/Pre-Verse/Vocal Chops/Build-up/ЯМА); heads stay English (bare or with short tail), all bracket lines English only.
13. Numeric BPM/key/tempo never in Lyrics: `140 BPM`, `A minor` live in Styles; strip on sight. Textual transitions (`[Tempo: slow]`, `[Tempo Change]`, `[Accel]`, `[Key Change]`, `[Ritardando]`) are gated-only (explicit request or proven render need).
14. Backing: sung backing in parens `(Backing: LINE)`; arrangement notes about backing in brackets. Chops (`A-A-A-A!`) are content lines under a chops brief, caps and slang spelling preserved.
15. Detail briefs: `[Theme: ...]`, `[Main motif: ...]`, `[Dynamics: ...]`, `[Transition: ...]` are legal E-pattern modifier lines inside the tier-scaled budget. Numeric control lines `[Tempo: 120]` / `[Key: X]` / `[BPM: X]` are forbidden in Lyrics — tempo/key/mode go to Styles once; note-level motif movement (F#→D) stays as description.
16. Phase color goes on its own line AFTER the head (`[Bridge]` newline `[Acid Phase]`) — same-line stacks split in two. Colon form (`[Bridge: Acid Phase]`) is the short-tail alternative, not a stack. No nesting anywhere: `Bass Drum (Kick) on 808` expands flat (`[808 Kick - Bass drum]`).
17. Structure lockdown: section heads come ONLY from cemented table A with Suno-supported syntax (bare head or head + short colon tail ≤8 words per line, numbered repeats, phase-next-line or colon-tail). Vocal heads come ONLY from table B. Non-English heads are banned entirely — rewrite in English by context (`[ЯМА]` → `[Breakdown]` or `[Drop]`). Brief/vocal/dynamics/color lines per E. Anything else as a section head is forbidden: map via D or cut.
18. Dictionary levels: L1 structure heads — documented only, nothing invented (table A); tails ≤8 words from frequent working stock. L2 voice tags — free F-lexicon combos (single line ending in `vocal`, gender + F-group words only: `[Powerful female chest voice vocal]`), no real persons. L3 mood parens — popular constructs only (G list), attached to a sung line, never standalone. L4 instruments — real gear + settings (modes/keys/chords), freest content, budget still applies.

## R5. Brackets vs parentheses verdict (docs-grounded)

Parentheses are SUNG by default, except line-initial direction: `(Sudden decline in energy, drums stop)` risks a vocalist singing those exact words. Rule: every production/arrangement direction goes in `[brackets]`, convert on sight: `(Sudden decline in energy, drums stop)` -> `[Breakdown: energy drops, drums stop]`. Parentheses are reserved for short sung backing only: `(Backing: No!)`, 1-4 words, caps preserved. Quoted spans are always sung: `"Hey"`, `"Bow... bow..."` — sing, whisper, shout or moan the quoted words with the surrounding delivery; quotes never carry instructions, and the on-request clean text keeps the words while dropping the quote marks. Exception — line-initial direction: a parenthetical that OPENS a line with sung text following on the SAME line (`(whispering) Stay here...`, `(Heroic shout) STOP!`) is a local direction for that line only, not sung; the on-request clean text drops the prefix. Mood/emotion parens (`(weeping)`, `(shouting)`, `(anxious)`) follow the same attachment rule: prefix to a sung line = delivery, standalone = sung. Standalone parens stay sung. Tags are signals, not commands: keep bracket briefs short (head + ≤8-word tail) — verbose brackets underperform; place each tag locally above its section.

## R6. Styles 4-part structure (always)

Four lines, fixed order — exactly 4 physical lines, one part per line (commas separate ideas within a line; if the UI collapses line breaks, the commas still parse):

1. **Base** — vocal anchor first, then subgenre (e.g. `gritty male ragga lead over powered eurodance 90s`), BPM, rhythm and key (e.g. `4/4 rhythm, key of F# minor`), arrangement (clean sound, bass layers, drums, main theme).
2. **Instruments & accents** — stabs, leads, bells, kits, synth models, bass layers.
3. **Vocal** — triple-stack first as one unit: character + delivery + effects (e.g. `gritty male ragga lead, urgent close delivery, raw punchy mix`), then register on backing, hook behavior, rap recitative character (timbre archetypes allowed, real singers banned). Instrumental tracks: `no vocals, instrumental`.
4. **Mood** — scene, energy, attitude. Heuristic: Weirdness low (20-40) + Style Influence high (70-90) for obedience, reverse for surprise; 50 neutral (help center). One tension per package: no contradictory mood adjectives in Styles; verse/chorus contrast lives in Lyrics structure, not in mood words.

```text
Powerful female vocals over powered eurodance 90s, 110 BPM hip-house breakbeat drive, key of F# minor, low-bit vintage 12-bit sampler texture, several levels of sub-bass layers, powerful punchy acoustic and electronic drums, vibrant main theme hook,
Aggressive electronic house stabs, heavy sampled distorted guitar power chords, raw syncopated cowbell accent, Roland TR-909 drum kit, retro analog synthesizer layers,
Powerful female vocals, aggressive vocal delivery, soulful female chest voice on backing tracks, defiant shouting hooks, sharp brutal male rap recitative, gritty rough-edged rap tone,
Energetic 1990s dance club groove, positive uplifting energy, highly confident, sexy, seductive dancefloor dynamic
```

## R7. Detail budget and engine

- Structure budget: the selected recipe may use its full canonical head set (standard holds 7 — Intro/Verse/Pre-Chorus/Chorus/Bridge/Final Chorus/Outro); off-recipe maps avoid more than 5–6 distinct structural roles, extras get cut or move to Styles. Chorus ≤4 content lines + written-out repeats with varied tails per repeat (same hook words, different delivery tail/brief: C1 belted → C2 raw → Final euphoric); verses ≤8 lines. Per section: head + modifier lines scaled by `lyrics_size` tier (S ≤1, M ≤2, L ≤3, XL ≤4). SFX only at real arrangement changes. Styles depth scales with `styles_size`; Exclude: ≤3 focused items. Whatever does not fit moves to Styles, raises the tier for signature texture, or gets cut — never stacked into the Lyrics box. BPM/key/tempo live in Styles ONLY; strip them from Lyrics briefs on sight.
- Depth scales with tier: S = heads + hooks + motif one-liner; M = + part entries/exits and dynamics of key sections; L = concrete description per section; XL = + SFX/transitions/micro-accents. Detail follows the task, not the band: a medium package holds medium detailing even if space remains.
- Mine user examples first for motif/hook/dynamics vocabulary; if absent, ask, then author. Elements that must be explicit when they exist: hooks (`[Hook]` + brief, instrumental handling via `[Hook]` with no vocal lines when needed), chops (content syllable lines + one brief), main motif (`[Main motif: ...]` — instrument, articulation, note movement like F#→D), dynamics (`[Dynamics: ...]` — arc inside the section), instrument parts (who plays what, entries/exits, riffs/solos). Beyond text: parts and layers are first-class content, not decoration.
- Prosody mirroring (reference that carries text): read the reference's FORM — section map, line count per section, syllables/meter per line, rhyme scheme — and reproduce that form in fully original words. Copy the shape (line lengths, rhyme positions, refrain behavior, section order), never the words, hook lines, or imagery (R1). When the operator pastes reference lyrics, analyze them for prosody only; do not reuse any phrase.
- A section may carry layers beyond its head tag, in this order: 1) head — bare (`[Chorus]`) or with a short tail: colon (`[Verse: whispered vocals, acoustic guitar only]`, ≤8 words) or dash descriptor (`[Chorus - Belted]`, ≤45 chars / 3-4 keywords); dash/colon color proper-nouns go on the next line (`[Acid Phase]`), 2) vocal line (ONE dictionary vocal tag + spec via colon: S/M tiers tail of ≤3 words, L/XL full spec — register + placement + manner, ≤8 words, e.g. `[Female Vocal: Chest voice lead, aggressive]`; free F-lexicon combos allowed as the alternative single-line form, e.g. `[Powerful female chest voice vocal]`), 3) production line (ONE brief of ≤8 words: transition mechanics, drop, accent, voice/instrument insert, riff/solo cue), 4) SFX line only where the arrangement audibly changes. Sung lines come last and must read like the section they sit in (a chorus reads like a chorus — the tag alone never compensates verse-like lines). Sung lines read best at 4-8 words (one breath) — heuristic, not a validity constraint: override for rap/D&B/spoken/chants/slow ambient/cinematic lines, meter, or user text; ALL-CAPS sung lines read as high energy.

## R8. More Options table and presets

Always emit the canonical 7+1 block: one 7-field line, then the Exclude line (fixed order). Provenance: Vocal Gender, Duration slider, Max Mode confirmed in Suno docs (help center, release notes, v6 FAQ); Variety/Personalize values from the live UI (user-verified — re-check if the UI changes).

| Field | Values | Default | Working rule |
|---|---|---|---|
| Exclude styles | plain names, comma-separated, ≤3, or `Exclude: none` | none | Own line AFTER the 7-field line via single newline, no blank line inside (`Exclude: Pop music, Classical, Rap` or `Exclude: none`); prose negations banned from Styles |
| Vocal Gender | Male / Female / none | none | Set only when the voice must be fixed; reinforce in Styles (`female vocal`) |
| Duration | Auto / Custom mm:ss | Auto | Custom only for a target length; model max applies (verify live) |
| Max Mode | Off / On | Off | Costs more credits (docs: best for >2 min songs, covers, style transfer, vocal/style consistency — v6 FAQ). Working policy: finals/locked takes only. |
| Weirdness | 0-100% | — | Working preset: low (20-40) for obedience, high for surprise; official help describes 50 as normal; never typed into Style text, sliders live in Advanced Options |
| Style Influence | 0-100% | — | Working preset: high (70-90) when the Style prompt must lead, lower when lyrics lead; official help describes the control qualitatively, not as this numeric default |
| Variety | Off / Normal / High / Extra / Max | UI default | Slider with labeled stops (not percent); Off = 0 per v6 FAQ = style tags stay exactly as typed = retain full control; default when unspecified; Max only on explicit freedom request |
| Personalize | Off / On | Off | Always Off |

Canonical block (7-field line + single newline + Exclude line — no blank line inside):

`Vocal Gender: Female | Duration: Auto | Max Mode: Off | Weirdness: 60% | Style Influence: 60% | Variety: Normal | Personalize: Off`
`Exclude: Pop music, Classical, Rap`

Self-check notes the working presets (W low + SI high for obedience, reverse for surprise). Out-of-range values are rejected and surfaced for correction — never silently clamped and never shipped.

Budget: Styles depth per `styles_size` (subgenre beats broad genre at any tier); Exclude = ≤3 focused items (exclude `drums` + reinforce `percussion-free` in Styles beats a long ban list).

## R9. Self-check list (gate — no package ships red)

title≤80 ok (conservative; live v6 allows up to 100, not used; auto-shortened if over, result shown post-factum, no extra round) / lyrics N≤tier-top and ≤working caps ok / styles N≤tier-top and ≤working caps ok / no prose in Styles / no genre-mood-tempo words in sung lines (briefs per E ok) / every structure/vocal head from the dictionary A/B only, modifier/brief lines per E only / moreoptions 7+1 complete (Exclude on its own line via single newline, `Exclude: none` when empty), Variety per explicit request (default ≤Extra, Max only on explicit freedom request), Personalize Off / INFO carries `model:` (`v6`/`v6-wild`/`v6-mini`) and `lang:` (the sticky branch language) / the parser block is 5 tags (TRACK/LYRICS/STYLES/MOREOPTIONS/INFO); clean text and translation are on-request exports only / lyrics language matches the branch language — edits spoken in any other language are applied into it, never switching it (C0) / no duplicated or competing descriptors across Styles parts (audit) / one mood tension per package / no artist names, no unlicensed third-party text / reference work carries `ref_sources` in INFO whenever `ref_track` is present (validator FAIL) — use `ref_sources: model knowledge` when the dossier was written from the model's own knowledge with no web source — with no real name in any Suno field. Every red item is fixed in the same pass.

## Changelog (normative)

- 2026-09-14: pre-release rc — parser block is 5 tags (no TEXTONLY/TRANSLATE); clean text/translation are on-request exports; R9 self-check adds `lang:` and the sticky-language rule; R4-10 and R5 drop TEXTONLY/TRANSLATE wording.

- 2026-09-14: R1 provenance bullet (dossier is provenance, never content) + R9 item requiring `ref_sources` with `ref_track` (validator FAIL); aligns with ADAPTERS A7.

- 2026-09-13: index/changelog synced to R1–R9; More Options restated as 7+1 (not "8 fields"); Exclude-200 cap marked as a validator WARN (count stays FAIL).

- 2026-09-12: extracted as the policy layer (R1–R8) — zero environment verbs by construction.

(End of file)
