# DarkWing / Void Hunters — Canonical Forensic Master (Rectified 2026-08-28)

> This is the dispatch/source-of-truth layer for forensic work. Every project forensic file has been audited against this master. Native evidence remains authoritative; this master standardizes status, names, overlap, and what still requires investigation. Closed implementation subjects are not reopened. Generic replacement-engine internals are out of forensic scope.

## 0. Canonical reading rule

If a value or conclusion is absent from `CANONICAL/`, it is not an active port requirement. Consult `ARCHIVE/` or `ORIGINAL_JAR/PREPROCESSING_01_06/` only when resolving an `OPEN` item or auditing provenance. `CANONICAL/` is the only active forensic reading layer; archived notes are evidence/history, not competing source-of-truth documents. `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` is the single engine-bound numeric authority; subsystem CSVs are authoritative for their own domains; `NATIVE_GAMEPLAY_VALUES.csv` is only an index and must not duplicate values. `EVIDENCE/` is the active doorway to raw proof, while `ORIGINAL_JAR/PREPROCESSING_01_06/` remains immutable raw substrate.

## 1. Authority and status rules

**Authority order:** exact `voidhunters.jar` → JAR-derived bytecode/decompilation → source-derived forensic indexes → corroborating AlterOrb behavior → DarkWing implementation → inference.

**Status:** `CODE_VERIFIED` = directly established by native binary/source; `EXTRACTED` = native value/data recovered but consumer semantics may remain open; `IMPLEMENTED` = DarkWing code exists; `VERIFIED` = source-backed + acceptance tested; `PARTIAL` = chain partly closed; `RAW-GAP` = native evidence still insufficient; `SUPERSEDED` = historical claim replaced.

**Implementation closure:** `CLOSED-IMPLEMENTATION` means the replacement-engine boundary is settled and no more archaeology is needed for that subject. It does not mean every native constant beneath it has been reconstructed.

## 2. Immutable source anchor

- JAR: `voidhunters.jar` / version 3.1.2
- SHA-256: `4bb086ef9b0ec1f6f5362df92d634a2b4d997b4b5037f213fd3d5e5ea219bba4`
- Size: 2,325,563 bytes
- Complete preprocessing: `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/`

## 3. Corpus rectification

- The newer indexed/consolidated tree is the working project snapshot.
- The standalone source-index package duplicates the embedded `PREPROCESSING_01_06/INDEX` layer and is archival.
- Specialized forensic indexes are complementary evidence layers, not competing truths.
- Historical audit/migration notes remain useful for provenance but no longer constitute independent queues.
- Where an older note conflicts with a newer source-backed result, the newer result is canonical and the older claim is `SUPERSEDED`.

## 4. Canonical native implementation-input inventory

`CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv` is the implementation-facing numeric registry. The former `DEFINITIVE_VALUES/` snapshot has been archived under `ARCHIVE/FORENSIC_SNAPSHOTS/DEFINITIVE_VALUES_2026-08-28/`. Update the canonical registry in place; do not create competing numeric tables.

| Role | Rows | Meaning |
|---|---:|---|
| `DAMAGE_GAMEPLAY_INPUT` | 21 | Native value extracted; use this registry as the numeric source of truth. |
| `GAMEPLAY_INPUT` | 91 | Native value extracted; use this registry as the numeric source of truth. |
| `WEAPON_TIMING/AIM_INPUT` | 51 | Native value extracted; use this registry as the numeric source of truth. |
| `RESOURCE_GAMEPLAY_INPUT` | 19 | Native value extracted; use this registry as the numeric source of truth. |
| `ENGINE_BOUNDARY_INPUT_OR_NATIVE_OPERATOR_REFERENCE` | 8 | Native value extracted; use this registry as the numeric source of truth. |

### Native values currently extracted

| Domain | Canonical values / keys | Status |
|---|---|---|
| Collision/debris | `SHIP_TO_SHIP_RAM_DAMAGE=0`, `DEBRIS_COLLISION=0`, `DEBRIS_PARTITIONED=0`, `DEBRIS_COLLISION_DAMAGE=0`, `DEBRIS_PROJECTILE_COLLISION=0`, `DEBRIS_THROWABLE=0`, `DEBRIS_FOUND_IN_PAIRS=1`, `DEBRIS_CARRY_OVER=1`, `DEBRIS_CARRY_OVER_PERCENTAGE=50`, `DEBRIS_SURVIVES=1`, `COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER=32768`, `PHYSICS_COLLISION_FORCE_MULTIPLIER=4096`, `PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER=4096`, `PHYSICS_COLLISION_PHANTOM_FORCE_MULTIPLIER=2048`, `DEBRIS_DETACHMENT_FORCE_MULTIPLIER=256`, `DEBRIS_GRABBING_RANGE=262144`, `DEBRIS_MAX=512`, `MISSION_TERRAIN_DEBRIS_PROBABILITY=1`, `MISSION_DEBRIS_DEFAULT_PROBABILITY=10`, `MISSION_DEBRIS_VOTING_CHANCESTEP=25` | EXTRACTED; consumer semantics may remain open |
| Thruster/movement | `THRUSTER_BINDING_MOVE_AND_TURN_HAS_OPPOSITE_MOVE=1`, `THRUSTER_AUTOBALANCING=1`, `THRUSTER_BINDING_BALANCE_THRESHOLD=8`, `THRUSTER_FORCE=192`, `THRUSTER_BOOSTER_FORCE=1024`, `THRUSTER_SMALL_FORCE=16`, `VELOCITY_SUSTAIN=508`, `VELOCITY_SUSTAIN_MAX=512`, `ANGULAR_VELOCITY_SUSTAIN=234`, `THRUSTER_PARTICLE_SPEED_DOWNSHIFT=5`, `THRUSTER_PARTICLE_LIFE=4`, `ANGULAR_FORCE_DOWNSHIFT=4`, `ANGULAR_VELOCITY_SUSTAIN_MAX=256` | EXTRACTED; consumer semantics may remain open |
| Weapon timing/aim | `BURST_FIRE_RELOAD=250`, `PHASED_ENERGY_BEAM_RANDOMNESS=0`, `MISSILE_LAUNCHER_RANDOMNESS=0`, `MASS_DRIVER_PROJECTILES=1`, `LASER_PROJECTILES=1`, `BOMBLET_SPRAY_PROJECTILES=10`, `PHASED_ENERGY_BEAM_PROJECTILES=1`, `TORPEDO_PROJECTILES=1`, `SNIPER_CANNON_PROJECTILES=1`, `MISSILE_LAUNCHER_PROJECTILES=1`, `POINT_DEFENCE_LASER_PROJECTILES=1`, `COUNTERMEASURE_LAUNCHER_PROJECTILES=1`, `MASS_DRIVER_RELOAD=20`, `TORPEDO_RELOAD=200`, `LASER_RELOAD=0`, `BOMBLET_SPRAY_RELOAD=50`, `PHASED_ENERGY_BEAM_RELOAD=50`, `MACHINE_GUN_RELOAD=30`, `SNIPER_CANNON_RELOAD=100`, `FIGHTER_BAY_RELOAD=1500`, `POINT_DEFENCE_LASER_RELOAD=50`, `MASS_DRIVER_AIMSPEED=64`, `TORPEDO_AIMSPEED=16`, `LASER_AIMSPEED=8`, `FIGHTER_BAY_AIMSPEED=0`, `SPINNING_BLADE_AIMSPEED=0`, `SNIPER_CANNON_AIMSPEED=4`, `BOMBLET_SPRAY_AIMSPEED=128`, `PHASED_ENERGY_BEAM_AIMSPEED=128`, `MACHINE_GUN_AIMSPEED=128`, `GRAPPLING_HOOK_AIMSPEED=128`, `MISSILE_LAUNCHER_AIMSPEED=0`, `POINT_DEFENCE_LASER_AIMSPEED=128`, `COUNTERMEASURE_LAUNCHER_AIMSPEED=0`, `MASS_DRIVER_AIMARC=1024`, `TORPEDO_AIMARC=512`, `LASER_AIMARC=1024`, `FIGHTER_BAY_AIMARC=0`, `SPINNING_BLADE_AIMARC=0`, `SNIPER_CANNON_AIMARC=1024`, `BOMBLET_SPRAY_AIMARC=1024`, `PHASED_ENERGY_BEAM_AIMARC=1024`, `MACHINE_GUN_AIMARC=0`, `GRAPPLING_HOOK_AIMARC=1024`, `MISSILE_LAUNCHER_AIMARC=0`, `POINT_DEFENCE_LASER_AIMARC=1024`, `COUNTERMEASURE_LAUNCHER_AIMARC=0`, `PHASED_ENERGY_BEAM_PULSETIME=30`, `MACHINE_GUN_PULSETIME=10`, `POINT_DEFENCE_LASER_PULSETIME=50`, `GRAPPLING_HOOK_COOLDOWN=50`, `MISSILES_COOLDOWN=1250`, `SHIELDS_TOGGLE_COOLDOWN=25.0`, `REPAIR_MODE_COOLDOWN=2000`, `BOOSTERS_COOLDOWN=1000`, `COUNTERMEASURES_PULSETIME=50`, `COUNTERMEASURES_COOLDOWN=1000`, `SELF_DESTRUCT_PREPARE_TOGGLE_COOLDOWN=50`, `SELF_DESTRUCT_ACTIVATE_COOLDOWN=500` | EXTRACTED; consumer semantics may remain open |
| Weapon force/damage | `MISSILES_HIT_SOURCE_TEAM=0`, `MISSILES_DAMAGE_SOURCE_TEAM=0`, `MASS_DRIVER_FIRE_FORCE=256`, `TORPEDO_FIRE_FORCE=64`, `LASER_FIRE_FORCE=256`, `BOMBLET_SPRAY_FIRE_FORCE=256`, `PHASED_ENERGY_BEAM_FIRE_FORCE=32768`, `MACHINE_GUN_FIRE_FORCE=16384`, `SNIPER_CANNON_FIRE_FORCE=1024`, `MISSILE_LAUNCHER_FIRE_FORCE=192`, `POINT_DEFENCE_LASER_FIRE_FORCE=131072`, `COUNTERMEASURE_LAUNCHER_FIRE_FORCE=192`, `MASS_DRIVER_PROJECTILE_DAMAGE=1280`, `TORPEDO_PROJECTILE_DAMAGE=1280`, `LASER_BEAM_PROJECTILE_DAMAGE=92`, `MACHINE_GUN_PROJECTILE_DAMAGE=64`, `SNIPER_CANNON_PROJECTILE_DAMAGE=2560`, `BOMBLET_SPRAY_PROJECTILE_DAMAGE=320`, `EXPLOSION_PROJECTILE_DAMAGE=1280`, `POINT_DEFENCE_LASER_PROJECTILE_DAMAGE=64`, `POINT_DEFENCE_LASER_PROJECTILE_INTERCEPT_DAMAGE=8`, `SPINNING_BLADE_SPINDAMAGE_MULTIPLIER=1`, `BOMBLET_SPRAY_PUSH_MULTIPLIER=128`, `EXPLOSION_PUSH_MULTIPLIER=128`, `GRAPPLING_HOOK_FIRE_FORCE=1600`, `MISSILES_COOLDOWN=1250`, `MISSILES_EXPLOSION_POWER=15`, `MISSILES_ACCELERATION=32`, `MISSILES_TOP_SPEED=2048` | EXTRACTED; consumer semantics may remain open |
| Weapon/resource | `SALVO_USES_ALL_ENERGY=0`, `SALVO_DAMAGE_MULTIPLIER=1`, `SALVO_REPAIR_TIME_MULTIPLIER=1`, `BURST_FIRE_MAX_ENERGY=500`, `BURST_FIRE_RELOAD=250`, `PHASED_ENERGY_BEAM_RANDOMNESS=0`, `PHASED_ENERGY_BEAM_PROJECTILES=1`, `PHASED_ENERGY_BEAM_FIRE_FORCE=32768`, `PHASED_ENERGY_BEAM_RELOAD=50`, `PHASED_ENERGY_BEAM_AIMSPEED=128`, `PHASED_ENERGY_BEAM_AIMARC=1024`, `PHASED_ENERGY_BEAM_PROJECTILE_ONDAMAGE_PARTICLES=1`, `MASS_DRIVER_ENERGY_USED=10`, `TORPEDO_ENERGY_USED=50`, `LASER_ENERGY_USED=50`, `BOMBLET_SPRAY_ENERGY_USED=50`, `PHASED_ENERGY_BEAM_ENERGY_USED=2`, `MACHINE_GUN_ENERGY_USED=2`, `SNIPER_CANNON_ENERGY_USED=50`, `MISSILE_LAUNCHER_ENERGY_USED=2`, `COUNTERMEASURE_LAUNCHER_ENERGY_USED=2`, `POINT_DEFENCE_LASER_ENERGY_USED=2`, `PHASED_ENERGY_BEAM_PULSETIME=30`, `PHASED_ENERGY_BEAM_PULSE_FADETIME=10`, `SHIELDS_DIRECTIONAL_IDLE_ENERGY_USAGE=1`, `SHIELDS_DAMAGE_ENERGY_CONVERSION=32` | EXTRACTED; consumer semantics may remain open |
| Grapple | `GRAPPLING_HOOKS_DAMAGEABLE_BY_SOURCE_PLAYER=0`, `PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER=4096`, `GRAPPLE_DEBRIS=0`, `GRAPPLING_HOOK_AIMSPEED=128`, `GRAPPLING_HOOK_AIMARC=1024`, `GRAPPLING_HOOK_MAX_LENGTH=65000`, `GRAPPLING_HOOK_MIN_LENGTH=128`, `GRAPPLING_HOOK_FIRE_FORCE=1600`, `GRAPPLING_HOOK_SPRING_CONSTANT=1000`, `GRAPPLING_HOOK_MAX_EXTENSION8_FORCE=1024`, `GRAPPLING_HOOK_COOLDOWN=50`, `GRAPPLING_HOOK_ROPE_CHANGE_RATE=4000`, `GRAPPLING_HOOK_ROPE_BREAK_LENGTH=131072` | EXTRACTED; consumer semantics may remain open |
| Shields | `SHIELDS_TOGGLE_COOLDOWN=25.0`, `SHIELDS_DIRECTIONAL_IDLE_ENERGY_USAGE=1`, `SHIELDS_DIRECTIONAL_RADIUS=32768`, `SHIELDS_DIRECTIONAL_ARC=1024`, `SHIELDS_DAMAGE_ENERGY_CONVERSION=32` | EXTRACTED; consumer semantics may remain open |
| Repair | `PEDROS_REPAIR_MODE=1`, `PEDROS_REPAIR_MODE_SWITCHTIME=50`, `SALVO_REPAIR_TIME_MULTIPLIER=1`, `REPAIR_MODE_COOLDOWN=2000`, `REPAIR_MODE_ACTIVE_TIME=250`, `REPAIR_MODE_RADIUS=4096`, `REPAIR_MODE_POWER=80`, `PLAYER_REPAIR_TIME=20`, `PLAYER_REPAIR_AMOUNT=256`, `AI_REPAIR_TIME=20`, `AI_REPAIR_AMOUNT=256`, `FIGHTER_REPAIR_TIME=1`, `FIGHTER_REPAIR_AMOUNT=-2` | EXTRACTED; consumer semantics may remain open |
| Mission/environment | `MAX_SHIP_SIZE=200`, `FIGHTERS_PER_PLAYER_MAXIMUM=20`, `ARMAGEDDON_LENGTH=60`, `MISSION_TERRAIN_DEBRIS_PROBABILITY=1`, `MISSION_DEBRIS_DEFAULT_PROBABILITY=10`, `MISSION_DEBRIS_VOTING_CHANCESTEP=25` | EXTRACTED; consumer semantics may remain open |
| Geometry/physics operator | `PHYSICS_COLLISION_FORCE_MULTIPLIER=4096`, `PHYSICS_COLLISION_GRAPPLING_HOOK_FORCE_MULTIPLIER=4096`, `PHYSICS_COLLISION_PHANTOM_FORCE_MULTIPLIER=2048`, `DEBRIS_DETACHMENT_FORCE_MULTIPLIER=256`, `ANGULAR_FORCE_DOWNSHIFT=4`, `TORQUE_DOWNSHIFT=4`, `MOMENT_OF_INERTIA_PREDIVIDE_DOWNSHIFT=12`, `MOMENT_OF_INERTIA_PERPOINT_CALC_DOWNSHIFT=8` | CODE_VERIFIED / engine-boundary input |
| Other gameplay/config inputs | `INNATE_THRUSTERS=1`, `AUTOAIM=0`, `SALVOAIM=1`, `FIXEDAIM=0`, `MASS_DRIVER_PROJECTILE_LIFE=100`, `TORPEDO_PROJECTILE_LIFE=500`, `BOMBLET_SPRAY_PROJECTILE_LIFE=25`, `SNIPER_CANNON_PROJECTILE_LIFE=50`, `MISSILE_LAUNCHER_PROJECTILE_LIFE=500`, `COUNTERMEASURE_LAUNCHER_PROJECTILE_LIFE=100`, `DEFAULT_FIRING_LEEWAY=256`, `SNIPER_CANNON_FIRING_LEEWAY=64`, `MASS_DRIVER_PROJECTILE_ONDAMAGE_PARTICLES=5`, `TORPEDO_PROJECTILE_ONDAMAGE_PARTICLES=5`, `SNIPER_CANNON_PROJECTILE_ONDAMAGE_PARTICLES=10`, `BOMBLET_SPRAY_PROJECTILE_ONDAMAGE_PARTICLES=5`, `EXPLOSION_PROJECTILE_ONDAMAGE_PARTICLES=0`, `POINT_DEFENCE_LASER_PROJECTILE_ONDAMAGE_PARTICLES=1`, `TORPEDO_ACCELERATION=6`, `SPINNING_BLADE_TOP_SPEED=256`, `SPINNING_BLADE_SPINUP_SPEED=4`, `WEAPON_PARTICLE_SPEED_DOWNSHIFT=4`, `WEAPON_PROJECTILE_SPEED_MULTIPLY=8`, `BOOSTERS_ACTIVE_TIME=500`, `COUNTERMEASURES_PULSE_RADIUS=131072` | EXTRACTED |

## 5. Core forensic subjects — rectified status

| Subject | Native/data status | Port status | Active work? |
|---|---|---|---|
| Component geometry / 56 slots|Fixed literal geometry substantially extracted; indirect/generated slots remain distinct. Slot 47 is 8-vertex **concave**, area 1206; older convex note superseded.|PARTIAL|YES — generated/indirect slots only|
| Mass|`wfb.u` shoelace-derived polygon area with integer clamp; component tree recursively sums mass.|CLOSED-IMPLEMENTATION / CODE_VERIFIED|NO|
| Center of mass|Mass-weighted final component positions; native fixed-point accumulation identified.|CLOSED-IMPLEMENTATION / CODE_VERIFIED|NO|
| Moment of inertia|Mass distributed across final-outline vertices; `ou.r=8`; relative squared-distance accumulation; recursive children; overflow clamp.|CLOSED-IMPLEMENTATION / CODE_VERIFIED|NO|
| Torque input operator|`ge.c=4`, `tua.a=4`; force-point cross-product accumulation; `wf.e=12` at angular accumulator consumption.|CLOSED-IMPLEMENTATION / CODE_VERIFIED|NO generic solver work|
| Native angle/trig encoding|8192 angular units/turn; trig scale 65536; native lookup table recovered.|CLOSED-IMPLEMENTATION / CODE_VERIFIED|NO|
| Velocity/damping engine behavior|Native values exist (`508/512`, angular sustain etc.), but generic integration belongs to replacement engine.|ENGINE-BOUNDARY / DO NOT REOPEN|NO|
| HP / health|`wfb.p` is native health quantity; `ml.a(int damage,...)` decrements recursively; exact lookup path remains distinct from area/mass.|PARTIAL / source data exists|YES — only exact lookup if port requires it|
| Hardpoints|Native hardpoint data recovered for portions; `ta` candidate filtering/projection still not universally closed.|PARTIAL|YES|
| Component collision selection|Gameplay hit must identify actual component; generic collision/impulse solver delegated to new engine.|PARTIAL|YES — selection only|
| Thruster values/bindings|Native magnitudes `16/192/1024`; operator/binding evidence exists; higher-level activation/autobalance and remaining consumer semantics not universally closed.|PARTIAL|YES|
| Weapons|190-row registry contains projectile counts/life, fire force, reload, aim, damage, energy, missile/blade/phased-beam values; behavior-class consumer closure varies by weapon.|PARTIAL|YES — consumer gaps only|
| Shield|Native values extracted: toggle cooldown 25, idle energy 1, radius 32768, arc 1024, damage→energy 32. Current corpus still contains an older blocked-forensics note and does not contain a newer source-backed closure artifact.|EXTRACTED; do not invent equations|YES only if newer closure evidence is added|
| Grapple|Native values extracted: aim 128, arc 1024, max length 65000, min length 128, fire force 1600, spring 1000, extension force 1024, cooldown 50, rope change 4000, break length 131072. Current corpus still has older lifecycle note saying exact equations/eligibility are open.|EXTRACTED; lifecycle implementation exists|YES only for any genuinely unresolved native semantics|
| Power/capacitor|Energy-use values are extracted for weapons; authoritative capacitor architecture exists. Exact remaining native consumer semantics are not uniformly source-closed.|PARTIAL|YES|
| Debris/detachment|Detach architecture and inherited kinematics are established; native `ml.DA` launch term exists, but caller scalar `n2` remains unresolved in current evidence.|PARTIAL|YES|
| Mission framework|Arena prototype is not the full MissionCondition/MissionAction framework; mission values exist but orchestration/timing semantics remain open.|PARTIAL|YES|
| Environment/terrain|Several native probabilities/counts are extracted; complete implementation semantics remain open.|PARTIAL|YES|
| Network/server authority|Architecture/authority migration is established; multiplayer server behavior is implementation scope, not native-number archaeology.|CLOSED-IMPLEMENTATION / separate implementation work|NO forensic reopening|
| Blueprint/structural authority|Canonical authority/transaction model established.|CLOSED-IMPLEMENTATION|NO|
| Projectile swept-hit architecture|Nearest swept hit + actual hit part established.|CLOSED-IMPLEMENTATION|NO|

## 6. Important supersessions / reconciliations

- **Slot 47:** old convex claim is superseded; dedicated geometry census says concave, 8 vertices, area 1206.
- **Native 235-key configuration:** namespace/default extraction is complete; the implementation-facing registry is a 190-row subset containing values relevant to gameplay/engine input. Do not confuse “235-key namespace” with “235 engine-input rows.”
- **Mass/COM/inertia:** prior dependency-map notes saying these were RAW-GAP are superseded by `35_JAR_BYTECODE_PHYSICS_VERIFICATION.md` and the consolidated closure.
- **Generic physics integration:** caller divisor/timestep archaeology is no longer a port blocker because the replacement 2D engine owns integration. Preserve native values that cross the engine boundary; do not reverse-engineer solver internals.
- **Grapple/shield:** the current file corpus has extracted values but older notes still label some native semantics unresolved. A chat-level closure not written into project evidence is not allowed to silently overwrite the file record; when a newer closure artifact is created, update this row and the registry in place.

## 7. Duplicate workstreams merged

- Body recompute: `25_BODY_RECOMPUTE_MIGRATION`, `29_BODY_RECOMPUTE_AUTHORITY_MIGRATION`, `30_STRUCTURAL_RECOMPUTE_TRANSACTION` → one closed architecture/native-property stream.
- Structural replacement/blueprints: four migration/transaction notes → one structural authority stream.
- Projectile/hit: five migration/handoff notes → one BallisticsEngine stream.
- Thruster operator/binding: two native notes → one thruster forensic stream.
- Debris/detachment: five notes → one debris stream.
- Audit ledgers: foundation/super/runtime/reconciliation/semantic notes → historical evidence feeding this master.

## 8. File-by-file rectification audit

Every forensic file present in either the older DarkWing project snapshot or the current consolidated tree is listed below. The disposition is the master’s instruction for how future agents should use it.

| File | Disposition |
|---|---|
| `00_DEFINITIVE_ORIGINAL_JAR.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `00_FORENSIC_ENGINEER_BLUEPRINT.md` | REFERENCE — retain; status controlled by master |
| `00_RAW_FORENSIC_REFERENCE.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `00_SOURCE_INDEX.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `01_GAME_STRUCTURE_INVENTORY.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `02_BASELINE_GAMEPLAY_LOOP.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `03_NETWORK_RPC_MANIFEST.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `04_DIRECTIVES_AND_CHANGELOG.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `06_FOUNDATION_AUDIT.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `07_SUPER_AUDIT.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `08_RUNTIME_AUDIT_ACTIONS.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `09_AUTHORITY_CENSUS.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `10_ROBLOX_LUAU_REFERENCE.md` | GOVERNING REFERENCE — use for authority/rules/context |
| `11_RAW_RECONCILIATION.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `12_NATIVE_SEMANTIC_EXTRACTION_STATUS.md` | REFERENCE — retain; status controlled by master |
| `12_WEAPON_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `13_COMPONENT_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `13_SOCKET_GRAPH_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `14_STRUCTURAL_REPLACEMENT_MIGRATION.md` | REFERENCE — retain; status controlled by master |
| `15_BLUEPRINT_BUILD_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `16_COMBAT_RESOURCE_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `17_PHYSICS_DETACH_KINEMATICS_MIGRATION.md` | REFERENCE — retain; status controlled by master |
| `18_DEBRIS_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `19_RAW_PHYSICS_OPERATOR_RECOVERY.md` | REFERENCE — retain; status controlled by master |
| `20_NATIVE_DEBRIS_KINEMATICS_MIGRATION.md` | REFERENCE — retain; status controlled by master |
| `21_FORENSIC_PROVENANCE_CORRECTION.md` | REFERENCE — retain; status controlled by master |
| `21_NATIVE_DEBRIS_LAUNCH_MAPPING.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `22_MISSION_FRAMEWORK_MIGRATION.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `23_NETWORK_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `23_RESOURCE_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `24_PROJECTILE_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `24_WEAPON_RESOURCE_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `25_BALLISTICS_HIT_RESOLUTION_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `25_BODY_RECOMPUTE_MIGRATION.md` | REFERENCE — retain; status controlled by master |
| `26_BALLISTIC_WEAPON_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `26_COMPONENT_DEFINITION_VALIDATION.md` | REFERENCE — retain; status controlled by master |
| `27_PROJECTILE_HIT_AUTHORITY_HANDOFF.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `27_ROBLOX_COMBAT_TYPE_ALIGNMENT.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `28_HIT_RESOLUTION_HANDOFF.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `29_BLUEPRINT_TRANSACTION_HANDOFF.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `29_BLUEPRINT_TRANSACTION_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `29_BODY_RECOMPUTE_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `29_COMPONENT_PARENT_CHILD_INTEGRITY.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `29_GRAPPLE_ROBLOX_LIFECYCLE_MIGRATION.md` | REFERENCE — retain; status controlled by master |
| `29_NATIVE_THRUSTER_OPERATOR_RECOVERY.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `29_ROBLOX_API_HYGIENE.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `30_BLOCKED_SHIELD_FORENSICS.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `30_NATIVE_THRUSTER_BINDING_RECOVERY.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `30_REPAIR_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `30_RUNTIME_TOPOLOGY_AUTHORITY_MIGRATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `30_STRUCTURAL_RECOMPUTE_TRANSACTION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `31_BLUEPRINT_PRIMITIVE_SERIALIZATION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `31_COMPONENT_56_SLOT_RECONCILIATION.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `31_STRUCTURAL_REPLACEMENT_TRANSACTION.md` | HISTORICAL / IMPLEMENTATION-CLOSED — retain identifiers, do not reopen |
| `32_NATIVE_COMPONENT_SLOT_MATRIX.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `33_NATIVE_COMPONENT_PROVENANCE.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `33_NATIVE_PHYSICS_CONFIG_RECONCILIATION.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `34_NATIVE_WEAPON_PARAMETER_CONTRACT.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `34_PHYSICS_SOURCE_DEPENDENCY_MAP.md` | ACTIVE FORENSIC EVIDENCE — reconcile into master before use |
| `35_JAR_BYTECODE_PHYSICS_VERIFICATION.md` | REFERENCE — retain; status controlled by master |
| `DEFINITIVE_VALUES/235_NATIVE_DEFAULTS_ATTESTATION.md` | CANONICAL EVIDENCE — native defaults/value extraction |
| `DEFINITIVE_VALUES/FULL_JAR_ANALYSIS.md` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/JAR_CENSUS.md` | CANONICAL EVIDENCE — raw/semantic census; query, do not reread wholesale |
| `DEFINITIVE_VALUES/JAR_CENSUS_STATS.json` | CANONICAL EVIDENCE — raw/semantic census; query, do not reread wholesale |
| `DEFINITIVE_VALUES/JAR_SEMANTIC_CLASS_INDEX.csv` | CANONICAL EVIDENCE — raw/semantic census; query, do not reread wholesale |
| `DEFINITIVE_VALUES/JAR_SEMANTIC_DOMAIN_MAP.md` | CANONICAL EVIDENCE — raw/semantic census; query, do not reread wholesale |
| `DEFINITIVE_VALUES/NATIVE_COMPONENT_HP_OPERATOR.md` | CANONICAL EVIDENCE — HP operator |
| `DEFINITIVE_VALUES/NATIVE_CONFIGURATION_RESOLUTION.md` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/NATIVE_ENGINE_INPUT_REGISTRY.csv` | CANONICAL — implementation-facing native input registry |
| `DEFINITIVE_VALUES/NATIVE_VALUE_SWEEP_2026-08-28.md` | CANONICAL EVIDENCE — latest native-value sweep |
| `DEFINITIVE_VALUES/RAW_CENSUS_PROVENANCE.md` | CANONICAL EVIDENCE — raw/semantic census; query, do not reread wholesale |
| `DEFINITIVE_VALUES/README.md` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/SOURCE_MANIFEST.txt` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/component_56_slots.csv` | CANONICAL EVIDENCE — component geometry/slot ledger |
| `DEFINITIVE_VALUES/full_jar_semantic_census.md` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/native_class_inventory.csv` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/native_configuration_values.csv` | CANONICAL EVIDENCE — native defaults/value extraction |
| `DEFINITIVE_VALUES/native_numeric_literals.csv` | EVIDENCE — retain; not an independent work queue |
| `DEFINITIVE_VALUES/semantic_class_index_v2.csv` | EVIDENCE — retain; not an independent work queue |
| `FORENSIC_MASTER.md` | CANONICAL CONTROL |
| `FORENSIC_README.md` | CANONICAL CONTROL |
| `FORENSIC_VARIABLE_REGISTRY.csv` | REFERENCE — retain; status controlled by master |
| `MIGRATION_RESIDUE_REPORT.md` | HISTORICAL AUDIT — findings reconciled here; not an active queue by itself |
| `MISSION_SYMBOL_INDEX.md` | REFERENCE — retain; status controlled by master |
| `ORIGINAL_JAR/PREPROCESSING_01_06/DECOMPILED_SOURCE_HANDOFF.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/DECOMPILER_HANDOFF.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/BYTECODE_OPCODE_FREQUENCY.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/CLASS_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/FIELD_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/FIELD_REFERENCE_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/INDEX_MANIFEST.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/METHOD_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/METHOD_REFERENCE_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/PACKAGE_INDEX.tsv` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/SOURCE_EVIDENCE_LEDGER.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/INDEX/STRING_LITERAL_INDEX.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/README.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/SHA256.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/STEP_01_06_MANIFEST.md` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/classes.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/file-list.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.sha256` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-status.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/anb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/aqa.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/ara.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/ecb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/faa.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/fnb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/hab.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/imb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/lja.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/lsb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/ml.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/nbb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/ou.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/pe.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/qjb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/rrb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/sfa.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/ta.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/tj.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wfb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wlb.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/relevant-classes.txt` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/unpacked-classfiles.tar.gz` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/PREPROCESSING_01_06/voidhunters-original.jar` | IMMUTABLE EVIDENCE — JAR/javap/index preprocessing |
| `ORIGINAL_JAR/wlb.java` | EVIDENCE — retain; not an independent work queue |
| `ORIGINAL_JAR/wlb.javap.txt` | EVIDENCE — retain; not an independent work queue |

## 9. Active forensic queue

### P0 — native/gameplay inputs only
1. Complete indirect/generated component slots required by implementation.
2. Complete native hardpoint filtering/projection where required for exact attachment/weapon/thruster placement.
3. Resolve exact component-to-polygon gameplay damage selection.
4. Resolve exact HP lookup semantics if port requires native HP parity.
5. Finish thruster caller/binding semantics and native gameplay magnitudes.
6. Finish weapon consumer semantics for any registry values not yet source-closed.
7. Finish power/energy consumer semantics where native behavior remains unresolved.
8. Reconcile any genuinely unresolved grapple/shield native semantics only from current source evidence.
9. Resolve `ml.DA` debris-launch caller scalar `n2` and remaining gameplay launch parameters.

### P1 — game systems
10. MissionCondition/MissionAction orchestration and timing.
11. Debris lifetime/cleanup/persistence.
12. Environment/terrain behavior and exact native parameters needed by implementation.

## 10. Explicitly out of forensic scope

- Generic rigid-body integration/solver internals.
- Generic collision manifold/impulse resolution.
- Generic damping implementation.
- Generic polygon collision mathematics.
- Replacement-engine constraint/rope solver internals.
- Reconstructing Java class architecture when the new engine only needs a numerical input.

## 11. Agent operating procedure

1. Search this master first.
2. If closed, apply it; do not reopen.
3. If partial/extracted, jump directly to named source classes and evidence indexes.
4. Preserve native variable/class names in `FORENSIC_VARIABLE_REGISTRY.csv` even when prose notes are culled.
5. Update this master and the canonical registry in the same forensic pass.
6. Mark conflicting older claims `SUPERSEDED`; never delete the evidence needed to establish provenance.
7. Do not create parallel value tables.

## 12. Canonical evidence locations

- Native numeric registry: `DEFINITIVE_VALUES/NATIVE_ENGINE_INPUT_REGISTRY.csv`
- Native defaults: `DEFINITIVE_VALUES/native_configuration_values.csv`
- Component slots: `DEFINITIVE_VALUES/component_56_slots.csv`
- HP operator: `DEFINITIVE_VALUES/NATIVE_COMPONENT_HP_OPERATOR.md`
- Latest value sweep: `DEFINITIVE_VALUES/NATIVE_VALUE_SWEEP_2026-08-28.md`
- Physics bytecode verification: `35_JAR_BYTECODE_PHYSICS_VERIFICATION.md`
- Raw bytecode: `ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.txt`
- Targeted bytecode: `ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/`
- Stack/local dataflow: external `VoidHunters-JVM-Stack-Local-Dataflow(1).zip` evidence layer.

**Rectification rule:** This master supersedes the status claims of historical notes, but never supersedes direct JAR evidence. If a file contains a newer source-backed closure than this master, the master must be updated immediately rather than treating that file as a parallel queue.
## 2026-08-28 canonical reading layer
For efficient future forensic work, use `CANONICAL/` first. `CANONICAL/SYSTEMS/` merges overlapping workstreams; `CANONICAL/VALUES/` contains implementation-facing tables. `ARCHIVE/DUPLICATE_WORKSTREAMS/` preserves the original reports for provenance but is not an active queue. `ORIGINAL_JAR/PREPROCESSING_01_06/` remains immutable evidence. Do not investigate generic replacement-engine internals.
