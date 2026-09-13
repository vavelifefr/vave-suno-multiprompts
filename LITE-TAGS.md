# LITE-TAGS.md — core dictionary (Lite entry)

- Core subset of `SUNO-TAGS.md` (Pro holds the full tables plus F/G lexicons and provenance). Unknown head → map via D below, or ask / upgrade to Pro. Never invent siblings.
- Grammar: A opens a section (one per line, blank line before it); B colors delivery (next line, glued); E briefs modify (≤8 words, exempt from the A/B check); exactly one closer per song.

## A. Core structure heads

| Tag | Meaning |
|---|---|
| `[Intro]` | Opening, sets key/tempo/mood |
| `[Verse 1]`, `[Verse 2]`, `[Verse 3]` | Narrative; number repeats |
| `[Pre-Chorus]` | Build into the chorus |
| `[Chorus]` (+numbered) | Main hook, short repeatable lines |
| `[Post-Chorus]` | Short tag right after the chorus |
| `[Bridge]` | Contrasting section before the peak |
| `[Hook]` | Earworm moment (chops live here) |
| `[Final Chorus]` | Last chorus, biggest energy |
| `[Interlude]` | Short link passage |
| `[Breakdown]` | Arrangement strips back |
| `[Build]` / `[Build-Up]` | Rising tension into drop/chorus |
| `[Drop]` | Peak release, no sung lines |
| `[Instrumental]` | No vocals in this section |
| `[Instrumental Break]` | Band plays, vocal rests |
| `[Solo]` / `[Guitar Solo]` | Featured lead passage |
| `[Outro]` | Closing, winds down |
| `[End]` | Hard stop |
| `[Ending]` | Definitive close, no fade |
| `[Fade Out]` | Gradual fade ending |
| `[Big Finish]` | Strong accented ending hit |

Valid closers (exactly one): `[Outro]` / `[Ending]` / `[Fade Out]` / `[End]` / `[Big Finish]`.

## B. Core vocal tags (next line under the structure head)

| Tag | Meaning |
|---|---|
| `[Male Vocal]` / `[Female Vocal]` | Lead for this section |
| `[Duet]` | Two voices trading/doubling |
| `[Choir]` / `[Harmonies]` | Group / layered backing texture |
| `[Rap]` | Rap delivery |
| `[Spoken]` | Speech-like, no pitch |
| `[Whisper]` | Intimate whispered delivery |
| `[Falsetto]` | High head-voice delivery |
| `[Shout]` | Aggressive shouted delivery |
| `[Backing Vocals]` | Background parts |
| `[Ad-Lib]` | Improvised flourishes |
| `[Belted]` | Powerful chest-voice delivery |

## E. Core brief patterns

| Pattern | Example | Rule |
|---|---|---|
| Head + colon tail | `[Verse: whispered vocals, acoustic guitar only]` | ≤8 words total |
| Head + dash tail | `[Chorus - Belted]` | ≤45 chars / 3-4 keywords |
| Vocal head + tail | `[Female Vocal: Tired]` | S/M tail ≤3 words |
| Detail briefs | `[Main motif: ...]`, `[Dynamics: ...]`, `[Transition: ...]` | modifier lines, ≤8 words |
| Instrument cue | `[Drums: dry machine pulse, no fills]` | Drums/Bass/Guitar/Piano/Strings/Synth/Keys/Organ/Brass/Percussion, ≤8 words |
| Sung backing | `(Backing: No!)` | 1-4 words, caps kept |
| Quoted hook | `[Female Vocal Hook: "Hey"]` | quoted span always sung |
| SFX cue | `[Vinyl crackle, sea waves]` | brackets only, real arrangement changes |

## X. Never emit (core)

`[Start]` → `[Intro]`; `[Male]`/`[Female]` shorts → full vocal tags; `(x2)`/`(repeat)` → write out; `[Tempo: N]`/`[Key: X]`/`[BPM: X]` lines → tempo/key live in Styles; same-line stacks → split; bare/parens heads → bracket; non-English heads → rewrite in English; A-gated (`[Key Change]`, `[Tempo: slow]`, `[Tempo Change]`, `[Accel]`, `[Ritardando]`) → Pro/upgrade or explicit order only.

## D. Wild → canonical (core)

`[A][B]` stack → two lines; color proper-noun (`[Bridge - Acid Phase]`) → head + own-line color; `[Vocal Chops ...]` → `[Hook]` + chops brief + syllable lines; `[ЯМА]` → `[Breakdown]` or `[Drop]`; no nesting (`Bass Drum (Kick)` → `[808 Kick - Bass drum]`).

## Changelog (lite-tags)

- 2026-09-12: core subset forked (20 A-heads + 13 B-tags + E/X/D essentials).

(End of file)
