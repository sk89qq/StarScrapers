# Canonical Shields — Current Snapshot

**Effective:** 2026-08-28 15:xx CDT

## Native inputs
The implementation-facing shield inputs are sourced only through `src/roblox/ReplicatedStorage/Shared/Combat/NativeShieldBoundary.luau`, which reads `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv`.

- toggle cooldown: 25 native ticks
- directional idle energy usage: 1 native energy/tick
- directional radius: 32768 native distance units
- directional arc: 1024 native angle units
- damage-to-energy conversion: raw damage / 32

## Runtime authority
`ServerScriptService/VoidHunters/VoidHunterShieldSystem.luau` is the server-side shield state authority. `VoidHunterWeaponController` delegates shield absorption to it; it no longer owns a second shield model.

Explicit component data (`ShieldOutput`, `MinEnergyToActivate`) may define the assembled shield energy pool/activation threshold. No default max energy, regeneration rate, reboot delay, damage-type modifier, or fallback native radius is synthesized.

## Toggle / consumption semantics
Shield toggle cooldown is enforced from the native value. Active shields consume the native idle energy amount on the recovered native 50-ticks/second cadence. Damage consumes shield energy using the native `/32` conversion. When energy is exhausted the shield deactivates; no inferred automatic regeneration/reboot path is present.

## Verification status
**Evidence:** recovered native inputs; current runtime semantics implemented.
**Port:** required native semantics are implemented.
**Implementation:** IMPLEMENTED; runtime acceptance verification remains separate.
