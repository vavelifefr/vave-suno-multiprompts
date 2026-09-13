# Encoding policy

Every text file in the project is stored as **UTF-8**. Only the BOM differs:

- **Text with BOM (`utf-8-bom`)** — every human-readable artifact: root Markdown and `tools` (`.md`, `.txt`, `.csv`, `.py`, `.ps1`, `.ts`, `.js`).
- **JSON without BOM (`utf-8`)** — every `.json` (briefs, metrics, summaries, results): a BOM breaks standard JSON parsers.

The BOM exists primarily for Windows PowerShell 5.1 and Windows-editor compatibility: without it, a file with non-ASCII text can be read in the system ANSI codepage (CP1251/CP866). The setting is declared in `.editorconfig` and checked with:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-encoding.ps1
```

- A plain `tools/check-encoding.ps1` run checks **all** text artifacts in the project.
- `tools/check-encoding.ps1 -AuditAll` prints each file's encoding.
- `tools/check-encoding.ps1 -Fix` rewrites text to UTF-8 with BOM, strips BOM from JSON, and transcodes files detected as CP1251.

Data rules:

- External CSV/TXT must never be read through the implicit system codepage.
- UTF-8 is specified explicitly at the read site; BOM files are read as `utf-8-sig` (Python) or via the built-in BOM detector (.NET `File.ReadAllText`).
- CP1251 is allowed only for a documented legacy input that is genuinely verified as CP1251; this must be visible in the code.
- An automatic "UTF-8 or CP1251" fallback is forbidden: it can silently corrupt data.
- **Mojibake** — valid UTF-8 containing U+FFFD, produced from mis-transcoded output (typically Windows PowerShell stdout in CP1251/CP866) — is a defect: `check-encoding.ps1` flags it `MOJIBAKE_CANDIDATE`, and the file is rewritten by hand (no auto-repair). Scripts that print non-ASCII must emit stdout as UTF-8.
