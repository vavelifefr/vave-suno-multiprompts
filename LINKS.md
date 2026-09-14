# LINKS.md — Pro runtime registry for vave-suno-multiprompts

- Version: 2026-09-12. Language: English. Same folder as SKILL.md.
- Date format: DD.MM.YYYY (e.g. 12.09.2026). `never` = not visited yet by this skill.
- Refresh policy (normative, see SKILL.md §2.1): on first activation in a window the skill reads these dates LOCALLY (cheap). Network refresh happens ONLY on: (a) first-ever launch (stamps missing/`never`) — mandatory full pass; (b) explicit operator trigger; (c) failure-escalation — 3-4 rework rounds plus operator complaint (not similar / result does not match) — targeted re-sync of the relevant links; (d) style-note miss — a requested style with no direct STYLE-NOTES.md entry — targeted fetch for that style only, then link + note. A source 10+ days older than today is STALE: the skill flags it in one line and suggests a refresh command, but never goes to the network on staleness alone.
- Registry scope: references, style guides, mixes, style-writing guides — NEVER single-song breakdowns (per-request song research stays in chat/INFO with its own ref_sources, it does not enter this registry, or the file overflows). Section 5 lists reference-research source databases — record the source, never a specific song.
- Forced refresh triggers (any language, any case): `update docs`, `refresh sources`, `sync docs`.
- After any sync the skill MUST: update the date on every visited link below, patch GUIDE.md to match, bump GUIDE version + changelog, patch SUNO-TAGS.md only if tags are affected (auto-allowed, validator must stay green), and log one changelog line in SKILL.md.

## 1. Suno official (highest priority, trust first)

- https://help.suno.com/en — synced: never — scope: help-center KB (Custom Mode, Rights & Ownership, Studio, Stems, Vocal Gender, Max Mode).
- https://about.suno.com/release-notes/introducing-v6 — synced: never — scope: v6 family models, flags, official capabilities.
- https://suno.com/blog/introducing-v6 — synced: never — scope: v6 launch notes, model character.
- https://suno.com/community-guidelines — synced: never — scope: IP/copyright boundary (grounds SKILL.md §6).

## 2. High-quality third-party (structured products — useful, never authoritative)

Suno Styles states it is not affiliated with or endorsed by Suno AI. Mine this tier for production vocabulary and arrangement facts (never artist names or lyrics); verify load-bearing claims against tier 1 or a second tier-2 source.

- https://sunostyles.com/best-suno-prompts — synced: never — scope: general prompt best practices, style-box recipes.
- https://sunostyles.com/suno-style-of-music-examples — synced: never — scope: style-of-music example library, production vocabulary mining (names never emitted).
- https://sunostyles.com/suno-prompts/vocals — synced: never — scope: vocal direction (role/texture/delivery/mix cues), vocal mistakes to avoid.
- https://sunostyles.com/suno-genre-prompts — synced: never — scope: genre-first prompting, one-primary-plus-modifier rule, function-first genre choice, lane examples.
- https://sunostyles.com/suno-prompt-library — synced: never — scope: prompt library, arrangement/production phrasing.
- https://sunostyles.com/styles — synced: never — scope: searchable style index (76 pages), lane vocabulary on demand.

## 3. Community / observed (mixed quality — weakest links)

Independent guides and observations. Single-source claims stay weakest: prefer multi-source confirmation; weak rows stay emissible only where the dictionary explicitly marks them so.

- https://freesongwritingtools.com/blog/suno-metatags-guide — synced: never — scope: metatag behavior (parens sung, 1-3 words per tag, counts).
- https://usesuno.com/guide/tags — synced: never — scope: tag reference, Tempo Change/Accel inconsistency notes.
- https://blakecrosley.com/guides/suno — synced: never — scope: full tag tables, Style 4-7 descriptors, parameterized modifiers.
- https://hookgenius.app/learn/suno-lyrics-formatting — synced: never — scope: Lyrics formatting (confirmed tags, caps, line length, V6 5000 chars).

## 4. Operator-added sources

 Operator appends lines here in the same shape: URL — synced: never — scope: one line. Good candidates: search engines (including music ones), specific wiki articles, music databases, fan sites, forum threads with render-tested findings.

- (empty — nothing added yet)

## 5. Reference-research sources (databases)

Looked up only when the model-first dossier is `thin` (ADAPTERS.md A7). These are optional aids, not a mandatory set: query them live; never paste song data into this registry — a line records the SOURCE.

- https://musicbrainz.org — synced: never — scope: structured credits/instruments (`artist-rels`, `recording-level-rels`), genres/tags, ISRC; REST `ws/2` `fmt=json`, `User-Agent` required, ~1 req/s.
- https://www.discogs.com — synced: never — scope: styles/subgenres, credits (who played what), label/year/country/format (API token).
- https://www.allmusic.com — synced: never — scope: editorial taxonomy Genre/Styles/Moods/Themes + credits + review + recording date/location (TiVo data; no official API).
- https://www.beatport.com — synced: never — scope: electronic subgenre + BPM + key per track.
- https://songbpm.com — synced: never — scope: BPM/key lookup by title (non-electronic fallback).
- https://www.musicstax.com — synced: never — scope: BPM/key lookup alternative.
- https://secondhandsongs.com — synced: never — scope: covers + music/lyrics credits (lineage).
- https://www.whosampled.com — synced: never — scope: samples/interpolations/remixes (lineage).
- https://hooktheory.com — synced: never — scope: chord progressions and structure (theory).
- https://en.wikipedia.org — synced: never — scope: context, personnel, production (verify load-bearing claims against a second source).
- https://everynoise.com — synced: never — scope: genre taxonomy map (frozen since Dec 2023 — taxonomy only, not freshness).

(End of file)
