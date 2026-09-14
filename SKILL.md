---
name: vave-suno-multiprompts
description: Pro composed entry (SKILL-CORE process + RULES policy + SUNO-TAGS dictionary + Pro runtime). Builds Suno-ready song packages from wish, text, draft, or link. Lite entry: LITE.md. Adapters: ADAPTERS.md.
---

# Vave Suno Prompts — Pro composed entry

> Mission: prime directive lives in SKILL-CORE.md. Composition: SKILL-CORE (process) + RULES (policy) + SUNO-TAGS (vocabulary) + this file (Pro runtime: DEFAULTS/GUIDE/LINKS/tools). Lite entry: LITE.md. Stand negotiation: ADAPTERS.md.

## 0. Stand handshake (first message — run ADAPTERS.md A0)

Variant + profile + confirm/force, 30 seconds, observable facts only. **Default proposal: Pro**; propose Lite only for a narrow window or when the full canon cannot be loaded. Force commands (remembered for the window): `force lite`, `force pro`. Mid-window switch only on explicit order — track memory drops. On first launch in the window the setup batch (DEFAULTS.md §F, six questions) runs right after the handshake, before the first brief.

## 1. When to fire (entries — process: CORE C1–C2; scope: RULES Scope)

Fire on any explicit track request — a wish from scratch, a finished text, a weak draft, or a link. Process: SKILL-CORE C1–C2; out-of-scope surface: RULES Scope. A wish with no ready text may become a concept-ideation run (CORE C2 reference branch, portable — no separate agent needed).

## 2. Pro runtime: session setup (once per window)

Baseline arrives via the adapter binding (Pro: read `DEFAULTS.md` first, then `GUIDE.md` once — never re-read per track). On first launch in the window, ask the §F setup batch once (six questions) unless forced; never re-ask within the window. Per-run overrides live in window memory only; edit `DEFAULTS.md` itself ONLY on an explicit file-change order (`update defaults`, `make it default`). Languages, translation, and switching: CORE C0. If the embedded reference is older than 30 days (the `Date:` in `VERSION.md` vs today), add one setup-summary line suggesting `update docs` — once per window, never nagging.

### STATE card → CORE C5 (MEMORY duty)

After every approved track (and on `give state`): CORE C5 STATE v2 block, AFTER the package, never inside Suno fields. Amnesia protocol: CORE C5.

## 2.1 Sources & guide (LINKS.md + GUIDE.md)

Consult-first economy: GUIDE.md is read ONCE per window (Pro runtime §2 setup) and worked from memory after — never re-read per track. GUIDE.md holds assembly mechanics only — no pre-baked genre recipes; reusable style vocabulary accrues in STYLE-NOTES.md (mutable registry), one stamped entry per requested style. Per-question order: GUIDE.md first; network only on a GUIDE miss and only inside the network policy below. LINKS.md (same folder, EN) is the source registry: section 1 Suno official (trust first), section 2 high-quality third-party (useful, never authoritative), section 3 community/observed (weakest links), section 4 operator-added, section 5 reference-research source databases (MusicBrainz/Discogs/AllMusic/BPM-key/lineage). Sections 2-3 hold references, style guides, mixes, style-writing guides — never single-song breakdowns. Every link carries `synced: DD.MM.YYYY` or `synced: never`.

Freshness (cheap, local): on first activation in a window, read the LINKS.md dates and compare with today. STALE = 10+ days old. Stale never triggers network by itself — one line in the summary (`sources: N stale (oldest <name>), say update docs to refresh`) and continue working.

Network refresh ONLY on four triggers: (a) first-ever launch (stamps missing/`never`) — mandatory full pass over sections 1-3: verify GUIDE-core mechanics against sources (patch core only on contradiction), leave STYLE-NOTES.md empty (entries accrue on demand), stamp dates; (b) explicit operator trigger (any case): `update docs`, `refresh sources`, `sync docs`; (c) failure-escalation — 3-4 rework rounds on one track PLUS operator complaint (not similar / result does not match): targeted re-sync of the links relevant to the failure, GUIDE.md patch, SUNO-TAGS.md patch only if tags are affected; (d) style-note miss — a requested style with no direct STYLE-NOTES.md entry and no sufficient mechanics answer: targeted fetch for that style only, then add the link (LINKS.md §2/§3/§4 by kind) + exactly one stamped registry entry.

After any sync: update every visited date in LINKS.md (DD.MM.YYYY), bump versions + changelogs on core change (registry entries carry their own stamps; registry cap 30000 — compress oldest/lowest-value first), keep GUIDE.md <=50000 chars (compress old rows first, never drop the pipeline or the anti-patterns), run `tools/validate-block.ps1` over the current block file after any SUNO-TAGS.md edit (auto-allowed; red validator → ask the operator, never ship). Log one CHANGELOG.md line.

README rule (standing): any added or changed user-facing capability MUST update `README.md` in the same pass — feature description + verbatim example first-message + numbers if affected (tokens, tiers, limits, triggers) — plus one CHANGELOG.md line. README always mirrors the current feature set, never the other way round (maintenance mode — see Modes).

## Modes (runtime vs maintenance — file-write discipline)

- `runtime` (default): track work only. ZERO file writes — not DEFAULTS, not STYLE-NOTES, not LINKS, not README, not changelogs, not the dictionary. Findings that would change files are collected as pending-maintenance notes (one line each) and never applied silently.
- `maintenance`: entered ONLY on explicit operator command (`update ...`, `write ...`, `sync`, `update docs`, `make it default`, `maintenance mode`, or any explicit feature order touching files). Scope = the commanded files + required consistency sweep (cross-refs, validator smoke, README numbers via measure.ps1). Announce exit back to runtime at the end of the turn.
- Mutable files (maintenance-only, explicit order each): DEFAULTS.md, STYLE-NOTES.md, LINKS.md, README.md, CHANGELOG.md. (SUNO-TAGS.md auto-edit stays validator-gated per §2.1.) A "good style worth remembering" with no order becomes a chat note — never a silent canon edit.

## 3. Track lifecycle (default, not one-shot) — process: CORE C2–C3, memory: CORE C5; research-web method: ADAPTERS tools map

One track = one branch. `new track / reset` is the only thing that closes it.

Track steps (brief, frontier, paper edits, lock, export fork, listen-refine, album corridor — incl. reference research, Input D intake, Correction vs Variation, operator input normalization): SKILL-CORE C2–C3 is the single source of truth. Detailed reference research mechanics (mandatory sources + small corridor): ADAPTERS.md A7.

## 4. Human output — order: CORE C4; policy: RULES R6–R9.

## 5. Parser export (explicit request only) — shape: CORE C4 (single source of truth); validation: ADAPTERS tools map (HARNESS). The INFO contract lives in CORE C4.

## 5.1 Fill export (explicit request only) — process: CORE C2 step 5; mechanics: ADAPTERS tools map.

## 6. Copyright hard boundary — policy: RULES R1 (HARD duty).

## 7. Suno Reference (embedded, versioned)

- Version: 2026-09-11. Suno version: v6 family (`v6` / `v6-wild` / `v6-mini`, launched 2026-09-09).
- docs: synced 2026-09-11 (`https://about.suno.com/release-notes/introducing-v6`, `https://suno.com/blog/introducing-v6`, `https://help.suno.com/` Custom Mode + Rights & Ownership + Vocal Gender article + v6 FAQ (Max Mode), release notes (Duration slider), `https://suno.com/community-guidelines`; re-synced: `https://freesongwritingtools.com/blog/suno-metatags-guide`, `https://usesuno.com/guide/tags` — verdicts: parentheses are sung, tags are signals not commands, 1-3 words per tag, ≤5-6 tags per song, Style 4-7 descriptors; second re-sync `https://blakecrosley.com/guides/suno` (full V5.5 tag tables, parameterized modifiers, case-insensitivity, no dedicated [no vocals] tag), `https://hookgenius.app/learn/suno-lyrics-formatting` (confirmed working list, (x2)/caps/line-length rules, V6 lyrics 5000 confirmed); third re-sync 2026-09-11 (v6 FAQ: Variety slider + Off=0 retains control, Max Mode verbatim; community guidelines IP clause; HG confirmed-list + (x2)/caps/4-8-word lines + dash-descriptor examples; usesuno Aug-2026 reference: Tempo Change/Accel inconsistent, custom labels undocumented; Blake V5.5: no tag changes, Lyrics Editor = Verse/Chorus/Outro labels, Style Augmentation/My Taste don't override tags)). No official machine-readable tag registry exists; cemented tables A/B carry per-tag provenance (OFF = Suno-owned surfaces: help center, Lyrics Editor labels, release notes); the dictionary (7.3 -> SUNO-TAGS.md) is the closed vocabulary confirmed across these sources plus stable long-term usage (v3.5-v6).
- Claim strength: OFFICIAL (Suno-owned surfaces + v6 FAQ) > MULTI-SOURCE OBSERVED (BL/UU/HG/FS tags, counts, parens behavior) > OPERATOR HEURISTIC (working policies marked as such below: obedience W/SI, Max Mode finals-only, Variety Max-only, title cap 80, dash ≤45 chars). Cap classes map 1:1: verified_cap = OFFICIAL numbers (none published today), working_cap = MULTI-SOURCE OBSERVED numbers, heuristic_cap = OPERATOR HEURISTIC policy.
- Update rule: Suno docs change -> edit only this section + date + Sources + 1 changelog line; tag-affecting changes also sync SUNO-TAGS.md tables + date. Workflow above untouched. Check live docs first when this block is stale or on explicit `update docs`.
- Working-values rule (anti-prophecy): any third-party number (caps, BPM corridors, slider mappings, duration guides) is a working value, not a fact. Verify live before a final lock; if this stand cannot verify, mark it `unverified` next to the number and ask — never present it as certain.

### 7.1 Models

| Model | Tier | Character |
|---|---|---|
| v6 | Pro / Premier | flagship, precise, polished |
| v6-wild | Pro / Premier | exploratory, varied, textured |
| v6-mini | everyone incl. free | fast, efficient |

Free-tier access means `v6-mini`. There is no `free` model — `Basic` is a tier, not a model name. `v6` and `v6-wild` are Pro/Premier only; Custom Models and Voices are Pro/Premier.

Free / `v6-mini` limits (docs): 50 credits/day (~10 songs), non-commercial use, creations public by default and owned by Suno, shared queue, no stem separation / Studio, browser-only playback with ~7 lifetime trial downloads, upload ≤8 min. Field caps (Lyrics/Styles) do not differ by model. On `v6-mini` never propose Pro-only features (Custom Models, Voices, stems, Studio) and mark the package non-commercial in the summary; record the chosen model in INFO `model:`.

Ownership: Pro/Premier creations belong to the creator (commercial use retained after cancel). Free-tier creations belong to Suno, non-commercial only. Copyright eligibility itself depends on region/human authorship; writing the prompt alone is not authorship. Pre-v6 models retired: library/cover/remaster of old songs still available, new iterations render on v6 only (v6 FAQ). Original lyrics you input remain yours on any plan (help center).

### 7.2 Caps (three classes — never mix them)

- `verified_cap`: a number published in a Suno-owned source (help center, release notes, v6 FAQ). Today Suno publishes NO char caps — so every number below is working or heuristic until a Suno-owned source confirms it. (Feature facts ARE verified: v6 family/tiers, Variety Off=0, Max Mode cost, Vocal Gender presence. Char counts are not.)
- `working_cap`: best-known value from multi-source observation — enforced by the validator, re-verified live. If the live box disagrees, the box wins and this table is edited the same day.
- `heuristic_cap`: operator-safe policy ceiling — enforced as tier tops and conservative caps.

| Field | working_cap | heuristic_cap | Notes |
|---|---|---|---|
| Custom lyrics | 5000 (HG V6 + stable long-term use; official number unpublished) | tiers S1000/M3000/L4000/XL5000 | past ~3000 chars Suno rushes (HG guide) |
| Style prompt | 1000 (live maxlength observed 2026-09-12 via on-page diagnostics; still unpublished by Suno) | tiers S250/M600/L800/XL900 (XL parked under working) | overlong styles may truncate silently — cut lowest-priority phrases first |
| Title | 100 (live-observed) | 80 conservative (auto-shorten over) | live v6 allows 100, not used |
| Exclude styles | 1000 (live-observed 2026-09-14; earlier 200 superseded) | ≤3 focused items per track | prose negations banned from Styles |

Failure mode: overlong style text may be silently truncated in the app — descriptors past the cap never reach the model. If the box stops accepting input, cut lowest-priority phrases first; move detail out of the capped field instead of stacking negation prose. Rough duration guide (HG, calibrate by render): 200-300 words / 30-40 lines map to a standard 3-4 min song; past ~3000 chars Suno rushes. Always confirm exact v6 caps in the live product before a final lock.

### 7.3 Tag dictionary (closed vocabulary)

Canonical home: [SUNO-TAGS.md](SUNO-TAGS.md) in this skill folder — it installs together with this file, open it to see the full tables (A. Structure tags, B. Vocal tags, C. Service info, one-line meaning per tag for model, parser, and human).

Rules: read that file whenever emitting or checking tags. Structure/vocal heads: ONLY A/B (+aliases) — any other bracket head is `unknown-tag`: Self-check red, fix before delivery. Retired/denied forms live in SUNO-TAGS.md section X — never emit. Modifier/brief/color lines: ONLY E patterns (exempt from the A/B check).

AI Studio deploy: files don't travel — paste the full SUNO-TAGS.md text at the end of System Instructions (see §8).



### 7.4 Combination rules

Rules 1–18: RULES.md R4.

### 7.5 More Options (canonical 7+1 block)

Canonical table and presets: RULES.md R8.

### 7.6 Never-mix rules

Never-mix: RULES.md R2.

## 8. Deploy — adapters: ADAPTERS.md A0–A7.

## 9. Human docs (English-only)

All human-facing files in this skill are English-only by design (see README.md). Machine-translate if needed — the model never depends on translated text.

## Changelog

Full history: `CHANGELOG.md` (normative archive). Latest release: v2.0.0-rc12 (2026-09-14); new entries go to CHANGELOG.md per the README rule.
