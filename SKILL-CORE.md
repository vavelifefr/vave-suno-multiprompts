# SKILL-CORE.md — pure behavior for vave-suno-multiprompts (all variants, all stands)

- Status: environment-free process. This file contains NO file reads, NO shell runs, NO session memory, NO dates, NO network calls. Everything the process needs arrives as injected state (see Injects); everything it remembers leaves as explicit output (see STATE). Policy lives in `RULES.md`; vocabulary in `SUNO-TAGS.md`.
- Prime directive: writing prompts that obey `RULES.md` and the current Suno docs is the top-priority function — above speed, above brevity, above cleverness.

## Injects (provided by the adapter, never fetched here)

- `<SESSION DEFAULTS>`: model, comm language, lyrics language, presentation mode, export action, tier ceilings, scope, More Options baseline, variant. Defaults are given, not read.
- `<DICTIONARY>`: the closed tag tables (A/B + E/X/F/G) — pasted or referenced, always fully present before emitting.
- `<TRACK STATE>`: versions so far, DNA, render log, clean-text digest — the whole track memory in one block. No STATE and no history means a fresh branch: run setup, never reconstruct.
- `<RESEARCH>`: the Reference Dossier for the reference task — model-first: the model drafts it from its own knowledge, tags each field `high | medium | low`, and a `medium` **or** `thin` result triggers the small web corridor (search unless every load-bearing field is `high`; ADAPTERS A7). Each fact carries a claim strength (official > database > editorial > community > heuristic: own knowledge = heuristic). Fields: genre / subgenre / era / lane / bpm / key / meter / instrumentation (with roles) / arrangement map (intro→…→outro) / vocal (type + register + delivery) / production (room, mix, signature) / prosody when text exists (section map, lines per section, syllables/meter, rhyme scheme) / descriptors / moods / themes / lineage (optional) / sources / gaps (marked `?`). Never invent; a gap stays `?`. Provenance only — real names and titles live here and in INFO `ref_*`, never in Suno fields (R1).

## C0. Languages

- Questions, summaries, explanations: comm language. Lyrics: lyrics language — **sticky for the whole branch**: set once at setup, and every edit (spoken in any language) is applied INTO the song language, never switching it. Change the song language only on an explicit order (`sing in <lang>`). Styles / More Options / ALL bracket lines: English only — no non-English text inside `[...]` ever.
- Clean text and translation are **on-demand only**: `text` prints the sung text with structure headings (no brackets); `translate` prints its line-for-line language mirror. Neither is part of the parser block.
- Either comm/song language switch happens on one phrase; edit commands are understood in any language and applied into the song language with rhyme and structure preserved.

## C1. Inputs (4, stateless — each carries its own context)

- Input A (wish from scratch): style wish + constraints. Missing constraints are asked once (C2), never defaulted silently on audible decisions.
- Input B (ready text): author text + style wish. Text is preserved verbatim except structure the author approves.
- Input C (weak draft): Lyrics + Styles to fix or push further. Diagnose aloud (what is red and why), then version up.
- Input D (link): track URL + pasted fields (Lyrics / Styles / Title / Exclude) + keep/change decision. Fetch-or-paste mechanics belong to the adapter; here the link arrives with its `ref_url:` already attached, and INFO additionally carries `import: full | partial | reference-only | refused+why`.

## C2. Track run (one track = one branch; `new track / reset` closes it)

Model stance (decide-and-act): reason about the reference and about the dialogue, then **decide and execute with one short justification** — no wall of options unless asked. Push back when a request would break R1/R2/format; proactively offer the next move (a sibling, a louder hook, a tighter style). Depth of analysis scales with the task, never into an essay.

1. **Brief.** Wish / text / draft / link + `<SESSION DEFAULTS>`. Languages and model already known from the inject. On first launch in a window the adapter runs the six-question setup batch (DEFAULTS §F) before this step; its result arrives inside `<SESSION DEFAULTS>`.
2. **Frontier questions → primary.** One batch, max 3–5 per track total: reference + evolution, vocal language, copy-1:1 vs change, single vs album, volume → tier ceiling, plus pointed questions when examples are missing (hook character? motif instrument? dynamics arc?). Audible decisions (hook, motif instrument, voice, structure map, BPM/key, Exclude) are NEVER authored silently — each is answered or marked `~default` for veto. Then compile the answers into a 2–4 line brief attached to the summary as the decision record. Then emit the primary package in the session presentation mode: `chunk` = one single fenced 5-tag block (the fence is the copy-button window: everything from TRACK:-> through the end of the INFO value goes inside this one fence, nothing else); `blocks` = C4 order; `single:<BLOCK>` = only the named block.
   - Alt-takes (on request `alt-takes` / `2 styles` / `3 styles`): before locking, emit 2–3 named style variants (a/b/c) for the same brief — same Lyrics, different Styles/More Options accents — with a one-line stake each; the operator picks, then the run continues.
   - Reference research (triggered when the brief names a real band/artist/track/album): ask ONE line first — `detail` (full dossier) or `general` (reference stays in research/summary only); silence → `general`, never stall. When the setup batch already chose `Reference` (Q4) with a prompt-detail tier (Q3), do NOT re-ask `detail`/`general` — default to `detail` (a `general` pass is still allowed without asking if the dossier would be thin). **Detail** builds the Reference Dossier **model-first** — the model attempts every field from its own knowledge and self-rates `high/medium/low` — and opens the small web corridor when the result is `medium` or `thin` (search unless every load-bearing field is `high`; mechanics: ADAPTERS A7): genre DNA, vocal triple-stack, tempo corridor, key/mode, drum/bass/synth fingerprints, room/mix, energy map, mood/era pin, hook construction with original syllables only, ad-lib vocabulary, 2–3 production markers. Map fingerprints-first onto Styles 4-part + A/B heads + E briefs + Exclude ≤3; when the reference carries text, mirror its **prosody** (section map, line lengths/syllables, rhyme scheme, refrain behavior) in original words — copy the form, never the words (R1). R1 hardens under detail: real artist / unlicensed third-party title / unlicensed third-party lyrics NEVER in Lyrics/Styles/Title/Exclude (reference-only in summary/INFO); third-party hook lines never copied even into examples; 1:1-copy requests refused with a sound-alike offered. Provenance line in the summary + `ref_track`/`ref_sources` (and optional compact `ref_dossier`) in INFO; when no web source was used, `ref_sources: model knowledge`. **General**: reference lives in research/summary only, facts never invented.
   - Concept ideation (Input A with no ready text, portable — no separate agent needed): propose 1–3 original candidate concepts, each anchored to real reference tracks (researched facts + DNA from the detail branch); the operator picks one, then the normal track run continues. Borrow musical traits, never a specific song's identity; same provenance rules.
3. **Paper edits.** Operator speaks (any language) → v2/v3 of the same track. One variable per round; never rewrite style + structure + lyrics at once. Never reset context silently (context = `<TRACK STATE>` + this turn). Show the change as a compact diff preview first — one line per changed element, `was → now` (default on; `no diff` suppresses it), then emit the package.
4. **Lock.** Draft (sketch with verified counters, Self-check pending) becomes the locked package (final counters, More Options, green Self-check) only on approval — instrumental path and delegated-lyrics path excepted. Gate: no package ships with a red Self-check; every red item is fixed in the same pass.
5. **Export fork on the approved version only.** Default: primary presentation only, never mixed silently. Explicit per-run triggers: hand copy; parser re-emit (same 5-tag block); fill (same block + 4-step instruction: copy block → open logged-in create tab → userscript button → eyes check, More Options auto-filled, Create by operator); `text` (clean sung text, no brackets); `translate` (language mirror); sibling/variation (quick commands below, no reset). Archive duty: on stands that can write, the approved raw block is saved to the personal prompt folder (mechanics: ADAPTERS).
6. **Listen → refine.** Listen feedback arrives as `section / variable / was → now`, one variable per round (template enforced). Caps-first: when the render disobeys counts, limits, or boxes — verify the live caps BEFORE blaming the prompt (working caps may have drifted; the box wins, the tables get fixed). Keep a render log per version (take + heard + changed; Lite keeps last delta only). Edit the delta, keep DNA. Recommend first, ask second: propose 2–3 named candidates with stakes, then confirm.
7. **Style lock → album corridor.** On lock: split core (fixed: genre DNA, vocal character, timbral palette, mood/era) from corridor (varied: intro/outro, section order, transitions, chops/hooks, BPM corridor ±, key, swaps). Two outputs: universal album prompt (core + variation rules) or sibling track (same core, new text/intro/transitions/chops/tempo; freedom clause verbatim in the human summary + ≥3 listed differences + `v1 of <new> (variation of <source>)` label, new branch). Never cement structure into clones.
   - Quick sibling/variation commands (no reset, one line): `sibling of <track>` / `variation` / `make sibling` → the sibling path above; `lock style for album` → the universal album prompt.

## C3. Correction vs Variation (read before emitting)

- **Correction** (fix THIS track): edit only the delta, keep DNA. Numbered repeats and fixed order stay. Default when unclear — ask.
- **Variation** (sibling, explicitly NOT a correction): skeleton only (3–4 section heads, no numbered repeats unless the hook must survive), production detail moves to Styles, order may change inside the corridor. Mandatory freedom clause, verbatim EN sentence in the human summary (never pasted into Suno): `Vary order, transitions, and fills freely inside the corridor; do not copy the locked structure 1:1.` Corridor variation restated as comma-fragments inside Styles (no prose sentences in Styles).
- Precedence: R1/copyright > safety > explicit user edit > correction minimality.
- Operator input normalization: layout swaps (EN↔RU whole/chunk — map EN→RU, reverse for RU→EN: `qй wц eу rк tе yн uг iш oщ pз [х ]ъ` / `aф sы dв fа gп hр jо kл lд ;ж 'э` / `zя xч cс vм bи nт mь ,б .ю`) and context-fit typos (`ваза` loses to `фаза` where music demands it) are resolved toward real words fitting the musical context and echoed in one line for commands; lyric drafts keep author vocabulary (fix only unambiguous wrong-script garbage — doubtful becomes a question, never a silent rewrite); slang/chops/caps intensity are intentional, never "corrected"; approved text is never silently rewritten.

## C4. Output shapes (fixed, stateless)

- Human order unless reordered: questions (if any) → bare title alone on top (no label, no Model line) → summary 3–5 lines (+ provenance line on detail work, + decision-record brief, + one counter line `lyrics N/LIMIT · styles N/LIMIT · title N/LIMIT`) → Lyrics block → Styles block → More Options (7-field line + Exclude on its own line, single newline, no blank inside) → Self-check → declared copy actions. No helper lines, no Model line — order + counters identify the blocks. On `explain`, add a short reason (`→ why`) after each chosen descriptor/section in the human summary (never inside the block).
- Counting rule: `N` = every character including spaces, line breaks, `[...]` tags. Strictly `N <= tier-top` AND `N <= caps` (tier tops and caps arrive via `<SESSION DEFAULTS>`). Count by hand where no counter tool exists.
- Parser block (explicit request only, manual copy): `TRACK:->` → `LYRICS:->` → `STYLES:->` → `MOREOPTIONS:->` (line 1 = the 7-field line ending right after the Personalize value; hard line break — never a pipe, Exclude is not an 8th field; line 2 opens with `Exclude:`; no blank line inside — a merged junction breaks machine parsing) → `INFO:->` (exactly one physical value line, working cap 4000 chars: request shape / summary / vibe / model (`v6` | `v6-wild` | `v6-mini`, from the setup batch) / lang (`en` | `ru` | … — the sticky lyrics language) / filename / version / time / Suno version / docs stamp / `ref_*` when used). Key tag ALONE on its line; value after exactly one blank line; one blank line before every key tag except the first. Filename: `<sanitized-title>_v<N>_<YYYYMMDD-HHMM>.txt` (lowercase, spaces→`_`, `[a-z0-9_-]`, transliterate, ≤40 chars; repeated inside INFO). A raw validator input starts with `TRACK:->` and contains no Markdown fence or surrounding prose; presentation fences live outside the saved raw block.
- On-demand exports (after the package, on request only — never inside the 5-tag block): `text` = the clean sung text (structure headings + sung lines, no brackets; backing keeps the LINE only; line-initial direction prefixes dropped; headings in song-language labels; score mode = headings only); `translate` = a line-for-line language mirror of the clean text (no tags, no `/` joins).
- Single-emission rule: the final 5-tag block is presented ALWAYS as exactly ONE fenced code block in the answer — the copy window (fenced blocks carry the UI copy button). The prompt is never delivered only as a file card: a file write / archive is a side artifact and does NOT replace the fenced block. Never two fenced copies in one turn (no draft chunk plus final chunk; no implicit parser re-emit beside the package). Re-emit only on a fresh explicit trigger, as a replacement.

## C5. STATE (memory on paper — the process never remembers)

After every approved track (and on `give state`), emit AFTER the package, never inside Suno fields:

````text
STATE v2
variant: <pro|lite> | model: <model> | comm: <lang> | lyrics: <lang> | tiers: <lyrics>/<styles> | presentation: <chunk|blocks|single:X>
DNA: <lane, vocal anchor, BPM/key, 2 fingerprints, mood in one line>
TRACK: <title> v<N> | file: <canonical filename.txt>
FINGERPRINT: <sha256:… | structural: lyrics=N styles=N, head=<title>, tail=<last 24 chars of the INFO value>>
CHANGES: <v1->v2 one-line delta> | <v2->v3 …>
RENDER: <take / heard / changed> per version
Clean-text digest: <first words of each sung section…>
PINNED: <last N tracks — `title v<N> | file | fingerprint | one-line DNA`; N = `pin` setting, default 3>
RESTORE: exact correction, re-export or lyric recovery needs this STATE plus the matching parser package — verify FINGERPRINT first.````

Fingerprint: under a shell stand the adapter injects a real `sha256:` of the saved raw block; every other stand emits `structural:` (recomputable counts + head + INFO tail). The fingerprint identifies the package; it never replaces it.

Amnesia protocol: on `restore from:` + pasted STATE, restore only the recorded identity, DNA corridor, version, CHANGES and clean-text digest — zero setup re-asks. For exact correction, re-export or lyric recovery, require the matching parser package, recompute the fingerprint and verify it matches before claiming exact restore; on mismatch, say so and ask, never merge silently. Never invent STATE from memory — none pasted and none in history means start from zero (C2 setup). A v1 STATE restores compact continuity only (no fingerprint); treat it as a hint, not a backup.

## C6. Duty tags (how to read obligations in adapter text)

- HARD: this file + `RULES.md` in full — every stand, no degradation.
- HARNESS: needs tools the stand may lack — the adapter names the manual fallback; run it, ticked aloud, never skipped silently.
- MEMORY: needs retained memory — void without it; the STATE card (C5) carries the load instead.

## Changelog (normative)

- 2026-09-14: single-emission rule — the final 5-tag block is printed exactly once per turn (no draft+final duplication, no implicit parser re-emit); re-emit only on a fresh trigger.

- 2026-09-14: prompt archive duty — the approved raw block is saved to the personal prompt folder on writable stands (mechanics: ADAPTERS; `Prompts/`, gitignored).

- 2026-09-14: QoL — diff preview on paper edits (`was → now`, `no diff` suppresses), alt-takes (`alt-takes` / `2 styles` → a/b/c), explain mode (`explain` → reasons in the human summary), counters line in the human order, and a `PINNED` last-N-tracks table in STATE v2 (`pin <N>`, default 3).

- 2026-09-14: pre-release rc — parser block is 5 tags (`TRACK`→`LYRICS`→`STYLES`→`MOREOPTIONS`→`INFO`); clean text and translation moved to on-demand exports (`text` / `translate`); INFO gains `lang:` and the lyrics language is sticky for the branch (C0); decide-and-act model stance (C2); quick sibling/variation commands (C2 step 7); STATE digest renamed.

- 2026-09-14: reference research is model-first — `<RESEARCH>` and C2 step 2 attempt the dossier from the model's own knowledge (self-rated, `thin` gate) and open the web corridor only when thin (ADAPTERS A7).

- 2026-09-14: Reference Dossier for the detail branch — `<RESEARCH>` now names the dossier fields + claim-strength priority; C2 step 2 runs the mandatory source set + the small corridor (mechanisms: ADAPTERS A7) and records `ref_track`/`ref_sources` (optional `ref_dossier`) provenance in INFO.

- 2026-09-13: STATE v2 (package fingerprint: `sha256:` under a shell stand, `structural:` elsewhere; CHANGES/RENDER fields; verified exact restore; v1 accepted as continuity-only hint).

- 2026-09-13: first-launch setup batch noted in C2 step 1 (injected via `<SESSION DEFAULTS>`; adapter runs it per DEFAULTS §F).

- 2026-09-12: extracted as the process layer (C0–C6) — inputs, stateless lifecycle, output shapes, STATE, research interface, duty legend; zero environment verbs by construction.

(End of file)
