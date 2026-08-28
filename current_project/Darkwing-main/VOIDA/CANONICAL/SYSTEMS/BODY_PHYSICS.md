# Canonical Body Physics — Port Inputs

Status is scoped to what DarkWing must feed a replacement 2D engine. Generic solver/integration internals are out of scope.

## CLOSED-FOR-PORT
- Component mass derivation from native polygon geometry.
- Body center-of-mass aggregation from component masses and final positions.
- Native moment-of-inertia model and verified fixed-point constants.
- Torque input constants: `ge.c=4`, `tua.a=4`, `ou.r=8`, `wf.e=12`.
- Native angle domain: 8192 units/turn; trig table scale 65536.

## RECOVERED NATIVE INPUTS
See `DEFINITIVE_VALUES/NATIVE_ENGINE_INPUT_REGISTRY.csv` and `native_configuration_values.csv` for canonical numeric rows.

## OPEN PORT-RELEVANT ITEMS
- Exact game-specific velocity limits/consumer values where the replacement engine needs explicit caps.
- Collision/ram gameplay coefficients only where they affect game behavior rather than generic collision resolution.
- Any native force magnitude whose producer-to-gameplay mapping remains unresolved.

## EVIDENCE
Raw bytecode and targeted dumps remain under `ORIGINAL_JAR/PREPROCESSING_01_06/`; archived physics reports are preserved under `ARCHIVE/DUPLICATE_WORKSTREAMS/`.
