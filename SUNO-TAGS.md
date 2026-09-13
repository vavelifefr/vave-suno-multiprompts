# SUNO-TAGS.md — shared vocabulary layer for vave-suno-multiprompts

- Version: 2026-09-12. Suno version: v6 family (`v6` / `v6-wild` / `v6-mini`).
- docs: synced 2026-09-11 (help.suno.com Custom Mode + Rights, about.suno.com v6 notes, community guidelines).
- Status: closed HEADS (A/B + aliases); modifier/brief/color lines follow the E patterns only and are exempt from the A/B check. The skill may emit structure/vocal heads ONLY from A/B. Any other bracket head is `unknown-tag`.
- How to read: A = song sections, B = per-section vocal delivery, C = service markers. One tag per line in Lyrics. For people: the Meaning column is all you need. For the model: match the tag, apply the meaning, never invent siblings.
- Grammar: STRUCTURE_HEAD := table A (opens a section) | VOCAL_HEAD := table B (delivery for that section, next line) | BRIEF := E patterns (colon/dash tails, motif/dynamics/transition/instrument cues, chops briefs, color lines — modifiers, never section heads) | VOCAL_COMBO := F lexicon (single-line voice spec, not a B head) | MOOD_PREFIX := G markers (line-initial paren prefix only). A/B are semantic heads; E/F/G never open sections.

## A. Structure tags — cemented list (OFF = Suno-owned surfaces)

| Tag | Meaning | Source |
|---|---|---|
| `[Intro]` | Opening section, sets key/tempo/mood before first vocal | BL/UU/HG/FS |
| `[Verse]` / `[Verse 1]`, `[Verse 2]`, `[Verse 3]` | Narrative section; number repeats so the model varies them | OFF/BL/UU/HG/FS |
| `[Pre-Chorus]` | Build between verse and chorus, rising tension | BL/UU/HG/FS |
| `[Chorus]` (+numbered) | Main hook, emotional peak, keep lines short and repeatable | OFF/BL/UU/HG/FS |
| `[Post-Chorus]` | Short tag section right after the chorus | BL/FS |
| `[Refrain]` | Short repeated phrase inside verses, not a full chorus | FS |
| `[Bridge]` | Contrasting section, usually after second chorus, before final peak | BL/UU/HG/FS |
| `[Hook]` | Catchy focal part, the earworm moment | BL/UU/HG/FS |
| `[Final Chorus]` | Last chorus, biggest energy | HG |
| `[Interlude]` | Short connecting passage between larger sections | BL/UU/HG/FS |
| `[Break]` | Brief pause or drop in density | HG/FS |
| `[Breakdown]` | Arrangement strips back to minimal elements | BL/HG/FS |
| `[Build]` / `[Build-Up]` | Gradually rising energy/tension leading into a drop or chorus | BL/UU/HG/FS |
| `[Drop]` | Peak-energy release section (EDM/dance), maximum density | BL/UU/HG/FS |
| `[Instrumental]` | No vocals for this section | BL/UU/HG/FS |
| `[Instrumental Intro]` | Instrumental opening | BL |
| `[Instrumental Break]` | Band plays on, vocal rests | BL/UU/HG |
| `[Solo]` | Featured lead-instrument passage | BL/UU/FS |
| `[Guitar Solo]` | Guitar-focused passage | BL/UU/HG |
| `[Piano Solo]` / `[Drum Solo]` / `[Bass Solo]` / `[Saxophone Solo]` / `[Synth Solo]` | Named-instrument solo spots | BL |
| `[Strings Rise]` | String section swell | BL |
| `[Percussion Break]` | Rhythm-focused breakdown | BL |
| `[Drum Fill]` | Short drum fill passage | HG |
| `[Outro]` | Closing section, winds down energy | OFF/BL/UU/HG/FS |
| `[End]` | Hard stop, prevents trailing audio | BL/HG/FS |
| `[Ending]` | Definitive closing section (no fade) | UU |
| `[Fade In]` | Section fades in gradually | BL/UU |
| `[Fade Out]` | Gradual fade ending, reduces abrupt cuts | BL/UU/HG/FS |
| `[Big Finish]` | Strong accented ending hit | UU |
| `[Silence]` | Brief pause in the audio | BL/UU |
| `[Crescendo]` / `[Decrescendo]` | Building / decreasing intensity | BL |

OFF = Suno-owned surfaces (help center, Lyrics Editor labels, release notes). BL/UU/HG/FS = independent guides (Blake/usesuno/HookGenius/freesongwritingtools). SA = Suno Architect tag library; CS = community cheat-sheet song; USR = operator-mandated pattern. Suno publishes no tag registry — OFF rows are Lyrics Editor labels (Verse/Chorus/Outro); all other rows are community-evidenced. On conflict, Suno docs win. Single-source rows are the weakest links — prefer multi-source heads (kept emissible per operator decision 2026-09-11). Valid final closers (exactly one): `[Outro]` / `[Ending]` / `[Fade Out]` / `[End]` / `[Big Finish]`.

### A-gated — documented but inconsistent, explicit request only

`[Key Change]` (BL/UU), `[Tempo: slow]` (BL; numeric tempo stays banned), `[Tempo Change]` (UU; same inconsistency as Key Change), `[Accel]` (UU; opposite of Ritardando), `[Ritardando]` (UU). Emit only when the user explicitly asks or a render proves the need.

## B. Vocal tags — per-section delivery, placed on the line after the structure tag

| Tag | Meaning | Source |
|---|---|---|
| `[Male Vocal]` | Male lead for this section | BL/HG/FS |
| `[Female Vocal]` | Female lead for this section | BL/HG/FS |
| `[Duet]` | Two voices trading or doubling lines | BL/CS |
| `[Choir]` | Group/ensemble vocal texture | BL/CS |
| `[Group Vocals]` | Everyone singing together (= Choir) | HG |
| `[Harmonies]` / `[Harmony]` / `[Harmonized]` | Layered backing harmonies under the lead | BL/UU/HG |
| `[Rap]` | Rap delivery | BL |
| `[Spoken]` / `[Spoken Word]` | Speech-like delivery, no melodic pitch | BL/UU/HG/FS |
| `[Whisper]` / `[Whispered]` | Whispered intimate delivery | BL/UU/HG/FS |
| `[Falsetto]` | High head-voice delivery | SA/community |
| `[Shout]` | Shouted aggressive delivery | community-stable |
| `[Scream]` | Screamed delivery (metal, punk) | BL |
| `[Humming]` | Hummed melody | BL |
| `[Backing Vocals]` | Background vocal parts | BL |
| `[Ad-Lib]` / `[Ad-lib]` / `[Ad-libs]` | Improvised flourishes over the section | BL/UU/HG |
| `[Vocal Run]` | Melismatic run passage | SA |
| `[Belted]` | Powerful chest-voice delivery | UU |
| `[Vocal Hook]` / `[Female Vocal Hook: "Hey"]` / `[Male Vocal Hook: "Hey"]` | Sung hook exclamation; quoted span always sung, quotes dropped in TEXTONLY | USR (operator-mandated pattern) |

## C. Service info Suno understands — not sung, controls behavior

| Marker | Where | Meaning |
|---|---|---|
| `[...]` tags above | Lyrics box | Arrangement/vocal instruction, never sung |
| `(...)` parenthetical line | Lyrics box | Sung softly as ad-lib/backing — keep short; sung backing keeps LINE only in TEXTONLY; line-initial `(direction)` + sung text = direction for that line (see E) |
| `N/LIMIT` counter | Skill output only | Character audit, never pasted into Suno |
| `140 BPM`, `Key of A minor` | Styles box | Tempo/key descriptors, plain words |
| `Exclude: ...` | Exclude field | Comma-separated plain names in the file (`Pop music, Classical, Rap`) or `Exclude: none`; the Suno UI shows them with a `-` prefix |
| Instrumental toggle | Suno UI switch | Whole-track instrumental; `[Instrumental]` tags still mark internal gaps |

## D. Observed customs → canonical rewrite

Operator examples are not canon — the left column is never emitted. Heads stay English; meaning moves into EN brief lines (never transliterated). Color/name lines on the right (`[Name]`, `[Acid Phase]`, `[Main theme]`) are E-pattern briefs, not A/B heads.

| Observed | Canonical rewrite | Note |
|---|---|---|
| `[Part N - Name]` | `[Verse N]` (narrative) or `[Bridge]` (contrasting) + `[Name]` color line | Pick head by function, name goes to the next line |
| `[Phase N: brief]` | Repeat the head, brief on the next line(s) | `[Intro]` + `Phase 1: ...` compressed to ≤8 words |
| `[Climax - Name]` | `[Drop]` + `[Name]` | Peak release = Drop, name on the next line |
| `[Main Theme Drop]` | `[Drop]` + `[Main theme]` | Named peak = Drop, name on the next line |
| `[Stinger]` | Accent brief inside the nearest section, not its own section | A sting is a hit, not a map unit |
| `[Pre-Verse]` | `[Interlude]` + `[Leads into verse 1]` | Link between intro and verse 1 |
| `[Vocal Chops ...]` | `[Hook]` + `[Vocal chops ...]` + chopped syllable lines | Chops are content, not sections |
| `[Vocal Hook]` | Keep compound + quoted line (see E) | Named vocal hook, quoted span sung |
| `[Sensual Breathless Female Vocals - Tired]` | `[Female Vocal: Breathless, sensual, tired]` | Stuffed tag → dictionary head + colon tail |
| `[musical interlude]` | `[Interlude]` | Normalize case |
| `[ЯМА]` and any non-English head | BANNED — rewrite in English by context (`[Breakdown]` or `[Drop]`) | Examples are not canon |
| `[no lyrics only instrumental]` / `[instrumental]` | First-line flag `[Instrumental]` + score mode | One canonical flag |
| `[A][B]` stack | Two lines: `[A]` then `[B]` / brief | Never stack on one line |
| `[Head: brief]` | Short tail (≤8 words) stays inline; long brief splits to next line(s) | Colon tail allowed, length decides |

## X. Retired & denied — never emit

| Form | Instead |
|---|---|
| `[Start]` | `[Intro]` (single weak source, not cemented) |
| `[Male]`, `[Female]`, `[Woman]` shorts | Full `[Male Vocal]` / `[Female Vocal]` |
| `[Pause]` | `[Silence]` |
| `[Instrumental Hook]` | `[Hook]` + instrumental handling (no vocal lines in that section) |
| `[no vocals]` | No such tag (confirmed): Instrumental toggle + `[Instrumental]` + Exclude vocals |
| `[Dubstep Drop]`, `[Emotional Moment]`, other invented heads | Cemented heads only |
| `(x2)` / `(repeat)` | Write repeated lines out physically |
| `[Tempo: 120]`, `[Key: X]`, `[BPM: X]` control lines | Tempo/key/mode live in Styles |
| Same-line stacks, bare heads (`CHORUS`), parens heads | Split / bracket per rules 1-2, 12 |

## E. Brief & notation patterns

| Pattern | Example | Rule |
|---|---|---|
| Head, then color line | `[Bridge]` newline `[Acid Phase]` | Heads stay bare; color/mood on the next line |
| Head + colon modifiers | `[Verse: whispered vocals, acoustic guitar only]` | ≤8 words, commas ok; longer briefs split to next line(s) |
| Head + dash descriptors | `[Chorus - Belted]` | Delivery/production keywords inline, hard cap ≤45 chars / 3-4 keywords (HG working pattern); color proper-nouns detach to next line |
| Vocal head + tail | `[Female Vocal: Tired]` | Dictionary head + colon tail (S/M ≤3 words; L/XL full spec ≤8) |
| Vocal combo tag | `[Powerful female chest voice vocal]` | Single line ending in `vocal`/`vocals`; every word from gender (male/female) + F groups below, ≤8 words total, ≥1 F-group word; no real persons |
| Instrument brief (free) | `[808 Kick - Distorted, tuned to G]` | Real gear + settings (modes/keys/chords); budget still applies |
| Instrument cue (colon) | `[Drums: dry machine pulse, no fills]` | Section-local instrument texture or entry, ≤8 words total; longer splits to the next line |
| Production brief line | `[Transition: Timpani rolls, strings sharpen]` | ≤8 words, one dominant mood |
| Chops content | `A-A-A-A! U-A-A-A-A!` | Hyphenated syllables, caps = intensity, kept verbatim |
| Detail briefs | `[Theme: ...]`, `[Main motif: ...]`, `[Dynamics: ...]` | Modifier lines inside the tier-scaled budget |
| Banned in Lyrics | `[Tempo: ...]`, `[Key: ...]` | Move to Styles once; note-level movement (F#→D) stays as motif description |
| Sung backing | `(Backing: No!)` | 1-4 words, caps preserved; arrangement notes about backing go in brackets |
| Line-initial direction | `(whispering) Stay here...` | Parens prefix opening a line with sung text after = direction for that line only, not sung; TEXTONLY drops the prefix |
| Quoted hook | `[Female Vocal Hook: "Hey"]` | Quoted span is always sung (sing/whisper/shout/moan per delivery); TEXTONLY keeps the words, drops quotes |
| Phase color line | `[Acid Phase]` after `[Bridge]` | Mood/era color on its own line, never stacked with the head |
| No nesting | `Bass Drum (Kick)` forbidden | Expand flat: `[808 Kick - Bass drum]` |
| SFX cue | `[Vinyl crackle, sea waves]` | Brackets only (parens would be sung); only at real arrangement changes |

Brackets instruct, parentheses sing — that is the whole file in one line. Anything production-related in `(...)` gets converted to `[...]` on sight. Note (HG documents short `(softly)`-direction lines as sometimes working): the risk is the direction gets sung aloud and ruins the take — the skill keeps brackets-only and converts.

## F. Vocal spec lexicon — building the vocal line and Styles part 3

Combine: dictionary vocal tag (B) + register + placement + manner. Lyrics line (S/M: tail ≤3 words; L/XL: full spec ≤8 words). Styles part 3: free expanded form.

| Group | Words |
|---|---|
| Registers | Chest voice, Head voice, Falsetto, Belted, Whispered, Spoken, Growled, Raspy, Clean, Breathy |
| Placement | Lead, Backing tracks, Hook, Ad-libs, Rap verse, Rap recitative, Spoken bridge, Call, Response |
| Manner | Aggressive, Defiant, Soulful, Seductive, Urgent, Fragile, Triumphant, Intimate, Shouted, Shouting hooks |
| Timbre archetypes | Powerful, Gritty, Rough-edged, Warm, Smoky, Piercing, Soaring, Brutal, Sharp, Silky |

Archetypes describe sound, not people: imitating a real named singer stays banned (see SKILL.md §6).

## G. Mood parens lexicon — popular delivery/emotion markers (parens, not bracket heads; open list governed by frequency, not closed vocab)

Attach to a sung line as a prefix (`(weeping) Stay here...`); standalone parens are sung, not directions. List is open-ended, governed by frequency: widespread community forms only.

| Marker | Use |
|---|---|
| whispering, spoken, shouting / shout, screaming | Delivery verbs |
| weeping, crying, laughing, sighing, moaning | Emotional voicing |
| anxious, frightened, questioning, desperate, pleading | Inner states |
| robotic, sensual, seductive, intimate, cold, distant | Character color |
| Female whispering, sexual robotic voice | Compound popular forms |

## Changelog

- 2026-09-12: E instrument-cue colon row (Drums/Bass/Guitar/Piano/Strings/Synth/Keys/Organ/Brass/Percussion, ≤8 words); Transition no longer the only production brief.

- 2026-09-11: suno re-sync (A-gated += Tempo Change/Accel UU; dash-descriptor E row ≤45 chars; HG paren-risk note; SA/CS/USR legend; OFF = Lyrics Editor labels, Suno-wins note; weak rows stay emissible per operator).
- 2026-09-11: audit fix pass (heads A/B vs briefs E split; Vocal Hook canonical `[Female Vocal Hook: "Hey"]`; Exclude row `Exclude: none`; endings 5; D color lines = E briefs; G = parens open list).

- 2026-09-11: section G mood parens lexicon + vocal-combo/instrument E rows (L2/L3/L4).
- 2026-09-11: cement pass (Source column, A-gated, X retired/denied, no-RU heads, Vocal Hook compounds).
- 2026-09-11: universal pass (bare heads, Vocal Hook head, D rewrites to head+brief form).
- 2026-09-11: Q-batch (phase lines, quoted hooks, line-initial direction, no-nesting ban).
- 2026-09-11: review pass (closed-vocab scope A/B+C+E, parens/TEXTONLY wording, Exclude plain-names row).
- 2026-09-11: section F vocal spec lexicon (registers/placements/manners/archetypes).

- 2026-09-11: +Instrumental Hook, Main Theme Drop map, detail briefs + Tempo-ban rows (tier/detail pass).
- 2026-09-11: +Refrain/aliases, sections D (custom map) and E (patterns) from six 5.5 samples + docs re-sync.
- 2026-09-11: extracted from SKILL.md 7.3 into its own installable file, content unchanged.
