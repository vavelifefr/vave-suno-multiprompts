# vave-suno-multiprompts — README

Assembles ready-to-paste song packages for Suno from a vague wish, a finished text, a weak draft, or a link: Lyrics + Styles + More Options, pasted into Suno by hand or via a script button that fills the fields (its only UI action — it never presses Create). No code in outputs, no audio. This file is the feature showcase — the skill answers "what can you do?", "what are you for?", "how do you work?" from it. Living file: the skill updates it itself when functionality changes (rule in `SKILL.md` §2.1).

> Mission (prime directive): write prompts that obey the `SKILL.md` rules and the current Suno docs — above speed, brevity, and cleverness.

## Skill role (what it is and why)

- **Assembler, not a solo author**: turns one of 4 inputs into a package ready for the Suno UI. Decisions are recorded, versions numbered (v1/v2/v3), every package checked by counters and Self-check before release.
- **Translator of "want it like X" into a production dictionary**: breaks references into DNA (tempo, key, drum recipe, bass and lock, triple-stack vocal, structure, era, 2–3 production markers) and builds a sound-alike — similar sound without a single foreign line.
- **Discipline controller**: closed tag dictionary, tier ceilings, gated Self-check (red never ships), structural validator, hard copyright boundary §6.
- **Frugal researcher**: goes online only on 4 triggers and only point-wise (2–3 quality queries instead of broad googling); reads link dates locally for free.

## All features

**4 inputs.** A — wish from scratch; B — finished text (music for it); C — weak Lyrics/Styles draft (fix and push); D — link: public Suno track URL (`suno.com/song/...`) or streaming page (Spotify/YouTube/Yandex Music). Per link: one fetch attempt (usually shell/metadata only outside — says so honestly) → asks for the 4-field paste → gives a keep/change breakdown with rights awareness → on "take everything as the base" warns in one line first, then imports as a draft. INFO carries `ref_url:` and `import:`.

**Concept ideation (portable).** A wish with no ready text becomes 1–3 original candidate concepts, each anchored to real reference tracks (researched facts + DNA) — the operator picks one, then the package is assembled. No separate agent required; the skill does it on any platform.

**Two versions — Pro by default.** Pro (`SKILL.md` + full stack) is the default proposal — for strong models: full research, DNA, album corridors, lively dialogue with recommendations. Lite (`LITE.md` + `LITE-TAGS.md`) is proposed only for a narrow window or when the full canon cannot be loaded: micro-steps §§0–10, batch of 3–4 questions compiled into an explanation attached to the prompt, silent-fantasy ban (audible decisions get either an answer or a `~default` mark), railed siblings, default model `v6-mini`, no guide/registry/research. The fill button works in both. Gate `§0` is a handshake, not self-estimate: observable facts (files? shell? web? remembers the window start?) + the **128k** line; proposes Pro/Lite in one line and waits for confirmation; force (`force lite` / `force pro`) — immediately, no questions.

**First-launch setup batch (6 questions).** On first activation in a window, right after the handshake, the skill asks one batch of six questions: (1) **Suno version** — `v6` / `v6-wild` / `v6-mini` (no custom); (2) **skill variant** — `Pro` / `Lite`; (3) **prompt detail** — "how detailed should the prompt be?": `XL/XL` / `L/L` / `M/M` (default) / `S/S` / `Maximum (5000/1000)`; (4) **track source** — `Reference`(s) / `Own style — detailed` / `Own style — brief`. On `Reference` the skill asks for the track name(s) in its **own free-text field right after (4)** (a chooser can't attach text to a choice); without a typed name it will not go on. Then it builds the dossier model-first and googles only if it is thin; (5) **song task** — **conditional on (4)**: `Reference` → `As in the reference` first (theme + form mirror the reference, words stay original), then the remaining options (theme + little/medium/a lot or full text, `Instrumental + Hooks and Chops`, `Instrumental`); `Own style` → the own/instrumental options only; (6) **lyrics language** — `English` / `Russian` / own, which wins over the language of any Q5 text. Asked once, never re-asked in the window, skipped after `force`. Communication language and scope use their defaults (`Ru`, `single`).

| Metric (measured) | Lite pair | Pro stack | Delta |
|---|---|---|---|
| Instruction chars | 15759 | 116022 | **7.4×** | <!-- M:chars -->

The marked row is rewritten by `tools/measure.ps1 -UpdateReadme`.

A v1.0.x 10-track benchmark found Pro output only 2.2% longer while quality was 21.1% higher (its artifacts are no longer shipped; the static instruction stack is now about 7.3x larger). Hence: Lite for simple drafts and narrow windows, Pro for complex reference work and finals.

**Prompt archive (personal).** On workspace stands every approved package is saved to `Prompts/<title>_<dd_mm_yy>.txt` — the raw 5-tag block, no fences (spaces → `_`; collisions get `_HHMM`). The folder is **gitignored** (only `.gitkeep` travels), so your prompt files stay local and never reach GitHub. `archive: off` disables it.

**Internet research (Pro) — Reference Dossier (model-first).** For a detailed reference the skill first drafts the whole dossier **from the model's own knowledge** — genre/era, BPM-key-meter, instrumentation, arrangement arc, vocal, production, moods — and self-rates each field. A `medium` or `thin` result opens the small web corridor (search unless every load-bearing field is `high`): **max 5** exact-phrase/`site:` queries (facts, making-of, reception — paraphrase only); snippets are leads — open and verify; stop when filled or the same domains repeat; remaining gaps stay `?`. Sources (Wikipedia, AllMusic, Discogs, MusicBrainz, Beatport, SongBPM, SecondHandSongs, WhoSampled, Hooktheory — `LINKS.md` §5) are aids, not obligations. The dossier maps fingerprints-first onto the Styles 4 parts; when the reference carries text the skill mirrors its **form** — section map, line lengths/syllables, rhyme scheme — in fully original words (copy the shape, never the words). Names and titles live only in the summary/INFO `ref_*` — never in a Suno field.

**Source base + mini-guide.** `LINKS.md` — link registry with dates (`synced: DD.MM.YYYY` / `never`) in 4 trust tiers: 1 Suno official, 2 quality third parties (useful, not authoritative), 3 community/observed, 4 yours; single-song breakdowns banned — never overflows. `GUIDE.md` — assembly mechanics only (stateless) + `STYLE-NOTES.md` — on-demand style notes (no entry → point fetch → link + entry). Network — 4 triggers: first launch, explicit command (`update docs`, `refresh sources`, `sync docs`...), 3–4 reworks + complaint, style with no registry entry. Stale (10+ days) — one-line hint only.

**Package and controls.** Chunk = ONE fenced block holding the whole 5-tag package (`TRACK` through end of `INFO` value) — the copy-button window; `blocks` and `single:X` views on request. **Single-emission:** the final block is always shown as exactly one fenced code block in the answer (that fence carries the copy button); the archive file is a side artifact, never a substitute for it. Counters N ≤ tier ceiling and ≤ working caps (lyrics 5000 / styles 1000 / title 100 / exclude 1000 — officially unverified; heuristic: title 80, tiers M: 3000/600). Styles always in 4 parts (vocal-anchored base → instruments → triple-stack vocal → single mood, no contradictions). More Options — canonical 7+1 with presets (Obedient/Balanced/Wild). INFO records the setup `model:` (`v6` / `v6-wild` / `v6-mini`) and `lang:` (the sticky lyrics language); on `v6-mini` the package is marked non-commercial and Pro-only features (Custom Models / Voices / stems / Studio) are not proposed. Clean text (`text`) and translation (`translate`) print on request, outside the block; the parser block carries neither.

**QoL (Pro).** A one-line counter summary sits at the top of every package (`lyrics N/LIMIT · styles N/LIMIT · title N/LIMIT`). Paper edits show a compact **diff preview** (`was → now`, `no diff` suppresses it). `alt-takes` / `2 styles` emit 2–3 named style variants (a/b/c) before locking. `explain` annotates why each descriptor/section was chosen. `sibling of <track>` / `variation` spin a sibling without resetting the branch. `pin <N>` keeps the last N approved tracks in the STATE card.

**Fill into Suno.** `tools/suno-fill.user.js` — the button reads the parser block from the clipboard, forces the Advanced tab, fills 4 text fields (Lyrics/Styles/Title/Exclude) and applies the More Options controls (Vocal Gender, Duration, Max Mode, Personalize, Weirdness, Style Influence, Variety) with read-back. It never clicks Create. When the free/mini model is selected it logs a FREE-TIER notice and applies the safe style cap. The read-only diagnostics command emits one copyable JSON report (fields, selectors, sliders, control rows, tabs, model, caps) — one diagnostic run is enough.

**Validator.** `tools/validate-block.ps1` — an honest **structural** pass (not a full skill validator): 5 tags and block punctuation, MOREOPTIONS grammar, INFO stamps (incl. `model:` and `lang:`), no brackets in STYLES, A/B + E cement (incl. instrument cues and exactly one blank line before A-heads), exactly one closer, Styles exactly 4 lines, Exclude ≤3, model caps always, INFO `model:` must be `v6` / `v6-wild` / `v6-mini` and `lang:` a 2-3 letter code, tier ceilings via `-LyricsTier/-StylesTier` flags. Cross-field checks: the Vocal Gender switch must agree with the lead vocal tags, and instrumental Styles (`no vocals, instrumental`) forbid vocal tags and sung lines (FAIL); competing deliveries in one section and repeated Styles descriptors WARN. Free instrument dash cues are matched against a broad real-gear vocabulary, so uncommon instruments pass while invented heads fail; color/name lines are intentionally limited to operator-attested nouns (`Acid Phase`, `Main theme`). Semantics (mood, sung-line vocabulary, rights, render behavior) — eyes on Self-check; the validator does not promise it.

**Albums and siblings.** Pro: `lock style for album` — core (genre DNA, vocal, timbres, era) + variation corridor; sibling with freedom clause and ≥3 differences. Lite: railed sibling (`based on <finished track>`: same DNA core, new text + 2–3 named arrangement changes).

**Memory.** Window (model, languages, docs, defaults, variant) lives the whole window, never re-asked. Track (versions, DNA, render log, clean-text) dies with the branch (`new track` / `reset`). Lite remembers only the current version + previous delta. **Works without memory and files too**: stand profiles (Full / Chat+files / Inline / Stateless / No-web) with explicit degradations. The STATE v2 card carries a package fingerprint (`sha256:` under a shell stand, a recomputable `structural:` one elsewhere); exact correction or re-export also requires the matching parser package, verified against the fingerprint. Duties are tagged HARD / HARNESS / MEMORY.

**Copyright — hard boundary.** Foreign names/titles/lines — never in fields (reference-only in summary/INFO); foreign hooks never copied even into examples; 1:1 requests — refuse + explain + sound-alike. Hardware/styles/techniques/slang — free dictionary.

## What it cannot do (out of scope)

API bots, batch generation, billing/keys, covers/video, mastering outside Suno, music lessons, covers as a product, secrets. Suno login automation — never.

## Quick start (example first messages)

0. **First run in a window**: answer the six-question setup batch (Suno version, Pro/Lite, prompt detail, track source, song task, lyrics language) — or just confirm the defaults.
1. **From scratch**: `new track. Want dark synthwave, male vocal, ~100 BPM. Single, standard volume.` → answer the batch of pointed questions → get the package.
2. **By reference**: `new track. Like <band> — <track>, very close but original. English, male vocal.` → asks `detail / general`; `detail` builds the Reference Dossier from the mandatory sources (MusicBrainz/Discogs/AllMusic/BPM-key) first, then the sound-alike with DNA breakdown.
3. **Draft**: paste your Lyrics + Styles as-is → get v2 with a breakdown of what was red.
4. **By link**: drop a Suno track or YouTube/Spotify URL → keep/change breakdown → package.
5. **Sibling** (Lite): `based on <past track title> make it similar but change the arrangement and rewrite the text fully` → new branch.
6. **Into Suno**: copy the block → `suno.com/create` (Custom/Advanced) → SunoFill button → eyes check (More Options auto-filled) → Create yourself.

## Command cheat sheet

| Want | Write |
|---|---|
| New track / branch reset | `new track` / `reset` |
| First-launch setup batch | `setup` (re-ask) / `skip setup` |
| Select/force version | `force lite` / `force pro` |
| Parser block | `make for parser` |
| Button fill | `fill for tamper` |
| Clean text / translation | `text` / `translate` |
| Sibling / variation (no reset) | `sibling of <track>` / `variation` |
| Alt style takes | `alt-takes` / `2 styles` |
| Edit diff preview | `diff` / `no diff` |
| Explain choices | `explain` |
| Pin last N tracks | `pin 3` |
| Fresh docs/guide | `update docs` / `refresh sources` / `sync docs` |
| Album: style core / sibling | `lock style for album` / `make sibling track` |
| Switch comm/song language | `talk in English from now` / `talk in Russian from now` |
| Single block instead of chunk | `single:LYRICS` / `blocks` |
| Change a default forever | `update defaults` (otherwise — this run only) |

## Project map

| File | Role | Read by |
|---|---|---|
| `SKILL.md` | Pro composed entry: gate, composition, Pro runtime, §7 reference | model + human |
| `SKILL-CORE.md` | Core: pure process without environment verbs (injects instead of files) | model |
| `RULES.md` | Policy: R1–R9 (rights, budgets, cement refs, Self-check) | model |
| `SUNO-TAGS.md` | Shared dictionary (A/B + C/D + E + F/G + X) | model on every emit |
| `ADAPTERS.md` | Runtime bindings: handshake A0, 5 stands + fallbacks, tools | model |
| `LITE.md` | Lite canon: micro-steps §§0–10, batch+compile, railed sibling | model + human |
| `LITE-TAGS.md` | Lite dictionary core (A/B subset + E/X/D) | model on every emit |
| `DEFAULTS.md` | Session defaults (Pro: v6, Ru/Eng, chunk, M/M 3000/600, single, W60/SI60; Lite: v6-mini; variant — §E; setup batch — §F) — edit only on explicit order | model (first, Pro) |
| `GUIDE.md` | Pro runtime knowledge: stateless mechanics — read once per window | model (Pro) |
| `STYLE-NOTES.md` | Mutable style registry (cap 30000) | model (Pro, on demand) |
| `LINKS.md` | Runtime registry: 1 Suno official / 2 third-party / 3 community / 4 yours / 5 reference-research source databases | model (Pro) |
| `Prompts/` | Personal prompt archive — every approved package saved as `<title>_<dd_mm_yy>.txt`; **gitignored** (only `.gitkeep` is tracked) | skill (Pro) |
| `VERSION.md` | Release marker: versions, composition, variants | human |
| `CHANGELOG.md` | Normative release history (SKILL.md keeps only a pointer) | human |
| `ENCODING.md` | Encoding policy: text artifacts UTF-8 with BOM, JSON without BOM | human |
| `tools/suno-fill.user.js` | Fill button (4 text fields + More Options controls) + one-shot diagnostics; Create never touched | browser |
| `tools/validate-block.ps1` | Block validator + tag cement | terminal |
| `tools/measure.ps1` | Metrics (rewrites the marked metric row itself) | terminal |
| `tools/smoke.ps1` | Smoke harness (files, fences, encoding, micro-blocks, metrics) | terminal |
| `tools/check-encoding.ps1` | Encoding audit/fix: every text artifact + CP1251/mojibake detection | terminal |

Links: the gate picks the pair (Pro: SKILL+CORE+RULES+TAGS+runtime; Lite: LITE+LITE-TAGS); the core knows no files, the runtime holds no logic. The folder is a portable skill bundle — `SKILL.md` is the universal entry for any skill-capable platform; no host-specific registration required.

## Modes (runtime/maintenance)

**Runtime** (default) — track only, zero writes to files. **Maintenance** — only on explicit order: edits the ordered files (DEFAULTS, STYLE-NOTES, LINKS, README, changelogs) + sweep (links, validator, numbers via measure.ps1), exits back to runtime at the end. Mutable files — only on explicit order each time.

## Checks

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/smoke.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File tools/check-encoding.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate-block.ps1 -Path <block>.txt -LyricsTier M -StylesTier M
```

Smoke: files, fences, encoding policy, validator verdicts on embedded micro-blocks, README metrics freshness. Encoding: every text artifact is UTF-8 with BOM, JSON without BOM, no CP1251/mojibake (`-Fix` normalizes). Validator: VALID on a good block, INVALID with reasons on a bad one.

## Status and self-update

v2.0.0-rc12 (2026-09-14), Suno v6 family, embedded docs 2026-09-11. GUIDE 15478/50000 (measured). STYLE-NOTES 0/30000 (empty — accrues on demand). History — `CHANGELOG.md` (normative). **Rule: the skill adds every new user-facing feature here too (description + example + numbers if affected) in the same pass** — this file always mirrors the current feature set.

## FAQ

- **What to ask to start?** Any example from Quick start above — the skill will complete it with pointed questions.
- **Pro or Lite?** Don't guess: the skill assesses the window and proposes, you confirm. Roughly: strong paid — Pro; free/small — Lite.
- **Why one block of output?** Default `chunk` = one fenced 5-tag block (copy-button window) for copy-paste/parser. `blocks` or `single:LYRICS` — on request. Clean text (`text`) and translation (`translate`) print on request, outside the block.
- **Are Suno limits exact?** Three classes, don't mix: verified (Suno publishes no numbers — empty), working (lyrics 5000 / styles 1000 / exclude 1000 / title 100 — best known, re-verify live; styles 1000 and exclude 1000 observed live 2026-09-14, still unpublished by Suno), heuristic (title 80, tiers M: 3000/600 — safe policy). If live Suno disagrees — the box is right, fix the table the same day.
- **Does the skill browse at my expense?** Pro — only on 4 triggers and point-wise; Lite — never. Link dates are checked locally for free.
- **Foreign track as reference — allowed?** Yes: facts into research, sound into sound-alike. Foreign names/titles/lines — never in fields, only in summary/INFO.
- **Will a Suno track link suck everything in?** No: only the header is visible from outside. The skill will say so honestly and ask for the 4-field paste — then breakdown and package.
- **And if the model has no files, shell, or memory?** The §0 handshake detects the stand and engages degradation: manual checklist instead of validator, hand counting, STATE card instead of memory. Nothing is invented — what's missing gets asked.

(End of file)
