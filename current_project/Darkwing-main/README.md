# Void Hunters Luau Port — Forensic Java-to-Luau Dissection

This project reconstructs **Void Hunters** (a space combat game) from recovered Java bytecode into Roblox Luau.

## Project Structure

- **`src/roblox/`** — Target Luau implementation (Roblox hierarchy)
  - `ReplicatedStorage/` — Shared game systems (combat, physics, ship structure)
  - `ServerScriptService/` — Server-authoritative game logic
  - `StarterGui/` — UI controllers
  - `StarterPlayer/` — Client-side player logic

- **`VOIDA/`** — Forensic evidence archive & analysis
  - `ORIGINAL_JAR/PREPROCESSING_01_06/` — Original `.jar` bytecode, disassembly, class indexes
  - `EVIDENCE/` — Active forensic reference layer
  - `CANONICAL/` — Synthesized system blueprints & specs (authority-tagged)
  - `ARCHIVE/` — Prior snapshots and superseded work

- **`AGENTS.md`** — Engineering directives for port implementation
  - Source authority hierarchy (raw JAR > recovered bytecode > Roblox equivalents > inferred)
  - Verification tags: `[CODE_VERIFIED]`, `[INFERRED]`, `[UNKNOWN]`, etc.
  - Canonical runtime state boundaries (ComponentAuthority, StructuralAuthority, etc.)

## Workflow

1. **Inspect forensic evidence** in `VOIDA/ORIGINAL_JAR/` (javap disassembly, class indexes)
2. **Consult synthesized specs** in `VOIDA/CANONICAL/SYSTEMS/` for each game system
3. **Implement in Luau** with explicit verification tags (see `AGENTS.md`)
4. **Reference** `VOIDA/FORENSIC_MASTER.md` for cross-linked findings

## Key Principles

- **Source of truth order:** Raw decompiled source → recovered bytecode → Roblox primitives → custom (marked `[INFERRED]`)
- **Never solve twice:** Check if the original client already has the answer before reimplementing
- **Tag all claims:** Every value, equation, or behavior must be tagged with verification status
- **Fail closed:** Unknown/missing definitions block rather than invent fallback behavior
