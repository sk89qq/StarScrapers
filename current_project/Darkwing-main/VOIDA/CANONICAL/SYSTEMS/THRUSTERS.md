# Canonical Thrusters — Current Snapshot

**Effective:** 2026-08-28 21:40 UTC

## Current native input set
Thruster magnitudes, binding/autobalance values, and movement-specific native inputs.

## Phase F implementation boundary
- `NativeThrusterBoundary.luau` is now the sole implementation-facing adapter for recovered thruster gameplay inputs.
- Recovered force scales are consumed through `NativeThrusterOperator`: small `16`, main `192`, booster `1024` native units.
- Native component mapping is explicit: component types `12`, `13`, and `46` map to Small/Main/Booster.
- `INNATE_THRUSTERS=1`, `THRUSTER_AUTOBALANCING=1`, `THRUSTER_BINDING_MOVE_AND_TURN_HAS_OPPOSITE_MOVE=1`, and balance threshold `8` are exposed by the boundary.
- `Thruster.luau` no longer invents Newton/stud force defaults or per-second energy-drain values.
- `ThrusterBindingSolver` remains the source-shaped binding classifier; generic force/torque integration remains engine-owned.

## Resource boundary
No native thruster energy-consumption constant is established by the recovered canonical value set. Phase F therefore does not fabricate one; resource accounting remains a separate open consumer concern.

## Authority
Values: `CANONICAL/VALUES/THRUSTERS.csv`. The single numeric authority is `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv`.

## Verification
**IMPLEMENTED, not ACCEPTANCE-VERIFIED.** Runtime acceptance still requires exercising activation, binding, and force-output cases against the recovered source behavior.
