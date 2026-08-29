# Weapon Timing Resolution — Definitive

## Clock

The base weapon cooldown/state-counter layer runs at the authoritative **30 Hz simulation cadence**.

- 30 ticks = 1 second
- 1 tick = 33.333... ms

## Native gameplay duration unit

Separately, native `l` timing is definitive at **1l = 1 second**. `N*l` values therefore represent `N` seconds and may be scheduled through the 30 Hz simulation cadence.

## Weapon field semantics — definitive

`AIMSPEED` is an **angular aiming/traverse speed**, not a fire-rate/reload clock.

`AIMARC` is the corresponding angular aiming envelope/limit.

The recovered weapon set provides the behavioral proof: every module with `AIMSPEED = 0` is a **non-pivoting/fixed weapon module**, while pivoting weapon modules have nonzero `AIMSPEED` values.

`RELOAD` is the weapon re-arm/cooldown input and is resolved against the recovered canonical gameplay timings below. It is not necessary to invent a second reload clock: the authoritative 30-Hz simulation cadence is the base timer cadence, and known real-world timings identify the corresponding state duration.

### Canonical reload timing anchors

- **Bomblet Spray:** `RELOAD=50` → **0.8 s / 24 simulation ticks**.
- **Torpedo:** `RELOAD=200` → **3.0 s / 90 simulation ticks**.
- **Laser:** `RELOAD=0` → **continuous firing state**; observed firing interval is governed by its continuous pulse/recovery behavior rather than a positive reload counter.
- **Machine Gun:** `RELOAD=30` → **1.0 s** canonical reload state.
- **Sniper Cannon:** `RELOAD=100` → **3.3333 s** when consumed directly as a 30-Hz counter.
- **Fighter Bay:** `RELOAD=1500` → **50.0 s** when consumed directly as a 30-Hz counter.
- **PEB:** `RELOAD=50` → **0.8 s / 24 simulation ticks** when using the same recovered state convention as Bomblet.
- **PDL:** `RELOAD=50` → **0.8 s / 24 simulation ticks** when using the same recovered state convention.

These are **resolved port timings**, not claims that every raw `RELOAD` integer is itself the final counter. Where the native field and observed state use different representations, the port records the resolved gameplay duration/state count.

## Pulse semantics

`PULSETIME` is a pulse-state duration used by pulse-based systems (including the Scrambler/PEB family), not a universal reload clock.

`PULSE_FADETIME` is the corresponding fade state and remains separate from reload and aim traversal.

## Definitive cooldown observations

- Bomblet Spray cooldown state: **24 ticks = 0.8 seconds**.
- Missile Launcher cooldown state: **120 ticks = 4.0 seconds**.
- Laser continuous firing burst: **1.5 seconds observed**.
- Laser recovery/cooldown: **2.0 seconds observed**.
- Torpedo reload: **3.0 seconds / 90 ticks**.

## Derived 30-Hz values

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

## Port implementation rule

Use the recovered canonical **gameplay duration/state count** for each weapon rather than treating the raw configuration integer as a universal unit. All resulting timer states advance on the common 30-Hz simulation cadence.
