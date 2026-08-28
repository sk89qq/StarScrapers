# Phase G Closure — Power / Resource Consumer Boundary

**Date:** 2026-08-28
**Repository:** `sk89qq/StarScrapers`
**Status:** IMPLEMENTED / COMMITTED

## Scope
Phase G establishes the implementation-facing power/resource consumer boundary without fabricating source-specific equations that are not recovered.

## Current implementation
- `CapacitorSystem.luau` is the authoritative per-ship runtime capacitor object.
- Ship registration is keyed by the ship `Model`; component identity is read from explicit `ComponentType` metadata and `VoidHunterComponents.Types`.
- Resource consumption is centralized through `Consume`, with bounded recharge/drain operations and energy state exposed to the ship through attributes.
- Weapon/resource native values remain sourced from the canonical native-value layer rather than duplicated numeric namespaces.

## Forensic boundary
The recovered canonical native table establishes weapon energy-use values (for example `MASS_DRIVER_ENERGY_USED=10`, `TORPEDO_ENERGY_USED=50`, `LASER_ENERGY_USED=50`, and the remaining weapon-specific entries), but it does not establish a native thruster energy-consumption constant. No thruster cost is therefore invented.

`CapacitorSystem` retains explicit implementation-status language where its generic defaults/equations are not yet source-verified. Replacement-engine physics remains out of forensic scope.

## Verification
**IMPLEMENTED, not ACCEPTANCE-VERIFIED.** Runtime acceptance still needs source-backed tests covering registration, capacity/regen calculation, consumption rejection at insufficient energy, recharge, and integration with weapon/thruster consumers.

## Queue impact
Power/resource state now has a single runtime authority and implementation boundary. Remaining P0 work is exact native consumer semantics/acceptance verification, not another parallel capacitor implementation.
