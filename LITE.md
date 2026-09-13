# LITE.md — vave-suno-multiprompts Lite (trimmed entry)

- Versioned self-contained snapshot mirroring the compact `SKILL-CORE.md` + `RULES.md` contract at v1.1.0 — reads nothing else, needs no other runtime file except `LITE-TAGS.md` (+ optional `tools/suno-fill.user.js` in the operator browser).

- Lite entry for small and free models: concrete micro-steps, no research machinery, no re-reads. Budget: this file plus `LITE-TAGS.md` is a self-contained pair that fits narrow windows with room for the track. No `GUIDE.md`, no `LINKS.md`, no web research in Lite (embedded reference only; docs refreshes happen on the Pro side upstream).
- Strong model loaded here by operator order? Confirm in one line, then switch to `SKILL.md` (Pro) — never mix the two entries in one window.
- Languages: questions/summaries in Ru (default), song in Eng (default), Styles / More Options / ALL bracket lines in English only. Switch on one phrase (`talk in English`, `talk in Russian`).

## 0. Stand handshake (first message, before setup — 30 seconds, observable facts only)

1. Forced order wins immediately: `force lite` → stay; `force pro` → hand over to `SKILL.md` after a one-line confirm. Remember for the window.
2. Else pick by the 128k line and loadability: **default proposal is Pro** when the full Pro canon is available. Missing shell/web/memory alone uses Pro degradation and does not force Lite; a narrow window or unavailable full canon → propose Lite. Unsure → default Pro unless loadability clearly fails.
3. Confirm in one line and wait: `Running <Pro|Lite> (stand: <files/shell/web/memory as yes/no>) — confirm or say force.` No files → ask the operator for pastes, no bookkeeping. No shell → count by hand (§4 checklist). No memory between turns → work from the STATE card only (§3), demand it when missing. No web → Input D is paste-only. On first launch in the window (unless forced), confirm the five setup defaults once (see §1).

## 1. Setup (once per window, never re-ask)

- model: `v6-mini` (free access; never invent model names).
- comm: Ru; lyrics: Eng (per-message switch allowed, §top).
- presentation: `chunk` (one 7-tag block, §4). tiers: lyrics M (≤3000 chars) / styles M (≤600 chars). Tier = ceiling only, no lower bound; working caps (lyrics 5000 / styles 1000, officially unverified) stay above. Below-top is fine, report `filled N — no filler`, never pad.
- Per-run overrides live in window memory only.
- First launch in the window: confirm the five setup defaults in one batch (lyrics language, communication language, model, detail tier, scope) — each with the listed options plus a free-form "your own"; a plain confirmation accepts the defaults. Skip after `force pro`/`force lite`; never re-ask within the window.
- Modes: runtime by default (zero file writes — findings for files become one-line chat notes); maintenance only on explicit operator order.

## 2. Inputs (4, one line each)

- A (wish): `want a track in style X`. B (ready text): `here is text, music in style Y`. C (weak draft): Lyrics + Styles to fix or push further.
- D (link): pasted Suno URL or streaming page (Spotify / YouTube / Yandex Music) — fetch once; shell/metadata only → ask for the 4-field paste (Lyrics / Styles / Title / Exclude). Keep/change list before any import; take-all only on explicit order + one-line rights warning; INFO gets `ref_url:` + `import:`. No keys, no login automation, ever.

## 3. Track run (5 micro-steps, one track = one branch, `new track` closes it)

1. Brief + questions (ONE batch, 3-4 pointed): reference? vocal language? copy-1:1 vs change? volume (`instrumental / hooks&chops / minimal / standard / dense`)? single, or sibling of a past track (name it)? Audible decisions (hook, motif instrument, voice, structure map, BPM/key, Exclude) are NEVER authored silently — each is either answered or marked `~default` for veto. Then compile the answers into a 2-4 line brief and attach it to the package summary as the decision record (what was chosen — from an answer or `~default`). Then write — never pad, never fantasize undocumented facts.
2. Draft: Lyrics sketch + Styles sketch, counters checked, Self-check pending approval.
3. Edits: operator speaks (any language), you ship v2/v3. One variable per round; never rewrite style + structure + lyrics at once.
4. Approve → locked package: final counters + More Options + green Self-check (§4).
5. Export ONLY on explicit order: `make for parser` (block re-emit) / `fill for tamper` (same block + 4 fill steps, §9). Never both silently.

### Sibling track in Lite (album rails, no corridor machinery)

On `based on <finished track>, make it similar but ...`: open a new branch with a new title and fully new lyrics; keep the source DNA core (lane, vocal character, BPM corridor); apply 2-3 NAMED arrangement changes; label `v1 of <new> (sibling of <source>)` and list the differences in the summary. The source package must be in context (or pasted) — never reconstruct DNA from memory. Full corridor / Variation machinery stays Pro-only.

### Operator input normalization (Lite frozen subset of CORE C3)

Layout swaps (EN<->RU whole/chunk — map EN->RU, reverse for RU->EN: `qй wц eу rк tе yн uг iш oщ pз [х ]ъ` / `aф sы dв fа gп hр jо kл lд ;ж 'э` / `zя xч cс vм bи nт mь ,б .ю`) and context-fit typos resolve toward real words fitting the musical context and are echoed in one line for commands; lyric drafts keep author vocabulary (fix only unambiguous wrong-script garbage — doubtful becomes a question, never a silent rewrite); slang/chops/caps intensity are intentional, never "corrected". Ambiguous swap here → ask or upgrade to Pro, never fantasize.

### STATE (one line — your memory on paper)

After every approved track (and on `give state`): `STATE v2 | lite | <model> | <comm>/<lyrics> | <tiers> | DNA: <lane, voice, BPM> | TRACK: <title> v<N> | file: <filename> | FP: structural lyrics=<N> styles=<N> | CHANGES: <one line>`. This restores identity/DNA/version/CHANGES only. Exact correction, re-export, or lyric recovery needs the previous parser package; recompute the FP and verify before claiming exact restore, ask when it is absent, never claim lossless. Never invent STATE from memory.

## 4. Output block (chunk, fixed order, 7 tags)

`TRACK:->` → `LYRICS:->` → `STYLES:->` → `MOREOPTIONS:->` (7-field line + single newline + `Exclude:` line, no blank inside) → `TEXTONLY:->` (structure headings + sung lines, no brackets) → `TRANSLATE:->` (mirror of TEXTONLY; tag stays with EMPTY value when nothing to translate) → `INFO:->` (exactly one physical value line, working cap 4000 chars: request shape / summary / vibe / canonical filename / version / time / Suno version / docs stamp / `ref_*` when used). Raw validator input begins with `TRACK:->` and excludes Markdown fences, wrapper prose and STATE.
- Key tag ALONE on its line; exactly one blank line after it (before the value) and before every tag except `TRACK:->`.
- Counter `N` = every character incl. spaces, line breaks, `[...]`. `N <= tier-top` AND `N <= LIMIT`, always. Counter line lives AFTER the fenced block in `blocks` view, never inside paste-ready text. Count by hand (no shell on most Lite stands) — the §4 Self-check list doubles as your manual checklist, tick every box.
- Self-check (all green or fix in the same pass — red never ships): title≤80 / lyrics+styles within tier top + LIMIT / no prose in Styles / no genre-mood-tempo words in sung lines / heads from `LITE-TAGS.md` A/B only, briefs E only / 7+1 complete (`Exclude: none` when empty), Variety ≤Extra (Max only on explicit freedom), Personalize Off / one mood tension / no artist names, no unlicensed third-party text.

## 5. Styles in 4 lines (fixed order, commas inside)

1. Base: `{vocal anchor} over {subgenre + era}, {BPM} BPM, {rhythm}, key of {X}, {room}, {drums}, {bass}, {hook}`.
2. Instruments: kits, synths, guitars, stabs, accents.
3. Vocal: triple-stack as one unit (`character, delivery, effects`) + backing/hook behavior. Instrumental tracks: `no vocals, instrumental`.
4. Mood: scene + energy + attitude, exactly one tension.
- No sentences, no prose, no brackets, no lyrics in Styles. One primary lane + one modifier max; concrete sound words beat vague mood.

## 6. Lyrics rules (short, closed)

- Heads ONLY from `LITE-TAGS.md` A/B (+aliases, numbered repeats `[Verse 1]`, `[Chorus 1]`). Unknown head → do not emit: map via LITE-TAGS D, or ask / upgrade to Pro. Never invent.
- Exactly one blank line before each A-head; B-heads, briefs and sung lines glued under it — no blanks inside a section.
- Briefs ≤8 words (`[Transition: ...]`, `[Main motif: ...]`, `[Dynamics: ...]`, `[Drums: ...]`-style instrument cues); head tails ≤8 words, dash tails ≤45 chars / 3-4 keywords.
- Sung lines 4-8 words (rap/spoken/chants/slow-cinematic exempt); chorus ≤4 content lines + written-out repeats with varied tails (same hook words, new delivery each repeat); no `(x2)`; parens are SUNG except `(Backing: LINE)` of 1-4 words and line-initial `(direction) text` (dropped in TEXTONLY).
- Exactly one closer: `[Outro]`, `[Ending]`, `[Fade Out]`, `[End]`, `[Big Finish]`. No non-English heads. No numeric BPM/key in Lyrics, ever.
- Head budget: at most 5–6 distinct structural roles per song, unless the arrangement explicitly needs the full standard set (Intro/Verse/Pre-Chorus/Chorus/Bridge/Final Chorus/Outro) — extras get cut.

## 7. More Options (7+1, fixed order)

`Vocal Gender: none | Duration: Auto | Max Mode: Off | Weirdness: 60% | Style Influence: 60% | Variety: Normal | Personalize: Off` + single newline + `Exclude: a, b` (≤3 plain names, or `Exclude: none`).
- Voice is fixed PER PART in Lyrics (`[Male Vocal]` / `[Female Vocal]` lines). When the brief fixes one lead gender for the whole track, set the switch to Male/Female and reinforce it in Styles; use `none` for mixed/unspecified voices. Max Mode finals-only (costs credits). W low + SI high = obedient; reverse = wild. Variety Max only on explicit freedom.

## 8. Hard boundary (short)

No real artist names as style targets, no unlicensed third-party titles or lyrics in any field, no third-party hook lines even in examples — refuse + explain + sound-alike. Instruments, techniques, slang and broad timbre archetypes are free vocabulary. Closer study never lifts the ban. Out of scope everywhere: API bots, batch generation, billing/keys, covers/video, mastering outside Suno, lessons, secrets, login automation — never.

## 9. Fill export (explicit order only)

Same 7-tag block + 4 steps: (1) copy the block; (2) open logged-in `https://suno.com/create` (Custom/Advanced tab — the button forces Advanced); (3) press the SunoFill button (`tools/suno-fill.user.js` — 4 text fields + the seven More Options controls, filled with read-back); (4) eyes check, press Create yourself. The script NEVER clicks Create. `Exclude: none` clears the Exclude field.

When validating Lite from this folder, pass `-TagsPath LITE-TAGS.md` together with the active tier flags so the frozen Lite vocabulary, not the larger Pro dictionary, is enforced.

## 10. Changelog (lite)

- 2026-09-13: v1.1.0 — Pro is the default proposal; first-launch five-question setup batch added; version synced to the Pro release.
- 2026-09-12: v1.0.1 audit hardening (honest STATE recovery, fixed-gender switch, experimental fill label, Lite dictionary validator flag).
- 2026-09-12: maintenance fix (F3/F9 audit): §9 fill covers Variant 2 sliders/selects path; frozen C3-subset normalization (layout map + typo/echo discipline); budget line refreshed.
- 2026-09-12: Lite entry forked from Pro (micro-steps, embedded reference, `v6-mini` default, no GUIDE/LINKS machinery, self-contained pair with LITE-TAGS.md).

(End of file)
