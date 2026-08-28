# VOIDA Directives & Changelog Logbook

## Overview
This file tracks received directives, implementation changes, and verification status for the Void Hunters forensic port.

---

## 🛑 Core Engineering Directive: Problem-Solving Triage
**DO NOT SOLVE A PROBLEM TWICE.**

Before implementing any mechanic:
1. **ASK:** "Does the original client already contain the answer?"
   - If YES: extract it from the original reference/decompile code and record the source location.
2. **THEN ASK:** "Does Roblox already provide a mechanism capable of reproducing it?"
   - If YES: use the native Roblox primitive/API where it preserves the required observable behavior.
3. **ONLY IF BOTH ANSWERS ARE NO:**
   - Design custom logic and label it `[INFERRED]` until validated.

This rule is persisted in `AGENTS.md` and applies to every engineering turn.

---

## 🔬 Completion / Verification Policy
The previous log used `Complete` for phases whose implementations had not been fully audited against the recovered client. That status is retired.

A phase may use these states only:

- **EXTRACTED** — reference behavior/data recovered; implementation not yet reconciled.
- **IMPLEMENTED** — Roblox implementation exists; full forensic parity is not yet demonstrated.
- **VERIFIED** — implementation has been compared against recovered client behavior for the scoped acceptance tests.
- **BLOCKED** — required source/resource evidence or runtime verification is missing.
- **SUPERSEDED** — previous implementation replaced by a later authoritative implementation.

`VERIFIED` requires an explicit acceptance test and source citation. Presence of code, a populated module, or a passing basic smoke test is not sufficient.

Every claim/value must retain its source-truth tag:
`[CODE_VERIFIED]`, `[ASSET_VERIFIED]`, `[ORIGINAL_DATA_VERIFIED]`, `[ALTERORB_BEHAVIOR_VERIFIED]`, `[DOCUMENTATION_ONLY]`, `[INFERRED]`, `[UNKNOWN]`.

Do not mark inferred Roblox choices as `[CODE_VERIFIED]` merely because they are compatible with the reference.

---

## Current Phase Registry

### [Phase 0 - Initialization]
- **Status:** IMPLEMENTED
- **Scope:** VOIDA documentation, source-truth rules, baseline project inventory, and development scaffolding.

### [Phase 1 - Physics & RigidBody2D Engine]
- **Status:** IMPLEMENTED
- **Verification:** PARTIAL
- **Current state:** A 50 Hz custom 2D rigid-body layer exists with mass points, COM, inertia, force/torque, impulses, damping, and Roblox transform synchronization.
- **Required before VERIFIED:** audit every numerical constant/formula against the recovered client and distinguish original behavior from Roblox safety/performance policies.

### [Phase 2 - Ship Assembly & Socket Graph]
- **Status:** IMPLEMENTED
- **Verification:** PARTIAL
- **Current state:** Recursive graph, socket matching, weld creation, reachability/severance and build-mode snapping exist. `StructuralAuthority` is now the intended mutation boundary.
- **Required before VERIFIED:** remove remaining generic socket fallbacks and prove hardpoint attach/detach/replacement against reference behavior.

### [Phase 3 - Tactical Combat, Weapons & Projectile Ballistics]
- **Status:** IMPLEMENTED
- **Verification:** PARTIAL
- **Current state:** Weapon controller now uses `ComponentAuthority` as its health-state boundary and `StructuralAuthority` for component destruction. Shield/capacitor/weapon numerical parity is still not established.
- **Required before VERIFIED:** reconcile duplicated state in remaining combat/PvP systems and every damage/weapon/energy constant against the recovered client.

### [Phase 4 - HUD, Radar & Arena Match Loop]
- **Status:** IMPLEMENTED
- **Verification:** PARTIAL
- **Current state:** Arena match manager and HUD exist; team vocabulary is now Yellow/Blue. This remains the Arena prototype rather than the complete Mission framework.
- **Required before VERIFIED:** port the original MissionCondition/MissionAction orchestration and verify HUD behavior against archived client evidence.

### [Phase 5 - Forensic Port Blueprint Alignment & Definitive Data Models]
- **Status:** EXTRACTED + IMPLEMENTED
- **Verification:** PARTIAL
- **Current state:** Decompiled component/body schemas, category colors, geometry data and debris configuration are present.
- **Required before VERIFIED:** audit every numeric/table entry against actual source/resource data and resolve remaining decompilation gaps.

### [Current Workstream - Foundation Structural Reconciliation]
- **Status:** ACTIVE
- **Implemented boundaries:**
  - `ComponentAuthority` = canonical component runtime state.
  - `StructuralAuthority` = canonical attach/detach/replace/sever boundary.
  - `ShipSocketGraph` = socket/hardpoint solver/index.
  - `RigidBody2D` = logical 2D body solver where native Roblox physics is not equivalent.
  - `TeamIdentity` = shared Yellow/Blue team vocabulary.
- **Next reconciliation:**
  1. migrate remaining PvP/repair code away from private component state
  2. remove generic topology fallbacks
  3. migrate all replacement/manual detach paths to `StructuralAuthority`
  4. reconcile shield/power state authority
  5. reconcile physics constants/formulas
  6. port MissionCondition/MissionAction framework

---

## Engineering Rule For Completion Claims
A directive is **not complete because code exists**.

For each directive the engineer must record:

```text
SOURCE:
original class/method/data or archival reference

CURRENT IMPLEMENTATION:
file/module/function

BEHAVIORAL DELTA:
none / known difference / unknown

ACCEPTANCE TEST:
what must be observed to call the directive VERIFIED

STATUS:
EXTRACTED | IMPLEMENTED | VERIFIED | BLOCKED | SUPERSEDED
```

This preserves the existing Roblox/Luau architecture while preventing the documentation layer from claiming forensic parity before it has been demonstrated.

---


## 2026-08-28 — Forensic scope correction: future-engine-owned physics

Directive: do not spend forensic passes reconstructing generic rigid-body engine internals that the replacement 2D engine will provide.

Excluded from active forensic investigation unless a native gameplay input/constant is required:
- `anb` integration/update equations and timestep internals
- generic force/torque accumulation and consumption mechanics
- collision impulse/force resolution
- generic damping/velocity integration
- engine-level max-speed enforcement

Continue recovering only source-verified gameplay-side constants and parameters that must be fed into the replacement engine, plus component selection/damage routing and other game-specific behavior. Existing verified native mass, COM, inertia, torque constants, and force magnitudes remain preserved as implementation inputs; their old engine implementation is not a new forensic target.

This rule supersedes the earlier active-queue wording that treated `anb` integration and collision-force closure as required forensic blockers.

## 2026-08-26 — Foundation Structural Reconciliation

Implemented:
- canonical `ComponentAuthority` for component HP/state and immutable base-color presentation
- canonical `StructuralAuthority` for graph attach/detach/replacement/severance
- blueprint AutoBuild routed through the structural mutation boundary
- Yellow/Blue team identity centralized in `TeamIdentity`
- Arena `MatchState` and `VoidHunterMatchManager` corrected from Red/Blue to Yellow/Blue
- weapon damage/destruction migrated to `ComponentAuthority` compatibility views and `StructuralAuthority`
- root/ship destruction no longer fabricates random 40%-HP / 80%-HP clone salvage
- completion/status language aligned with forensic verification policy

Explicitly NOT declared verified by this change:
- exact source numerical shield/capacitor values
- exact critical-flash render threshold in original code
- complete Mission framework parity
- exact audiovisual asset parity
- exact decompiled physics formulas where CFR control flow remains unresolved

These remain `PARTIAL`, `UNKNOWN`, or `BLOCKED` until the reference evidence supports them.


## 2026-08-28 — Full native-value sweep and reintegration
- Swept the consolidated forensic tree and canonical 235-key native configuration table for native values that DarkWing may need as replacement-engine/gameplay inputs.
- Added `DEFINITIVE_VALUES/NATIVE_ENGINE_INPUT_REGISTRY.csv` as the canonical implementation-facing subset/index.
- Added `DEFINITIVE_VALUES/NATIVE_VALUE_SWEEP_2026-08-28.md` documenting reconciliation and remaining genuine gaps.
- Added `src/roblox/ReplicatedStorage/Shared/Combat/NativeGameplayConfig.luau` containing the source-extracted native gameplay/physics payloads in native units.
- Updated `NativeWeaponConfig.luau` so weapon contracts resolve their numeric native payloads from the canonical native gameplay table instead of carrying a separate unresolved numeric namespace.
- Generic physics-engine solver internals remain explicitly out of forensic scope.


## 2026-08-28 — Forensic master file-by-file rectification
- Audited every forensic/reference artifact in the current and prior DarkWing project trees against `FORENSIC_MASTER.md`.
- Standardized duplicate workstreams and historical dispositions.
- Reconciled the 235-key native configuration namespace against the 190-row implementation-facing native input registry.
- Kept native values extracted for grapple/shield distinct from older notes that still claim unresolved consumer semantics; no unsupported closure was invented.
- Preserved the rule that replacement-engine internals are outside forensic scope.
- Added `FORENSIC_FILE_AUDIT_2026-08-28.md`.
- `FORENSIC_MASTER.md` is now the required dispatch layer for future forensic passes.


## 2026-08-28 — Forensic tree cleanup
- `CANONICAL/` established as the only active forensic reading layer.
- Former `DEFINITIVE_VALUES/` moved to `ARCHIVE/FORENSIC_SNAPSHOTS/DEFINITIVE_VALUES_2026-08-28/`.
- Redundant convenience decompilation files and superseded top-level forensic notes moved to archive.
- Canonical value registries are now the active numeric source of truth.
- Raw original-JAR preprocessing/evidence remains preserved.

## 2026-08-28 — Canonical value-layer deduplication
- Removed the redundant `CANONICAL/VALUES/PORT_INPUTS.md` pointer document.
- Converted `NATIVE_GAMEPLAY_VALUES.csv` into a cross-reference index rather than a competing value registry.
- Established `NATIVE_ENGINE_INPUTS.csv` as the single engine-bound numeric authority; subsystem CSVs remain authoritative for domain-specific values.
- Added `EVIDENCE/` as the active evidence doorway with an evidence map; immutable raw preprocessing remains under `ORIGINAL_JAR/PREPROCESSING_01_06/`.
- Updated `FORENSIC_README.md` and `FORENSIC_MASTER.md` to enforce the hierarchy and prevent new parallel registries.


## 2026-08-28 CURRENT FORENSIC RESTART SNAPSHOT
The canonical forensic layer was re-based as a current-state snapshot. Prior canonical control files were preserved under `ARCHIVE/FORENSIC_SNAPSHOTS/PRE_RESTART_2026-08-28/`. The Master now dispatches current work only; native engine inputs are single-source in `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv`; subsystem CSVs are generated views; the current variable registry contains implementation-facing native symbols/values; historical reports no longer create active queues. Generic replacement-engine internals remain explicitly out of forensic scope.

---

## Phase C — Shield/Grapple Runtime Write-Through
**Status:** IMPLEMENTED

- Added `NativeShieldBoundary` and `NativeGrappleBoundary` as the sole implementation-facing native input boundaries.
- Replaced the server shield prototype's inferred regeneration/reboot/damage modifiers/fallbacks with recovered native consumption semantics.
- Consolidated shield absorption under `VoidHunterShieldSystem`; `VoidHunterWeaponController` no longer owns duplicate shield state.
- Replaced the PvP private grapple implementation and guessed constants with `GrappleSystem` instances configured from `NativeGrappleBoundary`.
- Preserved raw native force/distance values at the physics boundary rather than inventing Roblox-unit conversions.
- Runtime acceptance remains a separate verification step; implementation presence is not claimed as `VERIFIED`.
