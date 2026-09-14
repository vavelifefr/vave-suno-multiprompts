# ADAPTERS.md — runtime bindings for vave-suno-multiprompts (all stands)

- Status: the ONLY file allowed environment verbs (read, write, run, fetch, remember). `SKILL-CORE.md` (process) and `RULES.md` (policy) stay pure; this file binds their `<injects>` to real sources per stand. When a binding is missing, the fallback runs — never fantasy compliance.
- Duty tags: HARD = `SKILL-CORE.md` + `RULES.md` in full, every stand. HARNESS / MEMORY duties degrade per the matrix below.

## A0. Handshake (first message, 30 seconds, observable facts only)

1. Prove, don't believe: folder files open? shell runs? web fetches? do you remember this window's start? Ask the operator where YOU cannot observe (one line), never introspect capacity.
2. Variant by the 128k line and loadability: **default proposal is Pro** when the window can hold CORE+RULES+TAGS and the required files are available. Missing shell, web, or retained memory selects the documented Pro degradation (manual checklist, embedded sources, STATE), not Lite by itself. Use Lite only for narrower windows or when the full canon cannot be loaded. Unsure → prove loadability before dropping to Lite.
3. Confirm in one line (in comm language), then wait: `Running <Pro|Lite> (stand: <adapter/profile>) — confirm or say force Lite / force Pro.` Force (any language) wins immediately, remembered for the window (or on the STATE card when stateless). Mid-window switch only on explicit order — track memory drops.
4. First launch in the window (after the handshake, before the first brief, unless forced): run the six-question setup batch from `DEFAULTS.md` §F once. **Adaptive Q4:** a chooser UI cannot attach free text to a choice, so when Q4 = `Reference`, present the track name(s) as their **own free-text field immediately after Q4** (`Reference name(s): Artist — Track`); the bare choice without a typed name is incomplete — ask once before Q5 and never advance to the package without it. Suno version (`v6` / `v6-wild` / `v6-mini`, no custom), skill variant (`Pro` / `Lite`), prompt detail (`XL/XL` / `L/L` / `M/M` / `S/S` / `Maximum (5000/1000)`), track source (`Reference`(s) → model-first dossier, web only if thin / `Own style — detailed` / `Own style — brief` → skill expands), song task (conditional on track source: `Reference` → `As in the reference` first, then the own/instrumental options; `Own style` → theme + little/medium/a lot, or the full text, or `Instrumental + Hooks and Chops`, or `Instrumental`), lyrics language (`English` / `Russian` / own — this wins over the language of the Q5 text). Never re-ask within the window.

## A1. API agent (folder + shell + web — the Full stand)

Examples: agent harnesses with workspace files, shell execution, web access. Bindings: `<SESSION DEFAULTS>` ← `DEFAULTS.md` (first read); `<DICTIONARY>` ← `SUNO-TAGS.md` (every emit); `<TRACK STATE>` ← window memory + STATE card as backup; research ← web per query-craft, else operator; validator RUNS (`tools/validate-block.ps1`, tiers flagged); GUIDE/LINKS read per §2.1 policy; SunoFill via operator browser. Entry: Pro default. This stand runs everything as written.

## A2. Chat with files / long-context chat (files open, no shell)

Examples: chat harnesses where project files or knowledge attach (custom GPTs, projects, Gems), and long-context chat assistants (Claude-style projects) — IF attachable, else fall through to A4. Bindings: `<SESSION DEFAULTS>` ← `DEFAULTS.md` or pasted setup line; `<DICTIONARY>` ← `SUNO-TAGS.md` or pasted tables; `<TRACK STATE>` ← conversation memory + STATE card demanded on long threads (cross-session memory is unreliable — say so openly); research ← built-in browsing if present, else operator (never invented); validator → manual checklist per RULES R9 / CORE C4, counters by hand. Notes: prefer the pasted-bundle deploy (CORE + RULES + TAGS + one setup line) when knowledge upload is unavailable; STATE card mandatory on multi-track threads. Entry: Pro if the window comfortably holds CORE+RULES+TAGS, else Lite.

## A3. Gemini / AI Studio (no files — the Inline stand)

Bindings: EVERYTHING arrives pasted — deploy bundle = `SKILL-CORE.md` body (no frontmatter) + `RULES.md` body + full `SUNO-TAGS.md` text + one setup line (model + comm + lyrics + tiers + variant). No date/sync bookkeeping exists here (nothing persists) — LINKS/GUIDE refreshes happen ONLY on explicit operator order with pasted sources; `never`/`synced` stamps are not maintained. `<TRACK STATE>` ← conversation history + STATE card (long histories eat tokens — restart per track, restore via `restore from:`). Research: grounding/search ON for detail work where available. Validator: manual checklist, counters by hand. Entry: usually Lite (paste weight), Pro only with high token budget and strong model.
- Run settings: AI Studio model — reasoning task -> Pro, iteration drafts -> Flash; Suno target — finals -> `v6`, drafts -> `v6-mini`; technique -> low temperature; research steps -> grounding/search ON; raise max tokens so Lyrics+Styles fit.
- Prompt order in every turn: context first, task second, bans/format last (`Based on the information above, ...`).
- One chat per track/album branch (`new track` = new chat). Pin model + languages + doc date in the first message. History eats tokens: restart the chat when it stops helping.
- Parser export and `.txt` save are manual copy/save in AI Studio.

## A4. Local LLM (weak instruction-following assumed until proven)

Examples: Ollama / LM Studio–class runtimes, small or quantized models. Bindings: files IF the harness exposes them, else A3-paste; web usually absent → research is always operator-provided; shell rarely → manual checklist. Entry: Lite, always at first (micro-steps, batched questions, `~default` veto marks, no silent authorship of audible decisions). Graduate to Pro only after a clean Lite track AND operator order. Keep outputs short; one variable per round, strictly.

## A5. API stateless inference (no memory between calls — Stateless mandatory)

Bindings: `<SESSION DEFAULTS>` ← system prompt or per-call prefix; `<DICTIONARY>` ← system prompt or per-call paste; `<TRACK STATE>` ← caller-supplied STATE card in every request (no card + no history = fresh branch, run setup, never reconstruct); research ← caller-provided `<RESEARCH>` or explicit web tool when the deployment has one. Window/track memory duties are VOID — the STATE card is the entire memory model. Entry: either, by per-call budget; Lite recommended for narrow windows.

## A6. Weak-stand fallbacks (when even Lite is too heavy)

Lite (`LITE.md` + `LITE-TAGS.md`) is the primary answer for weak stands. If the stand still struggles, drop a level explicitly — never silently:
- FULL: everything (CORE + RULES + TAGS + runtime).
- COMPACT: CORE track run + output shapes + TAGS A/B + E + R1 + parser block shape.
- MINIMAL: creation rules + hard caps (N/LIMIT, title cap) + R1 only.
- Drop a level on visible degradation (ignored constraints, invented tags, lost counters).

## A7. Reference research (model-first, web on medium/thin)

Trigger: the `detail` branch of CORE C2 step 2 (the brief names a real band/artist/track/album). Goal: fill the Reference Dossier (CORE Injects `<RESEARCH>`) BEFORE writing the package.

1. **Try first from the model's own knowledge.** Attempt the whole dossier yourself: genre/lane, era, BPM/key/meter, instrumentation (with roles), arrangement arc, vocal type/register/delivery, production character (qualitative), moods/descriptors, and 2-3 signature production markers. Do not stall and do not ask permission for this step — just produce your best attempt.
2. **Self-assess honestly.** Tag each field `high | medium | low`. The **load-bearing** fields are BPM/key/meter, instrumentation, arrangement arc, and at least one signature production marker. The dossier is `thin` if any of them is missing/low; it is `medium` if a load-bearing field is only partial or dated. **Open the corridor unless every load-bearing field is `high` — a `medium` field already earns a search; when in doubt, search.** A reference you do not actually know is `low` — never invented.
3. **Open the small web corridor (≤5 queries)** whenever the dossier is `medium` or `thin`: exact-phrase/`site:` preferred; stop when the dossier fills or the same domains repeat; snippets are leads — open and verify; ads/boosted ≠ authority. Typical queries: `"<track>" BPM key`, `"<track>" credits personnel instruments`, `"<track>" making-of production mix`, `"<track>" review style arrangement`. Say plainly when public production info does not exist, and leave gaps `?`.
4. **Label claim strength.** Own knowledge = `heuristic`; a single web source = `community`; a structured database or editorial outlet = `database`/`editorial`. Keep the strongest label per field.
5. **Sources are aids, not obligations.** No source is mandatory and no stand is blocked by missing one. Useful destinations if you do search: Wikipedia, AllMusic, Discogs, MusicBrainz, Beatport, SongBPM/MusicStax, SecondHandSongs, WhoSampled, Hooktheory (registered in `LINKS.md` §5). Any reliable page is fine.
6. **Quality bar:** "would this let a producer recreate the feel?" If not, dig one more step (own knowledge or web) before writing the package.

Dossier → package mapping (single source of truth: GUIDE §4.5 table): genre/era + instrumentation + vocal + BPM/key + moods → the four Styles parts; arrangement + prosody → Lyrics; bleeders → Exclude ≤3. R1 restated: the dossier is provenance — real names/titles appear ONLY in the human summary and INFO `ref_track`/`ref_sources` (optional compact `ref_dossier`), NEVER in Lyrics/Styles/Title/Exclude, and hook lines are never copied.

## Bindings matrix (inject → source per adapter)

| Inject | A1 agent | A2 chat+files | A3 inline | A4 local | A5 stateless |
|---|---|---|---|---|---|
| SESSION DEFAULTS | DEFAULTS.md | file or setup line | setup line | file or setup line | system prompt / prefix |
| DICTIONARY | SUNO-TAGS.md | file or paste | full paste | file or paste | system prompt / paste |
| TRACK STATE | memory + card | memory + card | history + card | card first | card only |
| RESEARCH | web / operator | browsing / operator | grounding / operator | operator only | caller / tool |
| Validator | run script | manual checklist | manual checklist | manual checklist | manual checklist |
| GUIDE/LINKS | policy reads | policy reads if files persist | explicit order + pastes | not maintained | not maintained |

## Tools map (shared, stand-independent)

- `tools/validate-block.ps1` — structural validator (shape, tags, counts+caps, tiers when flagged via `-LyricsTier/-StylesTier` — always pass the session tiers so ceilings are enforced, not just reported). Needs PowerShell 5.1+; everywhere else the manual checklist that mirrors it is RULES R9 (+ CORE C4 shapes): 5 tags in order / blanks around key tags / MOREOPTIONS 7+1 / INFO stamps (incl. `model:` + `lang:`) / no brackets in STYLES / heads A/B, briefs E / one closer / Styles 4 lines / Exclude ≤3 / N within tier top + working caps.
- `tools/suno-fill.user.js` — browser userscript (operator side, all stands): fills four text fields (Lyrics/Styles/Title/Exclude) from the clipboard, applies the More Options controls (Vocal Gender/Duration/Max Mode/Personalize toggles, Weirdness/Style Influence sliders, Variety by name) with read-back, and forces the Advanced tab; it never clicks Create. When the free/mini model is selected it logs a FREE-TIER notice and applies the safe style cap. The read-only diagnostics command emits one copyable JSON report (fields, selectors, sliders, control rows, tabs, model, caps) without writing or clicking.
- Web research backend — `LINKS.md` registry + `GUIDE.md` mechanics + `STYLE-NOTES.md` entries where files persist (A1/A2); pasted excerpts on explicit order elsewhere (A3); operator-fed everywhere as fallback (A4/A5). Query craft (every search must earn a field): 2-3 targeted queries per track — facts (`"<title>" BPM key`), making-of (`sound on sound` / `mix` / producer interview), reception (descriptive vocabulary, paraphrased, never quoted); exact-phrase and `site:` over one broad query; ads/boosted ≠ authority; snippets are leads, open and verify; stop rule (same domains twice / no new facts → stop, gaps marked `?`).
- Link intake mechanics (Input D): fetch the URL once from the harness (or operator paste); shell/metadata-only result → one-line notice + 4-field paste request (Lyrics/Styles/Title/Exclude); INFO carries `ref_url:` + `import:`.
- Parser export mechanics: one 5-tag block per CORE C4, manual copy/save. Present the chunk ALWAYS as ONE fenced code block (```text … ```) in the answer — that fence is the copy-button window; a file write / archive is only a side artifact and never a substitute for it (harness file cards have no copy button). Single-emission: exactly one fenced block per turn (the final variant); no draft+final pair, no implicit parser re-emit beside the package; re-emit only on a fresh explicit trigger, as a replacement. On request, show the clean text (`text`) or its mirror (`translate`) as separate plain blocks, never inside the 5-tag block. No buttons and no file writes in button-less stands (AI Studio: operator copies); agent harnesses may additionally write `.txt` on explicit request. Never emit silently alongside the human package.
- Prompt archive (personal): after each approved package, on a stand that can write files, save the raw 5-tag block to `Prompts/<Title_with_underscores>_<dd_mm_yy>.txt` (spaces → `_`; on a name clash append `_HHMM`). Contents = the raw block only (TRACK:-> through the INFO value) — no fences, no summary, no STATE. The folder is gitignored: personal prompt files never reach the repo (only `.gitkeep` is tracked). Button-less stands skip it and say so.
- QoL commands (Pro, window memory): `text` / `translate` (clean text + mirror), `sibling of <track>` / `variation` (no reset), `alt-takes` / `2 styles` (a/b/c style variants), `diff` / `no diff` (edit preview), `explain` (descriptor reasons), `pin <N>` (STATE last-N table). None of them touch the 5-tag block shape.
- STATE fingerprint (CORE C5): under A1, when the raw block is saved, compute `sha256:` with `Get-FileHash` and inject it into the STATE card; every other stand emits the `structural:` fingerprint (lyrics/styles counts + title + last 24 chars of the INFO value). The fingerprint identifies the package for verified restore; it never replaces the parser package.

## Changelog (normative)

- 2026-09-14: A7 gate widened — the web corridor opens on a `medium` **or** `thin` dossier (search unless every load-bearing field is `high`), so the model googles more readily.

- 2026-09-14: single-emission (the 5-tag block shows once per turn, final only) + adaptive Q4 (capture the reference name in the same question; ask once if empty before Q5).

- 2026-09-14: personal prompt archive (`Prompts/<title>_<dd_mm_yy>.txt`, gitignored) written on every approved package on writable stands.

- 2026-09-14: QoL commands documented (diff preview, alt-takes, explain, pin) alongside `text`/`translate` and sibling/variation.

- 2026-09-14: pre-release rc — parser block is 5 tags; `text`/`translate` are on-request exports (tools map + export mechanics updated); INFO gains `lang:`.

- 2026-09-14: A7 reworked to model-first — the model attempts the full dossier from its own knowledge, self-assesses (`thin`), and only then opens the ≤5-query corridor; the source list is now optional aids, not a mandatory set.

- 2026-09-14: A7 Reference research added (mandatory MusicBrainz + Discogs + AllMusic + BPM/key set, local Demucs/librosa add-on, ≤5-query corridor, dossier→package mapping, R1 provenance) — **superseded same day by the model-first rework above**. CORE C2 detail branch points here.

- 2026-09-13: Pro default + first-launch setup batch (A0 step 4); A2/A3 merged (chat-with-files + long-context chat) and renumbered A0–A6; manual-checklist pointer fixed to RULES R9 / CORE C4.

- 2026-09-12: runtime adapters extracted (A0–A7 + bindings matrix + tools map) — the only file with environment verbs.

(End of file)
