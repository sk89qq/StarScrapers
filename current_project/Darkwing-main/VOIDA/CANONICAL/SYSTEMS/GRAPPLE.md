# Canonical Grapple — Current Snapshot

**Effective:** 2026-08-28 15:xx CDT

## Native inputs
The implementation-facing grapple inputs are sourced only through `src/roblox/ReplicatedStorage/Shared/Combat/NativeGrappleBoundary.luau`, which reads `CANONICAL/VALUES/NATIVE_ENGINE_INPUTS.csv`.

The boundary covers aim speed/arc, cooldown, fire force, spring constant, maximum-extension force, maximum/minimum length, rope-change rate, rope-break length, debris mode, grappling-hook collision force multiplier, and source-player damageability.

## Runtime authority
`Shared/Combat/GrappleSystem.luau` consumes the canonical boundary by default. `ServerScriptService/VoidHunterPvPSystems.luau` no longer maintains a private grapple implementation or guessed constants; it creates and steps `GrappleSystem` instances with `NativeGrappleBoundary.GetConfig()`.

The native values remain raw inputs. Generic Roblox rope/constraint behavior is not treated as native forensic logic, and no unsupported raw-to-Roblox force conversion is invented.

## Lifecycle
Fire/cooldown, target acquisition, attach, reel/retract, break-length handling, detach, and cleanup are centralized in `GrappleSystem`.

## Verification status
**Evidence:** native values recovered.
**Port:** native configuration boundary and lifecycle integration implemented.
**Implementation:** IMPLEMENTED; runtime acceptance verification remains separate.
