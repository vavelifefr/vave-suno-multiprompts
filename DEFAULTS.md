# DEFAULTS.md — Pro runtime state for vave-suno-multiprompts (operator-approved)

- Version: 2026-09-13. Status: baseline for every session.
- Read order: the skill reads this file FIRST at session setup (SKILL.md §2) and uses these values as the session baseline.
- Change discipline: per-run overrides (explicit in the request or forced by context) live in WINDOW MEMORY ONLY and never edit this file. Edit this file ONLY on an explicit file-change order (`update defaults`, `make it default`, `write to settings`). If the order is ambiguous — ask, don't write.
- Scope: this file holds SESSION DEFAULTS only (operator-approved values). Normative rules live in `RULES.md` (policy) and `SKILL-CORE.md` (process); vocabulary in `SUNO-TAGS.md`; hard constraints always win over defaults.

## A. Basics (top of the Create form: model → languages → presentation → export → detail → scope)

1. `model`: `v6` — one of the really existing Suno models, never invented.
2. `main_comm_lang`: `Ru` — questions, summaries, explanations.
3. `main_lyrics_lang`: `Eng` — song language default.
4. `presentation_mode`: `chunk` — primary package shown as one single 7-tag block (shape: SKILL-CORE C4). Alternatives on explicit request only: `blocks` (SKILL-CORE C4 human order), `single:<BLOCK>` (only the named block, same fence+counter shape as SKILL-CORE C4, nothing else).
5. `export_action`: `none` — no export unless explicitly triggered per run: `parser` (SKILL-CORE C4 block re-emit for machine copy; trigger `make for parser`), `fill` (SKILL.md §5.1 + SKILL-CORE C2 step 5; trigger `fill for tamper`).
6. `detail`: `lyrics_size M` (ceiling 3000 chars) / `styles_size M` (ceiling 600 chars). Tier = ceiling only, no lower bound; working caps stay above (lyrics 5000 / styles 1000 — officially unverified, verify live); tier tops are heuristic operating ceilings. Below-top with a `no filler` report is fine.
7. `scope`: `single` — every order is a standalone single unless album/corridor explicitly requested.

## B. Fields (form order: Title → Lyrics → Styles → More Options)

8. `title_cap`: 80 (conservative; live v6 allows up to 100, not used). Auto-shorten if over, result shown post-factum.
9. `moreoptions`: `Vocal Gender: none | Duration: Auto | Max Mode: Off | Weirdness: 60% | Style Influence: 60% | Variety: Normal | Personalize: Off`
   - `Vocal Gender` is `none` for mixed/unspecified voices. If the brief fixes one lead gender for the whole track, set Male/Female and reinforce it in Styles; per-part changes remain in Lyrics tags.
10. `exclude_default`: EMPTY in this file (manual edits here only). Every generation still authors `Exclude:` per track from meaning/context — hard manual ban of forbidden styles (≤3 focused items, `Exclude: none` when nothing to ban).
11. `translation`: `auto` — attach iff `lyrics_lang != comm_lang`; multiline mirror of TEXTONLY (no tags, no '/' joins); EMPTY value when the languages are equal (tag stays for parser stability).

## C. Fill triggers (behavior, unchanged)

12. Parser/fill exports only on explicit triggers (`make for parser` / `fill for tamper`). Fill = same 7-tag block + 4-step instruction (§5.1); the userscript fills the 4 text fields (Lyrics/Styles/Title/Exclude) and applies the More Options controls (7-field line: Vocal Gender/Duration/Max Mode/Weirdness/Style Influence/Variety/Personalize), forces the Advanced tab, and never clicks Create. Type/BPM/Key stay manual.

## D. Sources (links + guide)

13. `sources`: `LINKS.md` + `GUIDE.md` (EN, same folder). GUIDE.md is read once per window and consulted first (mechanics only; style vocabulary accrues in STYLE-NOTES.md on demand). Network refresh only on first-ever launch, explicit trigger (`update docs`, `refresh sources`, `sync docs`), failure-escalation (3-4 reworks + complaint), or style-note miss (targeted fetch + link + STYLE-NOTES.md entry). STALE = 10+ days (flag + suggest, no auto network).

## E. Variant (entry power)

14. `variant`: selected at startup per SKILL.md §0 and confirmed by the operator (`pro` / `lite`, remembered for the window). **Default proposal is `pro`**; `lite` is proposed only for a narrow window or when the full canon cannot be loaded. `pro` = SKILL.md + full dictionary/tools/guide/registry. `lite` = LITE.md + LITE-TAGS.md only (no GUIDE/LINKS reads, no web-refresh machinery; model default `v6-mini`). Forced override (`force lite` / `force pro`) wins immediately, mid-window switch only on explicit order. Record `variant` + `profile` (Full / Chat+files / Inline / Stateless / No-web, combined when needed); stateless → STATE card instead of memory, no-shell → manual checklist instead of the validator run.

## F. First-launch setup batch (ask once per window)

On first activation in a window, **after** the §E variant handshake and **before** the first brief, run this five-question batch once. Ask it in the comm language (comm default Ru), each question with the listed options plus a free-form "your own" field; a plain confirmation accepts the defaults. When the stand exposes an interactive question tool, present each item as a chooser (listed options + a custom answer field); otherwise ask as a numbered batch. Record the answers in window memory; edit this file only on an explicit order. Skip the batch after `force pro` / `force lite` unless the operator asks, and never re-ask within the same window.

1. **Lyrics language** (language of the song text): `English` (default) / `Russian` / your own.
2. **Communication language** (questions, summaries, explanations): `Russian` (default) / `English` / your own.
3. **Model** (Suno target): `v6` (Pro/Premier default) / `v6-wild` / `v6-mini` / your own — never invent a model name. Recorded in INFO `model:`; `v6-mini` is the free model (see SKILL.md §7.1 for its limits).
4. **Detail tier** (lyrics/styles ceilings): `S/S` / `M/M` (default) / `L/L` / `XL/XL` / your own.
5. **Scope** (order shape): `single` (default) / `album corridor` / `sibling of a past track` / your own.
