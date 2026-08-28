# Base Simulation Clock — Definitive

## Authority

The original Void Hunters base simulation/cooldown timer operates at **30 ticks per second**.

**1 simulation tick = 1/30 second = 33.333... ms.**

## Empirical calibration anchors

- Bomblet Spray cooldown state: **24 ticks = 0.8 s**.
- Missile Launcher cooldown state: **120 ticks = 4.0 s**.
- Both independently establish the same **30 ticks/second** ratio.

## Relationship to the native gameplay timer

The game uses the 30 Hz simulation cadence as the underlying update loop. The native gameplay unit `l` is a separate **gameplay duration representation**, not a second independently running wall clock.

- `l` timing: **1l = 1.0 s**.
- Base simulation cadence: **30 Hz**.
- Therefore a duration represented as `N*l` can be realized over **30N simulation ticks** when scheduled through the base tick loop.

This distinction matters: `l` is a semantic/gameplay timing unit, while 30 Hz is the cadence at which simulation state is updated. They must not be treated as competing clocks or as evidence of separate weapon/game threads.

## Weapon timing scope

Weapon cooldowns and firing state can be represented by counters advanced by the common 30 Hz simulation loop. Weapon configuration fields such as `RELOAD`, `AIMSPEED`, `PULSETIME`, and `PULSE_FADETIME` are **not interchangeable** with the cooldown counter and must be traced through their consumer/assignment path.

The observed cooldown-state values above are timer-array/counter values, not necessarily the raw values stored in weapon configuration records.

## Implementation rule

Use 30 Hz only for counters proven to belong to the base simulation/cooldown timer layer. Use the calibrated `l` boundary for native `N*l` gameplay durations. Do not introduce a 0.02-second / 50 Hz interpretation for `l`.
