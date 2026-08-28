# Native Timing Unit — Definitive

## Authority

The shared native gameplay timing unit `l` is definitively calibrated as:

**`1 l = 1.0 second`**

This is a gameplay timing unit, not a 60 Hz simulation-frame duration.

## Calibration anchors

- Native Pedro repair active/channel time: `5 * l`; observed gameplay duration: **5 seconds**.
- Native missile cooldown: `25 * l`; observed gameplay duration: **25 seconds**.
- These establish the same seconds-per-`l` ratio and make the timing conversion definitive.

## Derived definitive conversions

| Native expression | Time |
|---:|---:|
| `1l` | 1 s |
| `2l` | 2 s |
| `5l` | 5 s |
| `10l` | 10 s |
| `20l` | 20 s |
| `25l` | 25 s |
| `40l` | 40 s |
| `50l` | 50 s |

Any native value expressed as `N * l` therefore has definitive gameplay duration `N` seconds.

## Important distinction

The resolved numeric value associated with `l` in the native constant tables (for example `50`) is **not milliseconds** and must not be interpreted as a frame duration. `l` is the authoritative native gameplay timing unit.

## Known subsystem resolutions

- Grappling hook cooldown: `1l` = **1 s**.
- Missile cooldown: `25l` = **25 s**.
- Repair mode cooldown: `40l` = **40 s**.
- Pedro repair active/channel time: `5l` = **5 s**.
- Countermeasure cooldown: `20l` = **20 s**.
- Self-destruct activation timing: `10l` = **10 s**.
- Mass Driver projectile life: `2l` = **2 s**.

## Implementation rule

Consumers of native timing values must use the calibrated `l` boundary. Do not introduce a 0.02-second / 50 Hz interpretation for `l`.
