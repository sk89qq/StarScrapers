# DarkWing / Void Hunters — Consolidated Forensic Master Summary
Date: 2026-08-28

## Purpose
This document consolidates the current DarkWing forensic corpus into one working source-of-truth view. It identifies duplicated/overlapping work from different passes/agents, resolves documentation conflicts where the evidence already supports a winner, separates implementation-closed subjects from still-open forensic subjects, and defines the active queue so future agents do not repeatedly traverse the full corpus.

## 1. Immutable source anchor

Authoritative native binary:
- `voidhunters.jar`
- Version: 3.1.2
- Main class: `VoidHunters`
- Size: 2,325,563 bytes
- SHA-1: `1f10b35f16b5de98ebf67f9b6f3f127aab7b66d3`
- SHA-256: `4bb086ef9b0ec1f6f5362df92d634a2b4d997b4b5037f213fd3d5e5ea219bba4`
- AlterOrb gamepack hash matches the SHA-256.

Authority order:
1. Exact original JAR.
2. Source/disassembly directly derived from that JAR.
3. Source-derived forensic indexes/tables.
4. DarkWing implementation.
5. Inference/prototype behavior only when explicitly labeled.

## 2. Corpus inventory and duplication findings

Current extracted project corpus contains approximately 120 non-generated forensic/index text artifacts plus the DarkWing implementation tree, the original JAR, and multiple forensic ZIP packages.

### Exact duplicate / packaging overlap
- `Darkwing-main(2).zip` and `DarkWing-main-steps1-6-indexed-final(1).zip` share the same base project files; the latter is a superset with the Steps 1–6 preprocessing/index layer and additional forensic artifacts.
- `DarkWing-source-index-files-final(1).zip` contains 11 index artifacts that are byte-for-byte duplicated inside `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/` in the newer DarkWing tree.
- The embedded preprocessing layer contains the original JAR, complete class list, complete `javap` dump, targeted bytecode dumps, and source indexes. This should be the canonical working location; the standalone source-index ZIP is an archival duplicate.
- The older/current DarkWing project ZIP should not be treated as a second source of truth. Use the newest indexed tree as the working snapshot.

### Specialized forensic ZIPs are complementary, not competing
These are distinct evidence layers and should remain as reference inputs:
- Complete static index: constant-pool/value provenance, shifts, bitwise operations, allocations, dispatch, static initialization.
- Full call graph: callers/callees, field access, class coverage, dispatch.
- Field read/write census: writers/readers/initialization and anomalies.
- Inheritance/interface graph: hierarchy, overrides, ancestors.
- JVM stack/local dataflow: stack/local provenance and parameter flow.
- Machine-readable CFG: control-flow blocks/edges/instructions.
- Final forensic indexes: invocation arguments, returns, synchronization, switches, dataflow.

These specialized indexes overlap in subject matter but not in evidence function. They should be queried by dependency rather than reread wholesale.

## 3. Standard evidence/status vocabulary

Use two separate concepts:

### Forensic status
- `CODE_VERIFIED` / `ORIGINAL_DATA_VERIFIED`: directly supported by the exact native source/binary.
- `EXTRACTED`: evidence recovered but implementation parity not demonstrated.
- `IMPLEMENTED`: DarkWing implementation exists.
- `VERIFIED`: scoped implementation acceptance test plus source evidence exists.
- `PARTIAL`: some chain recovered/implemented, remainder open.
- `RAW-GAP`: native source/decompilation still insufficient.
- `BLOCKED`: required evidence/runtime test unavailable.
- `INFERRED`: hypothesis only.
- `SUPERSEDED`: older note no longer controls.

### Implementation closure
A subject may be `CLOSED-IMPLEMENTATION` even when its native forensic parity is not 100% closed, if no further source investigation is required to build the next engine boundary. Do not reopen such subjects merely because an old note says `PARTIAL`.

## 4. IMPLEMENTATION-CLOSED — remove from active forensic queue

These are subjects whose DarkWing architecture/boundary is already settled and should not be repeatedly rediscovered. Keep their evidence files as archival references.

### Authority/ownership
- `ComponentAuthority` is the component health/state authority.
- `StructuralAuthority` is the structural mutation boundary.
- `BodyRecomputeService` is the post-mutation recompute boundary.
- `ShipRegistry` is ship ownership/lookup authority.
- `TeamIdentity` is team identity/friendly-enemy authority.
- Roblox Instances are projections, not topology/state authority.

### Component identity/topology
- Explicit `ComponentType` is required; no name-based type inference.
- `Components.Types` + `Components.Connections` are the Roblox component catalog boundary.
- Generic four-way socket invention is removed from runtime topology.
- `ShipSocketGraph` rebuilds from explicit relationship metadata.
- `FindBestSnap` remains only an editor/build-time proximity operation.
- Parent/child cycle rejection and inverse-child bookkeeping are centralized.

### Structural mutation
- Attach/detach/replacement/severance converge through `StructuralAuthority`.
- Structural transactions snapshot and roll back membership/topology/transforms/kinematics on failure.
- Replacement validates the exact preserved parent hardpoint before detaching.
- Body mass properties are recomputed through the single body-recompute boundary.

### Blueprint persistence
- V2 blueprint persistence is the canonical model.
- Stable persisted `BlueprintComponent.Id` is separate from runtime `ComponentId` and hardpoint IDs.
- `BlueprintLoader` validates definitions, references, root uniqueness, cycles, and staged hardpoint assignments.
- Live reconstruction commits through the structural transaction boundary.
- Old blueprint system is compatibility/migration residue, not an independent authority.

### Combat ownership/state
- Weapon controller no longer owns private HP tables or ship maps.
- PvP damage/repair/destruction route through canonical authorities.
- PvP ownership uses `ShipRegistry`.
- Team decisions use `TeamIdentity`.
- Shield/capacitor identity is definition-driven rather than Roblox instance-name scanning.

### API hygiene / obvious legacy cleanup
- Indexed legacy `BodyVelocity`, `wait(`, `delay(`, and `tick(` usage has been removed from the audited implementation path.
- Repeated `workspace:GetDescendants()` targeting scans were replaced by registry/spatial-query approaches where documented.

### Basic projectile/hit architecture
- Swept-segment ballistics with nearest-hit selection is the intended DarkWing hit-resolution boundary.
- Actual hit `BasePart` is used instead of random component selection.
- Mass-driver/plasma projectile paths are routed through `BallisticsEngine`.

These are implementation decisions. Native numerical parity for the mechanics below them remains a separate forensic question.

## 5. CLOSED NATIVE PHYSICS INPUTS — do not reopen unless evidence contradicts

The latest bytecode verification established:

### Component mass
`wfb.u` is derived from the native polygon coordinate array using a shoelace-style signed accumulation, divided by 2, with integer clamping. Component-tree mass recursively sums component masses.

### Center of mass
Native component final positions are mass-weighted. The body recompute uses those accumulated component contributions to establish COM and rebase body state.

### Moment of inertia
Native component inertia distributes component mass across final-outline vertices:
- point mass = component mass / max(vertex count, 1)
- vertex coordinates use `ou.r = 8`
- relative squared distance to supplied COM is accumulated
- children recurse
- integer overflow is clamped

### Verified physics constants
- `ge.c = 4`
- `tua.a = 4`
- `ou.r = 8`
- `wf.e = 12`

### Force/torque operator structure
Native force application:
- accumulates linear force
- derives force-point displacement from body position
- uses the `ge.c = 4` scaling stage
- accumulates cross-product-like torque
- uses the `tua.a = 4` torque stage
- clamps integer overflow

Accumulator consumption:
- linear accumulators divide by supplied divisor
- torque contribution divides by `max(m >> 12, 1)`
- accumulators clear after consumption

For the next 2D engine, the recovered mass/COM/inertia/torque inputs are sufficient as a physical-property specification. Reproducing Java's entire class architecture is unnecessary.

## 6. Native configuration data — conflict normalized

There is a documentation conflict:
- `235_NATIVE_DEFAULTS_ATTESTATION.md` claims 235/235 numeric defaults resolved.
- `NATIVE_CONFIGURATION_RESOLUTION.md` says the 235-key runtime payload is unresolved.

Resolution:
- The **235-key namespace is definitely complete**.
- The CSV contains a source-derived `resolved_default` column for 235 rows.
- However, the separate resolution note warns that the live runtime configuration/state pipeline is not equivalent to a single static `qb` table.
- Therefore use the CSV as the canonical **native-default extraction table**, but do not interpret every row as proof of a runtime value at every execution context.
- Runtime/server mutations remain distinct from defaults.

No second configuration table should be created.

## 7. Component geometry — conflict normalized

The old `Choosing A 2D Engine.txt` note claimed slot 47 was convex. The later dedicated `COMPONENT_GEOMETRY_FORENSIC_CENSUS.md` explicitly recalculated it as:
- 8 vertices
- area 1206
- centroid approximately `(3.00746, 0)`
- **CONCAVE**

The later dedicated geometry census wins. The old convex claim is superseded.

The explicit fixed geometry set includes 3–8 vertex shapes. Slot 47 requires exact convex decomposition if Box2D is used; native geometry remains authoritative.

Runtime/generated slots remain separate:
- slots 3–11, 18, 21, 22, 32–41, 45, 48–55, and 51 are indirect/generated in the current ledger.
- slot 30 is a 3-point formula using `n5/n6`.
- slots 48–55 use `jba.a(int[][], long, int, Random, int, long)`.

Do not freeze generated shapes from guesses.

## 8. Major duplicated forensic work and canonical merge

### A. Body recompute
Overlapping notes:
- `25_BODY_RECOMPUTE_MIGRATION.md`
- `29_BODY_RECOMPUTE_AUTHORITY_MIGRATION.md`
- `30_STRUCTURAL_RECOMPUTE_TRANSACTION.md`

Canonical meaning:
- `BodyRecomputeService` is the service boundary.
- `RigidBody2D` owns the math.
- `StructuralAuthority` calls it after topology mutation.
- No subsystem gets a second mass/COM/inertia implementation.

Merge rule: keep one master status entry; the three notes are historical implementation records.

### B. Structural replacement/transactions
Overlapping notes:
- `14_STRUCTURAL_REPLACEMENT_MIGRATION.md`
- `31_STRUCTURAL_REPLACEMENT_TRANSACTION.md`
- `29_BLUEPRINT_TRANSACTION_MIGRATION.md`
- `29_BLUEPRINT_TRANSACTION_HANDOFF.md`

Canonical meaning:
- Structural replacement and blueprint reconstruction use the same transactional authority.
- The handoff/migration documents are historical, not separate active workstreams.

### C. Projectile/hit resolution
Overlapping notes:
- `24_PROJECTILE_AUTHORITY_MIGRATION.md`
- `25_BALLISTICS_HIT_RESOLUTION_MIGRATION.md`
- `26_BALLISTIC_WEAPON_MIGRATION.md`
- `27_PROJECTILE_HIT_AUTHORITY_HANDOFF.md`
- `28_HIT_RESOLUTION_HANDOFF.md`

Canonical meaning:
- `BallisticsEngine` is the hit-resolution boundary.
- Swept segment + nearest hit is the implementation architecture.
- Actual hit part is authoritative input.
- Native damage/weapon constants remain a separate forensic queue.

Do not repeat architecture migration; investigate only missing native mechanics.

### D. Thrusters
Overlapping notes:
- `29_NATIVE_THRUSTER_OPERATOR_RECOVERY.md`
- `30_NATIVE_THRUSTER_BINDING_RECOVERY.md`

Canonical meaning:
- `aqa` is the native thruster behavior class.
- Force families and bindings are identified.
- Exact consumer equations/bindings still require source tracing where marked RAW-GAP.

The binding note and operator note are one forensic stream, not two.

### E. Debris/detachment
Overlapping notes:
- `17_PHYSICS_DETACH_KINEMATICS_MIGRATION.md`
- `18_DEBRIS_AUTHORITY_MIGRATION.md`
- `19_RAW_PHYSICS_OPERATOR_RECOVERY.md`
- `20_NATIVE_DEBRIS_KINEMATICS_MIGRATION.md`
- `21_NATIVE_DEBRIS_LAUNCH_MAPPING.md`

Canonical meaning:
1. Native `nbb.G` transfers transient accumulators.
2. DarkWing preserves source-body point kinematics when detaching.
3. Native `ml.DA` adds a separate geometry/randomized launch term.
4. Caller-specific launch scalar `n2` remains unresolved and must not be guessed.

This is one debris-physics workstream.

### F. Audit/status ledgers
Overlapping notes:
- `04_DIRECTIVES_AND_CHANGELOG.md`
- `06_FOUNDATION_AUDIT.md`
- `07_SUPER_AUDIT.md`
- `08_RUNTIME_AUDIT_ACTIONS.md`
- `09_AUTHORITY_CENSUS.md`
- `11_RAW_RECONCILIATION.md`
- `12_NATIVE_SEMANTIC_EXTRACTION_STATUS.md`
- `00_RAW_FORENSIC_REFERENCE.md`

Canonical hierarchy:
- `00_DEFINITIVE_ORIGINAL_JAR.md` = source identity.
- `00_RAW_FORENSIC_REFERENCE.md` = raw-source evidence rules.
- `04_DIRECTIVES_AND_CHANGELOG.md` = status vocabulary/process.
- `09_AUTHORITY_CENSUS.md` = active implementation authority/open queue.
- `DEFINITIVE_VALUES/*` = extracted native value/index layer.
- `07/08/11/12` = historical audit/reconciliation context unless a newer master entry explicitly references an unresolved item.

Do not reread all audit documents before each task.

### G. Complete-JAR value census
Overlapping notes/files:
- `FULL_JAR_ANALYSIS.md`
- `JAR_CENSUS.md`
- `full_jar_semantic_census.md`
- `RAW_CENSUS_PROVENANCE.md`
- `JAR_SEMANTIC_DOMAIN_MAP.md`
- `JAR_SEMANTIC_CLASS_INDEX.csv`
- `native_class_inventory.csv`
- `native_numeric_literals.csv`

Canonical meaning:
- Raw binary census is complete.
- Semantic interpretation is separate from raw literal inventory.
- Use domain map/class index to locate relevant classes; do not mine all 4,805 integer constants repeatedly.

## 9. Native binary census — what is actually known

Exact JAR census:
- 1,570 class files
- 4,805 JVM integer constants / 3,999 distinct integers
- 601 float constants / 445 distinct floats
- 121 double constants / 63 distinct doubles
- 186 long constants / 111 distinct longs
- 5,860 fields
- 11,148 methods

The semantic domain map identifies major native domains including:
TEAM 38 classes, MISSION 36, BLUEPRINT 25, CHASSIS 17, REPAIR 14, ENERGY 13, MISSILE 13, RELOAD 13, SHIELD 13, THRUSTER 12, GRAPPLE 11, FIGHTER 10, WORLD 10, FORCE 8, LASER 7, MASS 7, PROJECTILE 7, DAMAGE 6, DEBRIS 6, RESOURCE 6, COLLISION 4, INERTIA 4, TORQUE 3, etc.

This means the raw census is finished; the remaining job is semantic closure of selected domains.

## 10. Active forensic queue after culling

Only these should be considered active unless a concrete implementation blocker appears:

### P0 — Physics completion
1. Exact native `anb` update/integration equation and caller divisor/timestep.
2. Exact force/torque consumer mapping where the native source still has a structural gap.
3. Exact native collision-force path and ship-to-ship ram damage constants/equations.
4. Exact detach/debris launch scalar `ml.DA` caller mapping for `n2`.
5. Exact remaining max-speed/velocity-sustain consumer behavior where native configuration values are already known but their application path is not.

### P0 — Component geometry/hardpoint closure
6. Resolve all indirect/generated component slots needed for implementation.
7. Close `ta` hardpoint visibility/filter predicate.
8. Close final native hardpoint projection and transform semantics.
9. Close exact component-to-polygon collision selection.
10. Close remaining `wfb`/`lw`/`eo` health lookup semantics if exact HP parity is required.

### P0 — Combat
11. Trace native weapon behavior classes to exact numeric consumers for all weapons that are not already source-closed.
12. Close shield damage-to-energy and directional shield equations.
13. Close power/energy equations where the native consumer remains unresolved.
14. Close grapple target eligibility and remaining native constants.
15. Close thruster consumer equations/bindings where still RAW-GAP.

### P1 — Mission/environment
16. Complete per-mode native MissionBuilder/MissionControl semantics.
17. Close mission timing/transition behavior against source.
18. Close debris lifetime/cleanup/persistence rules.
19. Resolve terrain/environment parameters where implementation needs exact values.

### P1 — Final implementation parity
20. Validate the new 2D engine's feed layer against the recovered native component/body property dataset.
21. Keep native values in a single source-of-truth adapter instead of scattering literals.

## 11. Items explicitly NOT to reopen

- Whether DarkWing needs a custom logical 2D physics representation: settled.
- Whether component state belongs in Roblox Instance names: settled; it does not.
- Whether structural mutations should be decentralized: settled; they should not.
- Whether blueprint IDs can reuse runtime component IDs: settled; they cannot.
- Whether projectile endpoint-only collision is sufficient: settled; swept collision is the chosen implementation boundary.
- Whether native geometry should be replaced by guessed simplified shapes: settled; it must not be.
- Whether mass/COM/inertia should be independently recalculated in multiple subsystems: settled; they must not be.

## 12. Agent operating rule from this master

Before starting a forensic task:
1. Search this master for the subject.
2. If `CLOSED-IMPLEMENTATION`, apply the existing result and do not reopen it.
3. If `FORENSIC-OPEN`, jump directly to the named native classes/methods and supporting indexes.
4. Use the call graph/dataflow/CFG/field census only for the dependency chain needed by that item.
5. Record a new result once in the master and one detailed evidence note if necessary.
6. If two agents produce the same result under different names, merge them into one canonical subject and mark the older note historical/superseded.
7. Never promote an inferred value simply because it makes the DarkWing implementation convenient.

## 13. Immediate next-pass target

The highest-value next pass is **native collision-force / ram-damage closure**, followed by the unresolved `anb` integration divisor/timestep and debris `ml.DA` caller scalar. Those are the remaining physics quantities most likely to block feeding the new 2D engine with a faithful native model.
