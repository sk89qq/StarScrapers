# VOIDA SOURCE INDEX — CONSOLIDATED

## Purpose

Start here for forensic work. `FORENSIC_MASTER.md` is the canonical dispatch/status layer. It replaces the need to reread historical migration/audit notes. Raw JAR-derived artifacts remain the evidence authority.

## Authority order

1. `VOIDA/ORIGINAL_JAR/` — exact native binary and directly derived bytecode/source.
2. `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/` — complete class/javap/index layer.
3. `VOIDA/DEFINITIVE_VALUES/` — consolidated native extracted values/tables.
4. `VOIDA/FORENSIC_MASTER.md` — reconciled forensic conclusions, closure state, and active queue.
5. `src/roblox/*` — implementation target.

## Canonical working files

- `FORENSIC_MASTER.md` — one standardized forensic status map; use this first.
- `FORENSIC_VARIABLE_REGISTRY.csv` — deduplicated identifiers/expressions preserved from consolidated and culled notes.
- `FORENSIC_README.md` — short operating instructions.
- `00_RAW_FORENSIC_REFERENCE.md` — evidence rules and raw-source conventions.
- `00_DEFINITIVE_ORIGINAL_JAR.md` — immutable native JAR identity.
- `04_DIRECTIVES_AND_CHANGELOG.md` — project directives/history.
- `19_RAW_PHYSICS_OPERATOR_RECOVERY.md` — still-active native physics evidence.
- `21_NATIVE_DEBRIS_LAUNCH_MAPPING.md` — still-active debris launch evidence.
- `22_MISSION_FRAMEWORK_MIGRATION.md` — still-active mission investigation.
- `26_COMPONENT_DEFINITION_VALIDATION.md` — still-active component-definition validation.
- `29_NATIVE_THRUSTER_OPERATOR_RECOVERY.md` — still-active native thruster operator evidence.
- `30_NATIVE_THRUSTER_BINDING_RECOVERY.md` — still-active thruster binding evidence.
- `30_BLOCKED_SHIELD_FORENSICS.md` — blocked/open shield investigation.
- `31_COMPONENT_56_SLOT_RECONCILIATION.md` — current component-slot reconciliation.
- `33_NATIVE_PHYSICS_CONFIG_RECONCILIATION.md` — current native configuration reconciliation.
- `34_NATIVE_WEAPON_PARAMETER_CONTRACT.md` — current weapon parameter contract.
- `35_JAR_BYTECODE_PHYSICS_VERIFICATION.md` — current bytecode physics verification.
- `MISSION_SYMBOL_INDEX.md` — mission symbol index.

## Definitive-value layer

`DEFINITIVE_VALUES/` contains the raw census, semantic indexes, native configuration table, component-slot table, and other extracted data. Do not recreate these from prose notes.

## Evidence labels

- `CODE_VERIFIED` / `ORIGINAL_DATA_VERIFIED` — directly supported by the exact native source/binary.
- `EXTRACTED` — recovered evidence without full parity acceptance.
- `IMPLEMENTED` — DarkWing implementation exists.
- `VERIFIED` — scoped implementation acceptance plus source evidence.
- `PARTIAL` — chain partly recovered; remainder open.
- `RAW-GAP` — source/decompilation evidence still insufficient.
- `BLOCKED` — required evidence/test unavailable.
- `INFERRED` — hypothesis only.
- `SUPERSEDED` — older result no longer controls.
- `CLOSED-IMPLEMENTATION` — no further forensic rediscovery required for the implementation boundary; reopen only if new native evidence contradicts it.

## Working rule

Before investigating a subject, search `FORENSIC_MASTER.md`. If it is closed, apply the canonical result. If open, jump directly to the named native class/method and supporting index. Use call graph, field census, JVM dataflow, and CFG only along the dependency chain needed to close that item.

Historical migration/audit documents that were duplicates or implementation-closed have been culled from the active tree. Their implementation-relevant identifiers and expressions remain in `FORENSIC_VARIABLE_REGISTRY.csv`.
