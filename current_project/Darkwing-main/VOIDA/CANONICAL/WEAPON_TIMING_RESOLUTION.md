# Weapon Timing Resolution — Definitive

## Clock

The base weapon cooldown/state-counter layer runs on the authoritative **30 Hz simulation cadence**.

- 30 ticks = 1 second
- 1 tick = 33.333... ms

## Empirical definitive anchors

- Bomblet Spray cooldown state: **24 ticks = 0.8 seconds**.
- Missile Launcher cooldown state: **120 ticks = 4.0 seconds**.

These establish the common 30 Hz counter-to-time conversion.

## Native gameplay duration unit

Separately, native `l` timing is definitive at **1l = 1 second**. `N*l` values therefore represent `N` seconds and may be scheduled through the 30 Hz simulation cadence.

## Resolved weapon timing observations

| Weapon/system | Native observed counter | Real duration | Resolution |
|---|---:|---:|---|
| Bomblet Spray cooldown | 24 ticks | 0.8 s | DEFINITIVE |
| Missile Launcher cooldown | 120 ticks | 4.0 s | DEFINITIVE |
| Laser continuous firing burst | — | 1.5 s | OBSERVED; consumer mapping pending |
| Laser recovery/cooldown | — | 2.0 s | OBSERVED; consumer mapping pending |
| Torpedo reload/observed cooldown | — | 3.0 s | OBSERVED; native assignment mapping pending |

## Important field distinction

`RELOAD` and `AIMSPEED` are separate native configuration fields. They must not be assumed to be the same timer. `RELOAD` may feed a cooldown/state counter while `AIMSPEED` participates in firing/aim cadence. Laser having `RELOAD=0` while `AIMSPEED=8` is direct evidence that these fields have distinct semantics.

Likewise, the raw weapon configuration values (for example Bomblet `RELOAD=50` and Torpedo `RELOAD=200`) are not to be treated as the observed cooldown counters until the native assignment/consumer path is verified.

## Derived 30 Hz values

For any value proven to be a base simulation timer counter:

`seconds = ticks / 30`

Examples:

- 15 ticks = 0.5 s
- 24 ticks = 0.8 s
- 30 ticks = 1.0 s
- 45 ticks = 1.5 s
- 60 ticks = 2.0 s
- 90 ticks = 3.0 s
- 120 ticks = 4.0 s
- 150 ticks = 5.0 s

These conversions are definitive once the value is established as a base simulation counter.
