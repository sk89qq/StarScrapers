# Phase F Closure — Thruster Native Boundary

**Date:** 2026-08-28
**Repository:** `sk89qq/StarScrapers`
**Status:** IMPLEMENTED / COMMITTED

## Scope

Phase F moves recovered thruster gameplay inputs behind an explicit implementation-facing boundary. It does not reconstruct generic rigid-body integration or invent a native resource cost that is not present in the canonical value set.

## Native inputs

- `NativeThrusterBoundary.luau` is the implementation-facing native thruster input boundary.
- Recovered force scales are consumed through `NativeThrusterOperator`: component `12` / Small = `16`, component `13` / Main = `192`, component `46` / Booster = `1024` native units.
- `INNATE_THRUSTERS=1` and `THRUSTER_AUTOBALANCING=1` are exposed as native gameplay flags.
- `THRUSTER_BINDING_MOVE_AND_TURN_HAS_OPPOSITE_MOVE=1` and `THRUSTER_BINDING_BALANCE_THRESHOLD=8` are exposed by the boundary.

## Consumer cleanup

- `Thruster.luau` now consumes `NativeThrusterBoundary` instead of maintaining invented Newton/stud defaults (`450/250/850`) and invented energy-drain rates.
- No native thruster energy-consumption value is promoted from absence of evidence. Resource accounting remains a separate open consumer concern.
- `ThrusterBindingSolver` remains the source-shaped binding classifier and is not replaced with a generic approximation.

## Verification

**IMPLEMENTED, not ACCEPTANCE-VERIFIED.** Runtime acceptance must still exercise activation, binding, and representative force-output cases against the recovered native behavior.

## Queue impact

The thruster native input/force boundary is closed for implementation migration. Remaining work is activation/binding acceptance and any separately evidenced power/resource consumer semantics.
