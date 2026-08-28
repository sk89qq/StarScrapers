# DarkWing / Void Hunters — FORENSIC MASTER — CURRENT SNAPSHOT

**Effective snapshot:** 2026-08-28 16:55 CDT  
**Purpose:** single current dispatch/source-of-truth layer for native-forensic port work. Treat this as a restart point; prior reports are evidence, not active context.

## 1. Reading order

`FORENSIC_MASTER.md` → `CURRENT_STATE_2026-08-28.md` → `CANONICAL/` → raw evidence only for an OPEN item.

`CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` is the single numeric authority for implementation-facing native inputs. Domain CSVs are canonical filtered views of that table and must not be independently edited. `CANONICAL/SYSTEMS/*.md` records current semantic status.

## 2. Source authority

Original `voidhunters.jar` → JAR-derived bytecode/decompilation → current canonical records → historical evidence. AlterOrb/DarkWing behavior may corroborate but cannot override original-JAR mechanics.

## 3. Status model

**Evidence:** `CODE_VERIFIED` / `EXTRACTED` / `PARTIAL` / `RAW-GAP` / `SUPERSEDED`.  
**Port:** `CLOSED-FOR-PORT` / `REQUIRED` / `NOT-REQUIRED`.  
**Implementation:** `NOT-IMPLEMENTED` / `IMPLEMENTED` / `ACCEPTANCE-VERIFIED`.

Do not combine these dimensions into a single overloaded status.

## 4. Closed-for-port — do not reopen

| Subject | Current port status |
|---|---|
| Mass / component area-derived mass | CLOSED-FOR-PORT |
| Center of mass | CLOSED-FOR-PORT |
| Moment of inertia | CLOSED-FOR-PORT |
| Torque input constants/operator boundary | CLOSED-FOR-PORT |
| Native angle/trig encoding | CLOSED-FOR-PORT |
| Structural authority / transaction model | CLOSED-FOR-PORT |
| Projectile swept-hit implementation boundary | CLOSED-FOR-PORT |

Generic replacement-engine physics is not forensic scope.

## 5. Current native-value authorities

| Domain | Canonical file | Current status |
|---|---|---|
| Engine-bound/general native inputs | `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` | CURRENT AUTHORITY |
| Components / 56 slots | `CANONICAL/VALUES/COMPONENTS_56.csv` | PARTIAL — fixed data substantially recovered; slots 31–41 source-resolved; slots 48–55 procedural generation remains open |
| Weapons | `CANONICAL/VALUES/WEAPONS.csv` | RECOVERED — consumer semantics remain only where needed |
| Thrusters | `CANONICAL/VALUES/THRUSTERS.csv` | RECOVERED/PARTIAL |
| Shields | `CANONICAL/VALUES/SHIELDS.csv` | RECOVERED; native boundary + runtime integration IMPLEMENTED |
| Grapple | `CANONICAL/VALUES/GRAPPLE.csv` | RECOVERED; native boundary + runtime integration IMPLEMENTED |
| Missions | `CANONICAL/VALUES/MISSIONS.csv` | RECOVERED/PARTIAL |

## 6. Current active queue

### P0 — required native/gameplay closure
1. Resolve remaining generated/procedural component geometry, primarily slots 48–55 (`jba` generation chain).
2. Hardpoint projection/filtering needed for exact placement.
3. Component hit selection and exact HP lookup where required.
4. Weapon consumer semantics needed to interpret recovered native inputs.
5. Thruster activation/binding semantics needed by gameplay.
6. Power/resource consumer semantics still native-specific.
7. Shield/grapple semantics are written through to the runtime boundary; only acceptance verification or a genuinely new source-evidence gap remains. Do not reopen from stale reports.
8. Debris launch caller scalar and remaining native launch parameters.

### P1 — game-system closure
9. MissionCondition/MissionAction orchestration and timing.
10. Debris persistence/cleanup.
11. Environment/terrain behavior and required native parameters.
12. AI behavior parameters required by the port.

## 7. Out of scope

Do not reconstruct generic rigid-body integration, collision manifolds, impulse solvers, damping solvers, polygon collision mathematics, constraint/rope solvers, or other mechanics supplied by the replacement 2D engine. Only native values and game-specific semantics crossing that boundary are required.

## 8. Canonical variable registry

`FORENSIC_VARIABLE_REGISTRY.csv` contains the current implementation-facing native symbol/value mapping. The previous broad literal/provenance registry is preserved in the pre-restart snapshot.

## 9. Historical evidence

`ARCHIVE/FORENSIC_SNAPSHOTS/PRE_RESTART_2026-08-28/` contains the immediately preceding canonical control layer. `ARCHIVE/DUPLICATE_WORKSTREAMS/` and older reports remain provenance only. `ORIGINAL_JAR/PREPROCESSING_01_06/` is immutable raw substrate.

## 10. Update rule

Every forensic pass updates the relevant canonical system/value record and this master in the same pass. A subject is not closed merely because a value is known; close only when the evidence required for the port is verified.
