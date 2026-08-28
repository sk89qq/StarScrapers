# Native Value Sweep — 2026-08-28

## Scope
Full sweep of the consolidated forensic tree and canonical native configuration table, restricted to values that DarkWing may need to feed into the replacement 2D engine or implement as game-specific mechanics. Generic rigid-body solver equations are explicitly excluded.

## Canonical sources
- `DEFINITIVE_VALUES/native_configuration_values.csv` — 235-key source-extracted native configuration namespace.
- `DEFINITIVE_VALUES/component_56_slots.csv` — native component geometry slot authority.
- `35_JAR_BYTECODE_PHYSICS_VERIFICATION.md` — verified mass/COM/inertia/torque source evidence.
- `29_NATIVE_THRUSTER_OPERATOR_RECOVERY.md` / `30_NATIVE_THRUSTER_BINDING_RECOVERY.md` — native thruster inputs and angle/trig data.
- `21_NATIVE_DEBRIS_LAUNCH_MAPPING.md` — native debris launch dependency chain.

## Reconciliation result
The sweep found no second independent numeric configuration universe that should be merged with the canonical 235-key table. Earlier notes repeat or rename many of these same values. The canonical CSV is therefore the single configuration-value source of truth.

## Native values now reintegrated into implementation-facing source
- `src/roblox/ReplicatedStorage/Shared/Combat/NativeGameplayConfig.luau` — source-extracted native gameplay/physics values.
- `src/roblox/ReplicatedStorage/Shared/Combat/NativeWeaponConfig.luau` — weapon contracts now resolve their numeric native payloads from `NativeGameplayConfig`.
- `src/roblox/ReplicatedStorage/Shared/Physics/PhysicsConfig.luau` — native physics input layer remains separated from Roblox execution mappings.

## Explicitly not investigated
Generic rigid-body integration, collision impulse resolution, damping implementation, angular integration, and other solver internals belong to the replacement 2D engine. Native constants are retained only when they define a game-side input or a documented native boundary.

## Still genuinely open after the sweep
1. `ml.DA` exact caller-side debris-property mapping (`n2` and destruction-context values).
2. Indirect/generated component slots and final hardpoint projection/filter semantics.
3. Native weapon consumer semantics where a configuration key exists but the consumer determines additional formulas/conditions.
4. Shield consumer equation/control flow.
5. Power/energy consumer equations.
6. Grapple target eligibility/consumer semantics.
7. Mission/environment values only where implementation needs exact behavior.

## Important status rule
A source-extracted configuration value is not automatically a verified runtime consumer mapping. Numeric payloads are authoritative as extracted native defaults; consumer semantics remain open until directly traced.
