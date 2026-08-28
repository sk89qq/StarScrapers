# Base Simulation Clock — Definitive

## Authority

The original Void Hunters base simulation/cooldown timer operates at **30 ticks per second**.

**1 simulation tick = 1/30 second = 33.333... ms.**

## Empirical calibration anchors

- Bomblet Spray cooldown state: **24 ticks = 0.8 s**.
- Missile Launcher cooldown state: **120 ticks = 4.0 s**.
- Both independently establish the same **30 ticks/second** ratio.

## Scope

This is a separate clock from the native gameplay timing unit `l`.

- `l` timing: **1l = 1.0 s**.
- Base simulation timer: **30 Hz**.

Do not convert weapon `RELOAD`, `AIMSPEED`, or other raw configuration fields directly using either clock until the native consumer/counter path establishes which clock and transformation the field uses.

The cooldown-state values above are timer-array/counter values, not necessarily the raw values stored in weapon configuration records. In particular, raw weapon `RELOAD` values must remain distinct from observed cooldown-state counters until their assignment path is traced.

## Implementation rule

Use 30 Hz only for counters proven to belong to the base simulation/cooldown timer layer. Do not replace the authoritative `l` conversion with 30 Hz.
