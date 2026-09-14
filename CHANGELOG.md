# CHANGELOG.md — vave-suno-multiprompts (normative history)

- Version: 2.0.0-rc11
- Date: 2026-09-14
- Note: normative release history. SKILL.md keeps only a pointer; runtime does not load this file.

- 2026-09-14: v2.0.0-rc11 (pre-release) — reference-research gate widened: the ≤5-query web corridor now opens on a **`medium` or `thin`** dossier (search unless every load-bearing field — BPM/key, instrumentation, arrangement arc, a signature production marker — is `high`), so the model googles more readily. CORE `<RESEARCH>`/C2, ADAPTERS A7 (+title), DEFAULTS §D, LINKS §5, README, VERSION synced.

- 2026-09-14: v2.0.0-rc10 (pre-release) — audit fixes. (a) README "no Suno automation"/"sliders by hand" reworded (the fill button applies the More Options controls; Create is never pressed) and the stale "6.0x" → **7.3×**. (b) userscript FREE-TIER log no longer claims sliders are untouched. (c) **Exclude cap 200 → 1000** (live-observed) across RULES R3, SKILL §7.2, README, and the validator (`$workExcludeCap`, WARN threshold). (d) `SKILL.md §8` adapter range `A0–A6` → `A0–A7`. (e) ADAPTERS/LITE changelog entries marked superseded/historical (mandatory A7 set, Variant 2). (f) CORE C2 no longer re-asks `detail`/`general` when the setup batch already set `Reference`+tier. (g) LITE counter placement aligned to the summary.

- 2026-09-14: v2.0.0-rc9 (pre-release) — **single-render fix**: the 5-tag block now appears exactly ONCE in the conversation. When the archive write surfaces its file content (harnesses that echo writes), that write IS the single render and the answer must NOT paste the block again; on harnesses that hide file content, the answer carries it once and the archive is written silently. CORE C4 + ADAPTERS + README synced (previously the echoed archive write plus the pasted block produced two copies).

- 2026-09-14: v2.0.0-rc8 (pre-release) — fix: `Reference` has no free-text slot in a chooser, so the track name(s) are now asked in their **own free-text field right after Q4** (`Reference name(s): Artist — Track`); the bare choice is incomplete and the skill never advances to Q5/package without a typed name. DEFAULTS §F, ADAPTERS A0.4, README synced.

- 2026-09-14: v2.0.0-rc7 (pre-release) — **single-emission rule** (the final 5-tag block is printed exactly ONCE per turn; no draft+final duplication, no implicit parser re-emit beside the package; re-emit only on a fresh trigger as a replacement — CORE C4, ADAPTERS) and **adaptive Q4** (on `Reference`, capture the track name(s) in the same question; if empty, ask once before Q5 — DEFAULTS §F, ADAPTERS A0.4).

- 2026-09-14: v2.0.0-rc6 (pre-release) — setup-batch refinement: Q4 = `Reference` → Q5 shows `As in the reference` **first**, then the other options (theme + little/medium/a lot or full text, `Instrumental + Hooks and Chops`, `Instrumental`) so an instrumental or a different text volume is still possible; Q4 = `Own style` → the own/instrumental options only. Synced DEFAULTS §F, ADAPTERS A0.4, VERSION, README.

- 2026-09-14: v2.0.0-rc5 (pre-release) — setup-batch logic fix: **Q5 (song task) is conditional on Q4 (track source)**. `Reference` → exactly one option `As in the reference`; `Own style — detailed/brief` → the own-task options (theme + little/medium/a lot or full text, `Instrumental + Hooks and Chops`, `Instrumental`). Synced DEFAULTS §F, ADAPTERS A0.4, VERSION, README.

- 2026-09-14: v2.0.0-rc4 (pre-release) — **personal prompt archive**: on writable stands every approved package is saved to `Prompts/<title>_<dd_mm_yy>.txt` (raw 5-tag block, spaces → `_`, collisions `_HHMM`). Folder is gitignored (only `.gitkeep` tracked) so prompt files never reach GitHub; `check-encoding` skips `Prompts/`. Added `archive:` toggle (DEFAULTS §G), CORE C2 step 5 archive duty, ADAPTERS mechanics, README feature + map row.

- 2026-09-14: v2.0.0-rc3 (pre-release) — formalized the dossier→package mapping: GUIDE §4.5 is now the single-source table (adds a **prosody** row and the dossier → primary-prompt → 5-tag-chunk chain note); ADAPTERS A7 prose replaced by a pointer to it. Docs-only consistency pass.

- 2026-09-14: v2.0.0-rc2 (pre-release) — QoL pack: **diff preview** on paper edits (`was → now`, `no diff`), **alt-takes** (`alt-takes` / `2 styles` → a/b/c style variants), **explain** mode (reasons next to chosen descriptors), **counter summary line** at the top of the human order, and a **`PINNED`** last-N-tracks table in STATE v2 (`pin <N>`, default 3). Documented in CORE C2/C4/C5, DEFAULTS §G, ADAPTERS tools map, README, LITE (Pro-only note).

- 2026-09-14: v2.0.0-rc1 (pre-release) — parser block reduced to **5 tags** (`TRACK`→`LYRICS`→`STYLES`→`MOREOPTIONS`→`INFO`); `TEXTONLY`/`TRANSLATE` removed and become **on-request exports** (`text` / `translate`, printed outside the block). INFO gains `lang:` and the lyrics language is **sticky for the branch** (edits in any language never switch it). **Decide-and-act** model stance (reason about reference + dialogue, then act with one short justification). Quick sibling/variation commands (`sibling of <track>` / `variation`) without reset. Lite mirrors Pro (no TEXTONLY/TRANSLATE). Validator: 5 tags, `lang:` required, TEXTONLY/TRANSLATE checks removed; smoke fixtures/probes updated. Userscript v3.10.0 slices `[TRACK:-> .. INFO:->)`. Docs synced (CORE/RULES/ADAPTERS/DEFAULTS/GUIDE/LITE/SUNO-TAGS/README/VERSION).

- 2026-09-14: v1.5.0 — **prosody mirroring**: when the reference carries text, the skill reads its FORM (section map, lines per section, syllables/meter, rhyme scheme, refrain behavior) and reproduces it in fully original words (copy the shape, never the words). RULES R7 bullet, CORE `<RESEARCH>` prosody field + C2 step 2, ADAPTERS A7 mapping, GUIDE §7. README/VERSION synced.

- 2026-09-14: v1.4.0 — reference research is now **model-first** (ADAPTERS A7 rewritten): the model attempts the full Reference Dossier from its own knowledge and self-rates each field `high/medium/low`; the ≤5-query web corridor opens only when the result is `thin`. The mandatory source set (MusicBrainz/Discogs/AllMusic/BPM-key) is gone — sources are optional aids (`LINKS.md` §5). CORE `<RESEARCH>`/C2, DEFAULTS §F Q4, RULES R9 (`ref_sources: model knowledge` when no web source), README, VERSION synced.

- 2026-09-14: v1.3.0 — first-launch setup batch redesigned (DEFAULTS §F + ADAPTERS A0.4 + SKILL/VERSION/README/LITE synced, now six questions): (1) Suno version `v6`/`v6-wild`/`v6-mini`, no custom; (2) skill variant `Pro`/`Lite`; (3) prompt detail "how detailed should the prompt be?" — `XL/XL` / `L/L` / `M/M` (default) / `S/S` / `Maximum (5000/1000)`; (4) track source — `Reference`(s) (name them → web research) / `Own style — detailed` / `Own style — brief` (skill expands for Suno); (5) song task — theme + little/medium/a lot or the full text, or `Instrumental + Hooks and Chops`, or `Instrumental`; (6) lyrics language, which wins over the Q5 text language (Q5 is a task, not a language choice). Communication language and scope now use the §A defaults (`Ru`, `single`).

- 2026-09-14: v1.2.0 — Reference Dossier for the Pro detail branch. Mandatory source set (MusicBrainz credits/instruments+genres, Discogs styles/credits, AllMusic Genre/Styles/Moods/Themes+review, BPM/key via Beatport or SongBPM/MusicStax; local Demucs/librosa when audio is present) + a ≤5-query web corridor; dossier fields and claim-strength priority in CORE `<RESEARCH>` (C2 step 2); mechanics in ADAPTERS A7; source databases in LINKS.md §5; dossier→Styles mapping in GUIDE §4.5; R1 provenance bullet (dossier never reaches a Suno field) + R9 item; validator now FAILs `ref_track` without `ref_sources`; README/quick-start updated.


- 2026-09-13: suno-fill v3.9.0 — removed the green field outline (`mark()` and its calls) that stayed after the run and read as interface flicker on the text fields. Saved the last good build as tools/backups/suno-fill.v3.8.0.user.js.

- 2026-09-13: suno-fill v3.8.0 — live UI confirmed Weirdness 55 / Style Influence 65 apply after the async fix. Variety labels read off the slider: 0=Off, 1=Normal, 2=High, 3=Extra, 4=Max — Variety now maps the name to that number and reuses the numeric slider (the `data-tick-value` nodes are a 0..1 gradient, not labels). Removed the tick dump from reports. Personalize now only warns when the row has a single `My Taste` button with no aria-pressed.

- 2026-09-13: suno-fill v3.7.0 — slider automation made async: aria-valuenow updates after the event, so the old synchronous loop "went blind" (Weirdness/SI stopped at 50/51). Now each arrow step waits 45ms and reads back, with stall detection; Variety tries a matching tick then arrow-cycles and records the labels passed; Personalize handles Off/On or an aria-pressed toggle; `controls`/diag now include each slider's tick values+labels. First live run showed Vocal Gender and Max Mode apply, Duration/SI/Weirdness/Variety still to confirm.

- 2026-09-13: suno-fill v3.6.0 — More Options automation returned (former Variant 2): the MOREOPTIONS 7-field line now drives Vocal Gender / Duration / Max Mode / Personalize (toggles), Weirdness / Style Influence (numeric sliders) and Variety (by name), each with read-back; Create is still never clicked. Fill report gains `moreOptionsTarget`, `moreOptionsApplied` and `controls`; diagnostics gains `controlRows`. Docs updated from "text-only" accordingly.

- 2026-09-13: suno-fill v3.5.0 — `insertHTML` alone does not stick in Lexical (React reconciles it away; observed Lyrics length 1 / 0 per counter). Lyrics is now filled asynchronously: one synthetic `beforeinput`, wait ~450ms, verify head/tail/length, else `paste`, else `insertHTML`, else `textContent`. Waiting between attempts keeps the working path (synthetic events) while killing the double insert.

- 2026-09-13: suno-fill v3.4.0 — root-caused the Lyrics double-insert (2553 vs 1303): synthetic `beforeinput`/`paste` are consumed by Lexical asynchronously, so the sync success-check saw an empty DOM, reported "failed", and the event still landed — then the fallback inserted a second copy. Contenteditable fill is now single-shot (`insertHTML` → `insertText` → `textContent`, no synthetic events). Diagnostics add slider `visible` and a More Options probe; the toggle matcher is now case/whitespace tolerant.

- 2026-09-13: suno-fill v3.3.0 — before filling, if the "More Options" disclosure is collapsed (sliders not laid out), click it once so the Lyrics/Lexical editor has layout; report gains `moreOptions: { found, wasCollapsed, expanded }`. Does not set any value.

- 2026-09-13: suno-fill v3.2.0 — fill report samples counters/fields ~700ms after the write (plus an immediate snapshot), adds `expected` and `lyricsHasDouble`; contenteditable writes now select all contents first (replace, not append) — fixes the observed Lyrics duplication (1303 → 2553) and the "counter stays 0/5000" lag.

- 2026-09-13: suno-fill v3.1.0 — one-click fill now emits an exhaustive JSON report (per-field write path, before/after field lengths, UI counters before/after, model block-vs-UI, exact selectors, Advanced state), so a single Fill action is enough; diagnostics reuses the same emitter.

- 2026-09-13: suno-fill v3.0.3 — diagnostics report `textCounters` (the UI `N/M` counters) so drift/desync after fill is visible in one paste.

- 2026-09-13: suno-fill v3.0.2 — floating button relabeled `Fill` and moved to the left edge, vertically centered; added `execCommand('insertText')` fallback before `insertHTML` for the Lexical Lyrics editor (attempt to keep the editor state/counter in sync).

- 2026-09-13: model field in INFO (`model: v6 | v6-wild | v6-mini`, from the setup batch) — CORE C4 INFO contract, validator requires the enum, smoke fixture updated; SKILL §7.1 documents the free/v6-mini limits (non-commercial, public, no stems/Studio, ~7 lifetime downloads, upload ≤8 min); README/DEFAULTS updated; `suno-fill` reads `model:` from the block, compares it with the UI model chip, and leaves Pro-only features/controls untouched.

- 2026-09-13: suno-fill v3.0.1 — diagnostics drop the noisy per-label `controls` block (empty icon buttons); switch state stays in `markedButtons`. Observed live: `Exclude` maxLength = 1000 (skill table still lists 200; the box wins — table to be updated).

- 2026-09-13: suno-fill v3.0.0 — Variant 2 removed (text-only fill); forces the Advanced tab; free/mini model detection with a FREE-TIER notice and safe style cap; diagnostics replaced by one copyable JSON report (fields, selectors, sliders, control groups, tabs, model, caps); floating button shifted 50px left.

- 2026-09-13: suno-fill v2.6.1 — diagnostics print each control's own row (buttons bounded by the next control label) instead of a global option union, so the real `Personalize Off/On` pair is visible.

- 2026-09-13: suno-fill v2.6.0 — label-scoped option lookup by nearest button to the label (fixes the two "Off/On" toggles and Personalize); slider pointer fallback (click the `data-tick-value` tick, then track-position pointer/mouse events) after the keyboard read-back; diagnostics resolve options by label.

- 2026-09-13: suno-fill v2.5.0 — switch scoping bound to the target option (two identically-labelled "Off" toggles no longer cross-target), `data-state`/`aria-off` read, native `input[type=range]` path before synthetic keys, diagnostics now dump the four control groups and a slider sample.

- 2026-09-13: portable bundle — concept ideation folded into the skill body (SKILL-CORE C2, no separate agent); host-specific editor registration removed; the root folder is now uploadable as-is (`SKILL.md` entry).

- 2026-09-13: validator cross-field semantics — Vocal Gender vs lead tags, instrumental Styles vs vocals/sung lines, and Lyrics→TEXTONLY completeness now FAIL; competing deliveries in one section and repeated Styles descriptors WARN; smoke gained two semantic bad-block probes.

- 2026-09-13: STATE v2 (package fingerprint `sha256:`/`structural:`, CHANGES/RENDER fields, verified exact restore; v1 accepted as continuity-only hint); full release history moved to `CHANGELOG.md`.

- 2026-09-13: v1.1.0 — Pro is the default variant; first-launch five-question setup batch (DEFAULTS §F); audit fixes (cross-refs, single-source-of-truth pointers, version/date sync, README map/counts, `check-encoding` `.ts`, `smoke` reuses `measure` metrics).

- 2026-09-13: consistency pass (Variant 2 acknowledged as experimental in DEFAULTS/RULES; broad real-gear vocabulary for instrument dash cues; `styles=1000` provenance unified; R9 added to the RULES index; ADAPTERS renumbered A0–A7; ENCODING.md moved to English per §9).

- 2026-09-13: encoding normalization (all text artifacts UTF-8 with BOM, JSON UTF-8 without BOM; `check-encoding.ps1` now audits every text file and flags CP1251 + mojibake; `validate-block.ps1` forces UTF-8 stdout; harness/Python readers use BOM-aware reads; ENCODING/.editorconfig policy synced; A16 artifact repaired).

- 2026-09-12: v1.0.1 audit hardening (strict More Options and INFO checks, closed comma/dash bypasses, final-closer position, translation line mirror, reference leakage check, UTF-8 metrics, honest STATE/fill claims, deterministic stand selection).

- 2026-09-12: merged-junction hardening (7+1 boundary explicit: hard newline, never a pipe; fill v2.4 heals merged Exclude loudly; validator names the cause).

- 2026-09-12: chunk-in-one-fence rule (whole TRACK..INFO block inside a single fenced copy-button window) + sliders parked broken (live report).

- 2026-09-12: live diag evidence in (Variety Normal=1 observed, 5 stops confirmed, Styles maxlength=1000 live; mapping v2026-09-12.2, High sole interpolation).

- 2026-09-12: suno-fill v2.3 control tracts (async keydown+keyup steps with read-back; multi-marker selected-state with UNVERIFIED honesty; chained Weirdness→SI→Variety→selects).

- 2026-09-12: suno-fill v2.2 read-only diagnostics (selector/slider resolution, Variety stop-count cross-check, live maxlengths; zero writes, zero clicks).

- 2026-09-12: validator readability (lengths computed once as $nLyrics/$nStyles; Get-BracketInner centralizes well-formed-line parsing for tag loop/7b/7c with proven parity).

- 2026-09-12: english-only + mirror retired (the RU mirror file was deleted; triggers/labels/templates EN; keeps: keyboard map, [ЯМА] data, comm default Ru) + caps-debt closed (30-day nudge, caps-first refine).

- 2026-09-12: governance pass (GUIDE-core/STYLE-NOTES split; runtime/maintenance modes; mutable-files explicit-order discipline).

- 2026-09-12: tools/measure.ps1 (auto-measured README metrics via ASCII markers + -UpdateReadme; window rows stay test-measured).

- 2026-09-12: 3-layer split (SKILL-CORE process + RULES policy + TAGS vocab + ADAPTERS runtime; SKILL slimmed to the Pro composed entry; zero environment verbs outside adapters).

- 2026-09-12: cap taxonomy (verified/working/heuristic; no official char caps published; validator enforces working caps + Title/Exclude lengths, tiers by flags).

- 2026-09-12: trust-ranked registry (1 Suno official / 2 high-quality third-party / 3 community-observed / 4 operator; sunostyles demoted from Official with affiliation note).

- 2026-09-12: suno-fill v2.1 Variant 2 reachability (`@grant GM_registerMenuCommand` for the menu entry; Shift-click on the button as the manager-proof second entry).

- 2026-09-12: honest validator (closer×1, Styles×4 lines, Exclude≤3, model LIMITs always, tier ceilings via flags; semantic scope declared out; manual checklist named, not numbered).

- 2026-09-12: F-lexicon contract fix (Test-VocalCombo: gender + F-group words parsed from section F, trailing vocal(s), ≤8 words; E row + L2 tightened).

- 2026-09-12: structure-budget fix (recipe may use its full canonical head set — standard holds 7; 5–6 cap applies off-recipe only; GUIDE step 3 + LITE §6 synced).

- 2026-09-12: stand handshake (profiles Full/Chat+files/Inline/Stateless/No-web, STATE card, HARD/HARNESS/MEMORY tags, 5-point manual checklist, working-values rule; LITE mirrored).

- 2026-09-12: first-launch reset (all LINKS.md stamps → `never`, GUIDE sync → pending; new user gets the mandatory full pass: links → miniguide from zero; no legacy track mentions anywhere).

- 2026-09-12: RELEASE 1.0.0 (Pro/Lite, Input D, query-craft, 128k gate, blank-line map; validator green; no legacy track mentions — every window starts from zero).

- 2026-09-12: README showcase (all features, gate stats, examples) + standing README self-update rule.

- 2026-09-12: research query-craft (2-3 targeted queries, site:/exact-phrase, ads≠authority, open-to-verify, stop rule) + 128k gate line with progress note.

- 2026-09-12: Pro/Lite split (LITE.md + LITE-TAGS.md self-contained pair, v6-mini default, no GUIDE/LINKS machinery; §0 variant-select gate with operator confirm + force override; DEFAULTS §E).

- 2026-09-12: forked as vave-suno-multiprompts (its test folder was excluded; name references switched; samples-gate reworded).

- 2026-09-12: validator blank-line map (exactly one blank before each A-head FAILs; B-heads/briefs stay glued; good sample fixed to comply).

- 2026-09-12: full-reload audit sweep (4 inputs; manual not cookbook; §12-keep rule; A/B/C/D trigger; draft counters verified pending lock; S250 + texture cross-ref; INFO ref_url/import; §9 GUIDE read).

- 2026-09-12: guide/registry remodel (GUIDE mechanics-only + §12 on-demand style notes; LINKS scope without song breakdowns; 4th network trigger: style-note miss).

- 2026-09-12: Input D link intake (Suno/streaming URL: fetch-attempt + paste fallback, rights-aware keep/change proposal, warn-on-take-all into Input C flow, INFO `ref_url:` + `import:`; no keys, no login automation).

- 2026-09-12: tier remodel (styles S250/M600/L800/XL900, XL parked under the ~1000 unverified cap; texture-over-cut rule; chorus varied-tails rule; E instrument-cue row + validator allowlist; GUIDE modulation прием without gated tags).

- 2026-09-12: sources pass (LINKS.md registry + GUIDE.md cookbook ≤50000 chars, §2.1 consult-first discipline: GUIDE once per window, network only on first launch / explicit trigger / failure-escalation, 10-day staleness flag, TAGS auto-edit under validator).

- 2026-09-12: tidy pass (RU header примерно, RU minimal-core 1-13+15, TAGS date, P20 wording, validator STYLES-bracket FAIL + MOREOPTIONS-name WARN, check digit-count).

- 2026-09-12: similarity pass (DNA v2: production fingerprints, energy map, era pin, vocal triple-stack, ad-lib words; Styles vocal-anchor-first + mood coherence + competing-terms audit + chorus ratio).

- 2026-09-12: trigger wording примерно instead of общо.

- 2026-09-12: confusion pass (single:<BLOCK> unified, INFO ref_track/ref_sources, §9 trimmed to pointer, tier-ceiling wording, 7+1 naming, Custom=Advanced tab, reference-DNA label).

- 2026-09-12: presentation/export remodel (presentation_mode chunk/blocks/single:X vs export_action none/parser/fill) + strict validator (unknown bare heads FAIL, E-allowlist: detail prefixes, A/B colon/dash tails, color nouns, comma SFX).

- 2026-09-12: external audit pass (v2.0 clamp-reject + Variety label verify; claim-strength levels; §6 skill-policy wording; Duration/Max Mode docs-vs-policy split; FULL/COMPACT/MINIMAL levels; lyric real-word shield; precedence chain; window/track memory; 4-8w heuristic; Styles 4 physical lines; N code-point metric; validate-block.ps1 + samples + P20; ps1 ASCII-only — ANSI mojibake quote-split fix).

- 2026-09-12: suno-fill v2.0 Variant 2 (menu command + confirm: sliders/selects from MOREOPTIONS, keyboard steps + read-back, diff-then-click, Type/BPM/Key out of scope; Create never clicked in any path).

- 2026-09-12: release pass (tools v1.7 dual-title verify + exact selectors; chunk gate note; single:X shape; X-link; dictionary sync rule; HG duration guide; listen template + render log + read-only snapshot; W60/SI60 examples).

- 2026-09-12: reference-track research branch (§3.2 trigger детально/общо with общо default, DNA breakdown, provenance line + INFO reference/sources, §6 hardens, 3-5 question budget).

- 2026-09-12: DEFAULTS.md baseline (v6/Ru/Eng, chunk output, M/M, single; W60/SI60, empty Vocal Gender + per-part voices, Exclude authored per track; file-change only on explicit order).

- 2026-09-12: translation layout fixed (TRANSLATE mirrors TEXTONLY line breaks, '/' joins banned).

- 2026-09-12: suno-fill v1.6 (beforeinput primary path + UNVERIFIED fallback logs; buffer sliced [TRACK:-> .. TEXTONLY:->), tail never reaches DOM).

- 2026-09-12: suno-fill v1.5 (fence-tolerant parse + lenient blank-line retry + missing-tag diagnostics in abort).

- 2026-09-12: suno-fill v1.4 (live-DOM verified: Lyrics is Lexical — synthetic paste event path with exact selectors; native Styles/Title/Exclude untouched).

- 2026-09-12: suno-fill v1.3 (rich-editor insertHTML with one div per line — survives whitespace-normalizing editors; replaces v1.2 insertParagraph path).

- 2026-09-12: suno-fill v1.1 (contenteditable Lyrics/Styles support for the new /create UI via focus + execCommand insertText; textarea/input native-setter path untouched; guards unchanged).

- 2026-09-11: fill export v1 (text-only `tools/suno-fill.user.js`: 4 text fields, sliders/selects/Create untouched; §5.1 explicit triggers; probes P15).

- 2026-09-11: suno-docs re-sync (v6 FAQ Variety Off=0 + Max Mode verbatim, guidelines IP, pre-v6 retired, input-lyrics ownership, ~3000 sweet spot; HG confirmed-list; usesuno Tempo Change/Accel → A-gated; Blake Style 4-7; dash-descriptor tails ≤45 chars / 3-4 keywords; weak single-source tags stay emissible per operator).
- 2026-09-11: audit fix pass (title 80 conservative; tiers = ceilings only; TRANSLATE generalized to comm_lang; endings 5; colon canonical `:` vs `-` for gear; W/SI docs defaults without silent-pull; Variety enum fixed + Max on explicit only; parser no-blank-inside-MOREOPTIONS + first-tag exception + sanitize rule + `Exclude: none`; heads A/B vs briefs E split; numeric-tempo ban vs gated textual; reference-only artist rule; working-rule rename; AI Studio vs Suno models split; instrumental vocal part; layout example `cvtybnm yjdsq nhtr`; order title->summary).

- 2026-09-11: dictionary levels L1 closed / L2 voice combos / L3 mood parens / L4 free instruments.
- 2026-09-11: colon tails legal inline on structure heads (≤8 words) — splitting breaks structure.
- 2026-09-11: cement pass (source-provenanced A/B, structure lockdown rule 17, no-RU brackets, (x2)/caps/sung-length/engineering rules, V6 5000 confirmed).
- 2026-09-11: universal pass (bare heads + typed briefs, Vocal Hook head, no-web fallback, generic deploy + minimal core, fence fix).
- 2026-09-11: Q-batch (TRANSLATE empty for RU songs, title auto-shorten ≤80, quoted spans always sung, line-initial direction exception, no-nesting + phase-lines, the RU mirror human-only rule).
- 2026-09-11: review pass (duplicate heading, rule 6 parens, Exclude dash, 7+1 wording, tier-verify, step 4 translation, Transition legal, scope vs §8, stale v1 note, TRANSLATE equal-lang, title cap check, RU mirror refresh, volume→tier map) + prime directive: rules+docs first, mandatory closing compliance check.
- 2026-09-11: operator input normalization (keyboard layout swap EN↔RU incl. chunks, context-fit typos, stylization shield).
- 2026-09-11: Styles fixed 4-part structure (base/instruments/vocal/mood) + extended vocal specs in Lyrics (tier-scaled) + vocal lexicon + archetype-vs-singer line.
- 2026-09-11: size tiers (lyrics S/M/L/XL, styles S/M/L/XL) + detail engine (hooks/motif/dynamics/parts) + no-padding rule + Tempo/Key-ban in Lyrics + hook-line ban.
- 2026-09-11: human header = bare title on top; Model line and copy-helper lines removed (model lives in memory + INFO).
- 2026-09-11: Exclude on its own line after the 7-field More Options line (7+1 block).
- 2026-09-11: More Options canonical 8-field block (docs: Vocal Gender/Duration/Max Mode; UI: Variety/Personalize) + working ranges W/SI 30-75, Variety ≤Extra, Personalize Off + self-check enforcement.
- 2026-09-11: v2 detail pass (6 samples of 5.5 prompts): detail layers + budget, Correction vs Variation, brackets-vs-parens verdict with auto-convert, TEXTONLY rich/score rules, canonical shapes for wild forms, Style/Exclude budgets.
- 2026-09-11: all-block parser style (value on next line for every key tag) + dictionary extracted to SUNO-TAGS.md with local link.
- 2026-09-11: parser spacing (blank line around key tags) + INFO Suno version/docs-sync + tag dictionary 7.3 + combination rules 7.4.
- 2026-09-11: initial single-source build (Q1 lifecycle + Q2 standalone/adapter + Q3 boundaries/order + Q4 bilingual/iterative + parser contract + v6 reference).