# GUIDE.md — Pro runtime knowledge (assembly manual) for vave-suno-multiprompts

- Version: 2026-09-12. Language: English. Same folder as SKILL.md.
- Sync: pending first launch (all LINKS.md stamps are `never`; full pass over sections 1-3 + rewrite on first activation per SKILL.md §2.1). Mechanics below are the shipped baseline the pass verifies and extends.
- Status: consult-first IMMUTABLE assembly manual. This file teaches HOW TO BUILD a prompt under the current docs — never ready-made genre recipes, never accumulating state. Reusable style vocabulary accrues ONLY in `STYLE-NOTES.md` (mutable registry, one stamped entry per requested style, added on demand). A style request with no direct registry note and no sufficient mechanics answer here → targeted web per the LINKS.md network policy, then link + registry note.
- Hard cap: 50000 chars including spaces. If an update would overflow, compress old mechanics rows first, never drop the pipeline or the anti-patterns. (Registry overflow is handled in `STYLE-NOTES.md`, never here.)
- Hard boundary (SKILL.md §6 restated): style pages and guides are research-only vocabulary mines. Describe traits, never emit real artist names, unlicensed third-party titles, or unlicensed third-party lyric chunks anywhere in Lyrics/Styles/Title/Exclude.

## 1. Assembly pipeline (fixed order, 12 steps)

1. Brief (Input A/B/C/D) + session baseline (model, languages, tiers from DEFAULTS.md).
2. Frontier questions (one batch, max 3-5 per track): reference + evolution, vocal language, copy-1:1 vs change, single vs album, volume → tier ceiling.
3. Structure map: pick one recipe from §2 and stay inside its head set — extra head types need explicit justification, otherwise cut.
4. Heads (table A + numbers, exactly one closer of the five); vocal spec lines (table B/F) under the head they color.
5. Production briefs (≤8 words each): transitions, drops, accents, inserts, riff/solo cues. SFX only at real arrangement changes.
6. Sung lines last: 4-8 words per line (one breath; rap/spoken/chants/slow-cinematic exempt), chorus ≤4 content lines + written-out repeats with varied tails, no genre/mood/tempo words in sung lines.
7. Styles in 4 parts, vocal anchor opens the Base (§4). No sentences, no prose, no brackets, no lyrics in Styles.
8. Exclude ≤3 focused items (§9); `Exclude: none` when nothing to ban.
9. More Options preset from §8 (session default Balanced unless the task says otherwise).
10. Counters: N ≤ tier ceiling AND ≤ working caps (lyrics 5000 / styles 1000, both officially unverified); below-top is fine, report `filled N — no filler`, never pad. Texture rule: a ceiling that would audibly cost signature texture loses to an explicitly raised tier.
11. Self-check green (RULES R9 list). No package ships red — fix in the same pass.
12. Export fork only on explicit trigger (parser / fill / `text` / `translate` / sibling); approved version only.

## 2. Volume → structure recipes (pick one, budget inside)

- instrumental (lyrics S): `[Intro]` → `[Build]` → `[Drop]` → `[Breakdown]` → `[Build]` → `[Drop]` → `[Outro]`. No sung lines anywhere; `[Hook]` with no vocal lines marks the earworm instrumental motif; a `[Main motif: ...]` line is mandatory.
- hooks&chops (lyrics S): `[Intro]` → `[Hook]` + `[Vocal chops ...]` brief + chopped syllable lines (`A-A-A-A!`) → `[Verse 1]` (2-4 lines) → `[Hook]` → `[End]`. Caps and slang spelling preserved verbatim.
- minimal (lyrics S/M): `[Intro]` → `[Verse 1]` → `[Chorus 1]` → `[Verse 2]` → `[Final Chorus]` → `[Outro]`. ≤1 modifier line per section.
- standard (lyrics M): `[Intro]` → `[Verse 1]` → `[Pre-Chorus]` → `[Chorus 1]` → `[Verse 2]` → `[Chorus 2]` → `[Bridge]` → `[Final Chorus]` → `[Outro]`. Default workhorse.
- dense rap-story (lyrics L/XL): `[Intro]` → `[Verse 1]` → `[Hook]` → `[Verse 2]` → `[Chorus 1]` → `[Verse 3]` → `[Bridge]` or `[Build]` → `[Drop]` or `[Final Chorus]` → `[Outro]`. Verses ≤8 lines; hooks carry the memory.

## 3. Heads quick-pick (full tables live in SUNO-TAGS.md)

- Universal spine: Intro / Verse (numbered) / Pre-Chorus / Chorus (numbered) / Bridge / Final Chorus / Outro.
- Electronic tracks add: Build / Build-Up, Drop, Breakdown, Break.
- Band tracks add: Solo / Guitar Solo, Instrumental Break, Percussion Break, Drum Fill.
- Vocal color under a structure head: Choir / Group Vocals / Harmonies, Ad-Lib, Rap, Spoken / Spoken Word, Whisper / Whispered, Falsetto, Shout / Scream, Humming, Backing Vocals, Belted, Vocal Hook.
- Standing rules: one tag per line; sequence never stacks; number every repeat; exactly one of the five closers (list: RULES R4-5); English heads only; gated tags (`[Key Change]`, `[Tempo: slow]`, `[Tempo Change]`, `[Accel]`, `[Ritardando]`) only on explicit request or proven render need.

## 4. Styles assembly (4 parts, 4 physical lines)

### 4.1 Base opener pattern

`{vocal anchor} over {powered subgenre + era}, {BPM} BPM, {rhythm}, key of {X}, {room/texture}, {drums}, {bass layers}, {theme hook}`

Vocal anchor + subgenre open the line; fingerprints (drum recipe, bass lock, hero instruments) carry the match; broad genre words alone never carry it.

### 4.2 Subgenre anchoring (mechanics, not recipes)

- One primary lane + one modifier maximum. Long genre stacks turn to mud — cut to two.
- Fingerprints-first: name the drum recipe, the bass lock, 2-3 hero instruments, the room/texture. Concrete sound words (`gated snare`, `tape warmth`, `breathy vocal`) beat vague mood alone (documentation rule).
- Era pins via production signatures (drum machine grids, tape saturation, sampler grit), never via artist names.
- Lane-specific anchors, BPM corridors, and starter bans are NOT pre-baked here — they accrue in `STYLE-NOTES.md` on demand.

### 4.3 BPM mechanics

- Decide once per track: reference research, the registry note for the style, or an explicit order. Corridor ± stays adjustable for album lock.
- Use BPM when tempo matters; when the lane already implies the tempo, a rhythm phrase (`half-time sway`, `four-on-the-floor drive`) may carry it alone.
- BPM lives in Styles ONLY — strip it from Lyrics briefs on sight.

### 4.4 Key/mode mechanics

- Tense/dark leans minor, uplift/tender leans major — tendency, not law. Decide once per track; key/mode live in Styles once.
- Modulation without gated tags: section contrast (intimate low head → belted lift head) + a `[Dynamics: ...]` arc naming the lift + motif transposition as note movement (`C→G`) + arrangement arc words in Styles (`closing lift`). Never a second numeric key, never BPM in Lyrics.

### 4.5 Reference dossier → Styles mapping

A detailed reference (ADAPTERS A7) yields the Reference Dossier; map it fingerprints-first, never paste the dossier itself. The model's **primary prompt** is the Styles draft derived here; the 5-tag chunk (CORE C4) is just that draft wrapped together with Lyrics, More Options and INFO.

| Dossier field | Goes to |
|---|---|
| genre / subgenre / era / lane | Styles part 1 (subgenre + era signature) |
| bpm / key / meter | Styles part 1 Base, once (never Lyrics) |
| instrumentation (with roles) | Styles part 2 (hero instruments + rhythm/bass lock); bleeders → Exclude ≤3 |
| arrangement map | Styles part 1 (arrangement words) + Lyrics section map |
| vocal (type/register/delivery) | Styles part 3 + B-table vocal heads + the `Vocal Gender` switch |
| prosody (when the reference carries text) | Lyrics form: section map, line lengths/syllables, rhyme scheme, refrain behavior — original words only |
| descriptors / moods / themes | Styles part 4 (one tension) + `[Theme: …]` briefs |

Rules: traits become original sound words (R1 — no names/titles anywhere in a field); a dossier field that is missing stays out of the package (no invention); the dossier itself never ships — provenance only, in the summary and INFO `ref_track`/`ref_sources` (optional `ref_dossier`).

## 5. Vocal specification mechanics (role → texture → delivery → mix cue)

- Order of specification: role (lead/duet/choir/chant/ad-libs/call-response) → texture (breathy, gritty, intimate, polished, raw, soulful, belted, whispered, layered) → delivery (melodic rap, spoken verse, soaring chorus, falsetto, gospel runs, doubled hook, gang vocals) → mix cue (dry close, glossy pop, room reverb, wide stereo harmonies, vocoder layer, distorted edge).
- Triple-stack formula: character + delivery + effects as one unit (e.g. `low baritone lead, close breathy delivery, dry room mix`), then per-part voices below it.
- Lyrics vocal line per part: dictionary head + tail (S/M ≤3 words, L/XL full spec ≤8). Instrumental tracks: Styles part 3 = `no vocals, instrumental`, never invent voices.
- Style-specific vocal fingerprints (e.g. how a lane treats backing stacks) belong in registry notes, not here.
- Vocal mistakes that waste renders: `good vocals` with no performance detail; contradicting cues in one box (whispered + belted, male + female lead unspecified); artist names as instruction (banned — describe traits); fixing voice with prose instead of the Vocal Gender switch + Styles anchor.

## 6. Mood builder (scene + energy + attitude, one tension)

- Build the trio in order: scene (where/when it sounds) + energy (how it moves) + attitude (how it stands). One tension per package.
- Contradiction patterns that always fail: intimate-scale delivery + stadium-scale nouns; aggressive verbs + tender nouns; euphoric + funereal; frantic motion + lethargic nouns.
- Verse/chorus contrast lives in the Lyrics structure, not in competing mood adjectives.

## 7. Hooks, chops, motif, dynamics

- Five hook constructions: (1) chant-shout (`Hey! Ho!` pattern, original syllables); (2) call-response (lead line + `(Backing: answer)`); (3) belted lift (short lines, caps lift on the peak word only); (4) chopped syllables (`A-A-A-A!` under a `[Vocal chops ...]` brief); (5) whispered lead-in (2 quiet lines detonating into the chorus).
- Chops are content lines, caps = intensity, slang spelling frozen. Never demo chops with third-party hook syllables.
- Motif line: `[Main motif: instrument, articulation, note movement]` (e.g. `[Main motif: soft piano, staccato pulse, C→G lift]`). Note-level movement stays; numeric tempo/key never.
- Dynamics line: `[Dynamics: hush verse → wide chorus]` or `[Dynamics: strip to 808 + whisper, detonate on drop]`. One arc per section that earns it.
- Repeat tails: identical hook words across C1/C2/Final, but a different delivery tail or brief per repeat (C1 belted → C2 raw → Final euphoric). Same memory, no flat render.
- Prosody mirroring (reference with text, RULES R7): copy the reference's FORM — section map, lines per section, syllable/meter per line, rhyme scheme, refrain behavior — and re-author in fully original words. Same shape and stress, zero shared phrases (chant the rhythm, not the line).

## 8. More Options presets

- Obedient (reference lock, detail branch): Weirdness 30% / Style Influence 75% / Variety Normal. Docs logic: W low + SI high = Styles lead.
- Balanced (session default): Weirdness 60% / Style Influence 60% / Variety Normal. Neutral ground for drafts.
- Wild (explicit freedom request): Weirdness 80% / Style Influence 40% / Variety High. Reverse for surprise.
- Standing: Variety Max only on explicit freedom request; Off (=0) keeps tags literal for maximum control; Max Mode finals/locked takes only (costs credits); Duration Auto unless a target length is ordered; Personalize Off; Vocal Gender switch only to lock a voice (per-part voices already live in Lyrics).

## 9. Exclude mechanics (≤3, plain names, own line)

- Ban the neighbor that bleeds in: listen to what the lane typically drags along, ban that. Reinforce the wanted sound in Styles (exclude `drums` + write `percussion-free` texture beats a five-item ban list).
- Picking top-3: a long ban list always loses to three focused bleeders — keep the three most likely intruders, drop the rest.
- Nothing to ban → `Exclude: none` (fill script clears the field instead of typing it).

## 10. Anti-patterns and fixes (wrong → right; derived from RULES R2/R4 — canonical there)

1. Prose sentence in Styles → comma-fragment line in the matching part.
2. Genre words in sung lines (`epic rock ballad tonight`) → neutral image lines; genre lives in Styles.
3. `good vocals` / `nice beat` → role+texture+delivery+mix (§5).
4. Artist name anywhere near a field → trait description, name only in summary/INFO.
5. Production note in parens (`(drums stop)`) → `[Breakdown: drums stop]`; parens sing.
6. `(x2)` / `(repeat)` → lines written out physically.
7. Numeric tempo/key in Lyrics (`[Tempo: 120]`) → Styles Base once.
8. Two structure tags stacked (`[Verse][Chorus]`) → two headed sections in sequence.
9. Two closers → keep one of the five.
10. Bare/parens heads (`CHORUS`, `(Chorus)`) → bracketed Title Case head.
11. Six-genre stack → one primary + one modifier (§4.2).
12. Styles past the box cap → cut lowest-priority phrases first; detail moves to Lyrics briefs or dies.
13. Prose negations in Styles (`no boring drums`) → positive scope + Exclude line.
14. `[Drop]` / `[Instrumental]` with sung lines → brief-only section, vocals out.
15. Unnumbered repeats (`[Verse]`, `[Verse]`) → `[Verse 1]`, `[Verse 2]` so the model varies them.

## 11. Render-feedback map (one variable per round, DNA untouched)

When adapting a working direction, swap only one or two dimensions at a time (rhythm, vocal character, era, or Exclude) so the prompt stays coherent.

| Heard | Change |
|---|---|
| Tags washed out / ignored | simplify to standard spine (Intro-Verse-Chorus-Bridge-Outro) + restate intent as Styles words |
| Wrong voice gender/age | fix the part vocal line + set the Vocal Gender switch, reinforce anchor in Styles Base |
| Tempo drift | restate BPM once in Styles Base, strip competing motion words elsewhere |
| Muddy hybrid | cut to 1 lane + 1 modifier, move the loser to Exclude |
| Weak hook | shorten chorus lines to 3-5 words, caps-lift the peak, add call-response backing |
| Flat arrangement | add one `[Dynamics: ...]` arc + one Build/Breakdown, nothing else |
| Unwanted instrument in the mix | Exclude it (≤3) + reinforce the wanted texture in Styles part 2 |
| Lyrics rushed / mumbled | cut total chars toward the ~3000 sweet spot, shorten lines |
| Style ignored, lyrics lead | raise Style Influence, move production intent out of Lyrics into Styles |
| Right sound, wrong section order | reorder heads only (Correction) or loosen to skeleton (Variation, never silent) |

## 12. Style notes → `STYLE-NOTES.md` (mutable registry — nothing accumulates in this file)

A style request with no direct note in `STYLE-NOTES.md` and no sufficient answer in this manual (§4-§7) triggers a targeted web fetch inside the LINKS.md network policy, then exactly one stamped entry in `STYLE-NOTES.md`. Entry shape, cap, and edit discipline live in that file (single source of truth).

## Changelog

- 2026-09-14: §4.5 adds the prosody row + the dossier → primary-prompt → 5-tag-chunk chain note (single source of truth for the mapping).

- 2026-09-14: §4.5 Reference dossier → Styles mapping added (ADAPTERS A7 → Styles parts, R1 provenance preserved).

- 2026-09-12: mechanics-only restructure (genre recipes out: lane table, corridors, vocal recipes, mood trios, lane bans, critic shelf; §4.2/§4.3/§4.4 mechanics in; §12 on-demand style notes with stamped entry shape).

(End of file)
