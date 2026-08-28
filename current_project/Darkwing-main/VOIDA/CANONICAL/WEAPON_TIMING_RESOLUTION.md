# Weapon Timing Resolution — Definitive

## Clock

The base weapon cooldown/state-counter layer runs on the authoritative **30 Hz simulation cadence**.

- 30 ticks = 1 second
- 1 tick = 33.333... ms

## Native gameplay duration unit

Separately, native `l` timing is definitive at **1l = 1 second**. `N*l` values therefore represent `N` seconds and may be scheduled through the 30 Hz simulation cadence.

## Weapon field semantics — definitive

`AIMSPEED` is an **angular aiming/traverse speed**, not a fire-rate/reload clock.

`AIMARC` is the corresponding angular aiming envelope/limit.

The recovered weapon set provides the behavioral proof: every module with `AIMSPEED = 0` is a **non-pivoting/fixed weapon module**, while pivoting weapon modules have nonzero `AIMSPEED` values. Therefore `AIMSPEED = 0` means no weapon pivot/traverse, rather than zero shots-per-second.

The native angular representation is standardized and the values are represented in the established fixed-point/angular scale. Do not reinterpret `AIMSPEED` as another time unit.

`RELOAD` remains the weapon re-arm/cooldown input and is separate from `AIMSPEED`.

`PULSETIME` and `PULSE_FADETIME` remain pulse-state inputs and are separate from both reload and aim traversal.

## Definitive cooldown observations

- Bomblet Spray cooldown state: **24 ticks = 0.8 seconds**.
- Missile Launcher cooldown state: **120 ticks = 4.0 seconds**.
- Laser continuous firing burst: **1.5 seconds observed**.
- Laser recovery/cooldown: **2.0 seconds observed**.
- Torpedo reload/observed cooldown: **3.0 seconds observed**.

The first two establish the common 30 Hz counter-to-time conversion. The latter observations are behavioral anchors; their native assignment paths remain separate from the clock definition.

## Field-to-timer rule

The correct architecture is:

`native weapon configuration -> weapon state/timer assignment -> 30 Hz simulation counter -> elapsed time`

Do not assume the raw integer stored in `RELOAD` is itself the final cooldown counter. The native consumer/assignment may transform it first.

## Derived 30 Hz values

For any value proven to be a base simulation timer counter:

`seconds = ticks / 30`

- 15 ticks = 0.5 s
- 24 ticks = 0.8 s
- 30 ticks = 1.0 s
- 45 ticks = 1.5 s
- 60 ticks = 2.0 s
- 90 ticks = 3.0 s
- 120 ticks = 4.0 s
- 150 ticks = 5.0 s
