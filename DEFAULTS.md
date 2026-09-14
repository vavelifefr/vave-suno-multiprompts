# DEFAULTS.md — Pro runtime state for vave-suno-multiprompts (operator-approved)

- Version: 2026-09-13. Status: baseline for every session.
- Read order: the skill reads this file FIRST at session setup (SKILL.md §2) and uses these values as the session baseline.
- Change discipline: per-run overrides (explicit in the request or forced by context) live in WINDOW MEMORY ONLY and never edit this file. Edit this file ONLY on an explicit file-change order (`update defaults`, `make it default`, `write to settings`). If the order is ambiguous — ask, don't write.
- Scope: this file holds SESSION DEFAULTS only (operator-approved values). Normative rules live in `RULES.md` (policy) and `SKILL-CORE.md` (process); vocabulary in `SUNO-TAGS.md`; hard constraints always win over defaults.

## A. Basics (top of the Create form: model → languages → presentation → export → detail → scope)

1. `model`: `v6` — one of the really existing Suno models, never invented.
2. `main_comm_lang`: `Ru` — questions, summaries, explanations.
3. `main_lyrics_lang`: `Eng` — song language default.
4. `presentation_mode`: `chunk` — primary package shown as one single 5-tag block (shape: SKILL-CORE C4). Alternatives on explicit request only: `blocks` (SKILL-CORE C4 human order), `single:<BLOCK>` (only the named block, same fence+counter shape as SKILL-CORE C4, nothing else).
5. `export_action`: `none` — no export unless explicitly triggered per run: `parser` (SKILL-CORE C4 block re-emit for machine copy; trigger `make for parser`), `fill` (SKILL.md §5.1 + SKILL-CORE C2 step 5; trigger `fill for tamper`).
6. `detail`: `lyrics_size M` (ceiling 3000 chars) / `styles_size M` (ceiling 600 chars). Tier = ceiling only, no lower bound; working caps stay above (lyrics 5000 / styles 1000 — officially unverified, verify live); tier tops are heuristic operating ceilings. Below-top with a `no filler` report is fine.
7. `scope`: `single` — every order is a standalone single unless album/corridor explicitly requested.

## B. Fields (form order: Title → Lyrics → Styles → More Options)

8. `title_cap`: 80 (conservative; live v6 allows up to 100, not used). Auto-shorten if over, result shown post-factum.
9. `moreoptions`: `Vocal Gender: none | Duration: Auto | Max Mode: Off | Weirdness: 60% | Style Influence: 60% | Variety: Normal | Personalize: Off`
   - `Vocal Gender` is `none` for mixed/unspecified voices. If the brief fixes one lead gender for the whole track, set Male/Female and reinforce it in Styles; per-part changes remain in Lyrics tags.
10. `exclude_default`: EMPTY in this file (manual edits here only). Every generation still authors `Exclude:` per track from meaning/context — hard manual ban of forbidden styles (≤3 focused items, `Exclude: none` when nothing to ban).
11. `translation`: `on-request` — clean text (`text`) and its mirror (`translate`) print only when asked, outside the 5-tag block; they are not part of the package. The lyrics language is sticky for the branch (`lang:` in INFO; §F Q6).

## C. Fill triggers (behavior, unchanged)

12. Parser/fill exports only on explicit triggers (`make for parser` / `fill for tamper`); `text` / `translate` print outside the block; sibling/variation quick commands (`sibling of <track>` / `variation`) never reset the branch. Fill = same 5-tag block + 4-step instruction (§5.1); the userscript fills the 4 text fields (Lyrics/Styles/Title/Exclude) and applies the More Options controls (7-field line: Vocal Gender/Duration/Max Mode/Weirdness/Style Influence/Variety/Personalize), forces the Advanced tab, and never clicks Create. Type/BPM/Key stay manual.

## D. Sources (links + guide)

13. `sources`: `LINKS.md` + `GUIDE.md` (EN, same folder). GUIDE.md is read once per window and consulted first (mechanics only; style vocabulary accrues in STYLE-NOTES.md on demand). Network refresh only on first-ever launch, explicit trigger (`update docs`, `refresh sources`, `sync docs`), failure-escalation (3-4 reworks + complaint), or style-note miss (targeted fetch + link + STYLE-NOTES.md entry). STALE = 10+ days (flag + suggest, no auto network). Reference-research source aids (Wikipedia / AllMusic / Discogs / MusicBrainz / Beatport / BPM-key, etc.) live in LINKS.md §5 and are used only when the model-first dossier is `thin` (ADAPTERS A7); the dossier is provenance-only.

## E. Variant (entry power)

14. `variant`: selected at startup per SKILL.md §0 and confirmed by the operator (`pro` / `lite`, remembered for the window). **Default proposal is `pro`**; `lite` is proposed only for a narrow window or when the full canon cannot be loaded. `pro` = SKILL.md + full dictionary/tools/guide/registry. `lite` = LITE.md + LITE-TAGS.md only (no GUIDE/LINKS reads, no web-refresh machinery; model default `v6-mini`). Forced override (`force lite` / `force pro`) wins immediately, mid-window switch only on explicit order. Record `variant` + `profile` (Full / Chat+files / Inline / Stateless / No-web, combined when needed); stateless → STATE card instead of memory, no-shell → manual checklist instead of the validator run.

## F. First-launch setup batch (ask once per window)

On first activation in a window, **after** the §E variant handshake and **before** the first brief, run this six-question batch once. Ask it in the comm language (comm default Ru; answer in any language). When the stand exposes an interactive question tool, present each item as a chooser (custom answer field only where the item allows it); otherwise ask as a numbered batch. Record the answers in window memory; edit this file only on an explicit order. Skip the batch after `force pro` / `force lite` unless the operator asks, never re-ask within the same window. Communication language and scope are no longer asked here — they use the §A defaults (`Ru`, `single`) unless the brief overrides them.

1. **Suno version** (the model to generate with): `v6` (default) / `v6-wild` / `v6-mini` — only these three; there is **no** "your own" (never invent a model name). Recorded in INFO `model:`; `v6-mini` is the free tier (see SKILL.md §7.1 for its limits).
2. **Skill variant**: `Pro` (default) / `Lite` — exactly two options. Confirms or overrides the §E handshake proposal; `Lite` switches the window to LITE.md + LITE-TAGS.md.
3. **Prompt detail** ("How detailed should the prompt be?"): `XL/XL (5000/900)` / `L/L (4000/800)` / `M/M (3000/600, default)` / `S/S (1000/250)` / `Maximum (5000/1000)` — listed high→low, with Maximum (the working caps) last; the numbers are lyrics/styles character ceilings (RULES R3).
4. **Track source** (what the track will be — where the style comes from): `Reference` (one or several) — name them and the skill builds the dossier **model-first** (own knowledge), googling only if the result is thin (ADAPTERS A7) / `Own style — detailed` — you describe the style yourself in detail and the skill uses it as given / `Own style — brief` — you give a short style and the skill expands it into a detailed Suno-ready style.
5. **Song task** (what to make — this is NOT the language choice): one free-form answer — a theme plus roughly how much text (`little` / `medium` / `a lot`) or the full text pasted as-is — **or** `Instrumental + Hooks and Chops`, **or** `Instrumental`.
6. **Lyrics language**: `English` (default) / `Russian` / your own. This question **wins** over the language of any text supplied in Q5: if Q5's text is in another language, re-author / translate it into the Q6 language. For an instrumental task (Q5) the language is ignored. The choice is **sticky for the branch** (`lang:` in INFO).

## G. QoL toggles (optional, window memory only)

- `diff_preview`: `on` (default) — paper edits show a compact `was → now` preview before the package; `no diff` suppresses it.
- `alt_takes`: `off` (default) — `alt-takes` / `2 styles` / `3 styles` emit 2–3 named style variants (a/b/c) before locking; the operator picks, then the run continues.
- `explain`: `off` (default) — `explain` annotates the chosen descriptors/sections with short reasons in the human summary (never inside the block).
- `pin`: `3` (default) — the STATE card keeps the last N approved tracks in its `PINNED` table; `pin <N>` changes it.
- `sibling` / `variation`: quick commands that never reset the branch (CORE C2 step 7).
- `archive`: `on` — every approved package is saved to `Prompts/<title>_<dd_mm_yy>.txt` (raw 5-tag block; personal, gitignored, collisions get `_HHMM`); `off` disables.
- `text` / `translate`: on-request clean text and its mirror, printed outside the 5-tag block.

