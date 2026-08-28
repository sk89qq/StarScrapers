# Phase D Closure — Debris

**Date:** 2026-08-28
**Repository:** `sk89qq/StarScrapers`
**Status:** IMPLEMENTED / COMMITTED

## Scope

Phase D writes the recovered native debris launch inputs through an explicit implementation-facing boundary. It does not invent native cleanup timing or reconstruct generic rigid-body behavior.

## Launch

- `NativeDebrisBoundary.luau` is the implementation-facing native debris input boundary.
- `DEBRIS_DETACHMENT_FORCE_MULTIPLIER=256` is supplied as the native launch scale.
- `COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER=32768` remains available as the recovered breaking/explosion input.
- `NativeDebrisPhysics.ComputeLaunch` performs the recovered launch calculation: `launchScale * debrisMass / offsetLength`.
- Native launch angle uses the recovered 8192-unit turn domain and unbiased integer random helper over `[0,199]`.
- `VoidHunterDebrisManager` consumes the boundary and records the recovered launch result rather than maintaining another native constant table.

## Cleanup

- `DEBRIS_SURVIVES=1` is preserved as a native persistence/enablement input.
- The previous hard-coded 30-second cleanup value was removed because current evidence does not establish a native cleanup duration.
- Collection remains a game-layer lifecycle action.

## Boundary

Generic rigid-body integration, force application, and Roblox-unit conversion remain replacement-engine responsibilities. No arbitrary Newton/stud conversion is introduced by Phase D.

## Queue impact

The native debris launch implementation item is closed. Cleanup timing remains explicitly unestablished and therefore is not promoted to a native fact.
