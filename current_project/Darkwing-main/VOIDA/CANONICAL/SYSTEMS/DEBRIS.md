# Canonical Debris

## RECOVERED
- Native detach/structural behavior and parent-state transfer are established.
- Debris launch path and native angle/random helpers are recovered.
- `DEBRIS_DETACHMENT_FORCE_MULTIPLIER=256` is the implementation-facing launch scale.
- `COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER=32768` is a recovered native input for breaking/explosion behavior.
- Native launch computation is implemented through `NativeDebrisPhysics` and consumes the native detach-force multiplier through `NativeDebrisBoundary`.
- Native launch angle uses the recovered 8192-unit turn domain and unbiased `[0,199]` random helper.

## CLEANUP
- `DEBRIS_SURVIVES=1` is treated as a native persistence/enablement input.
- The former hard-coded 30-second cleanup value has been removed because no native cleanup timing is established by the current evidence.
- Collection remains an explicit game-layer lifecycle action.

## IMPLEMENTATION STATUS
- Launch input boundary: IMPLEMENTED.
- Native launch calculation: IMPLEMENTED.
- Roblox body integration/unit conversion: delegated to the replacement physics layer.
- Native cleanup timing: NOT ESTABLISHED; no invented value is used.

Generic rigid-body behavior is delegated to the replacement engine.
