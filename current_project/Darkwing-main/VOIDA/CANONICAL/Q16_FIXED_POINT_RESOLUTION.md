# Q16 Fixed-Point Resolution — Working Canonical Scale

## Definition

For the current porting model, the recovered recurring power-of-two numeric family is treated as **Q16 fixed-point** unless a field-specific native operator proves another scale.

- Fractional bits: **16**
- Unity: **65536 = 1.0**
- Conversion: `real = raw / 65536`
- Inverse: `raw = real * 65536`

This is a numeric representation scale, not a time unit. It is independent of the definitive 30 Hz simulation cadence and the definitive native `l = 1 second` duration unit.

## Resolved recurring constants

| Raw | Q16 value |
|---:|---:|
| 16 | 0.000244140625 |
| 64 | 0.0009765625 |
| 128 | 0.001953125 |
| 192 | 0.0029296875 |
| 234 | 0.003570556640625 |
| 256 | 0.00390625 |
| 512 | 0.0078125 |
| 1024 | 0.015625 |
| 1280 | 0.01953125 |
| 1600 | 0.0244140625 |
| 2048 | 0.03125 |
| 4096 | 0.0625 |
| 8192 | 0.125 |
| 16384 | 0.25 |
| 32768 | 0.5 |
| 65536 | 1.0 |
| 131072 | 2.0 |
| 262144 | 4.0 |

## High-value current mappings

- `AIMARC=1024` → **0.015625** Q16 units.
- `AIMARC=512` → **0.0078125**.
- `FIRE_FORCE=32768` → **0.5**.
- `MACHINE_GUN_FIRE_FORCE=16384` → **0.25**.
- `SNIPER_CANNON_FIRE_FORCE=1024` → **0.015625**.
- `POINT_DEFENCE_LASER_FIRE_FORCE=131072` → **2.0**.
- `DEBRIS_GRABBING_RANGE=262144` → **4.0**.
- `COMPONENT_BREAKING_EXPLOSION_FORCE_MULTIPLIER=32768` → **0.5**.
- `PHYSICS_COLLISION_FORCE_MULTIPLIER=4096` → **0.0625**.
- `PHYSICS_COLLISION_PHANTOM_FORCE_MULTIPLIER=2048` → **0.03125**.
- `DEBRIS_DETACHMENT_FORCE_MULTIPLIER=256` → **0.00390625**.
- `ANGULAR_VELOCITY_SUSTAIN_MAX=256` → **0.00390625**.
- `GRAPPLING_HOOK_ROPE_BREAK_LENGTH=131072` → **2.0**.

## Important scope rule

Q16 conversion is now the working numeric interpretation for the recurring fixed-point family, but it does **not** by itself establish the physical unit of a field. A Q16 value of `0.5` could represent 0.5 force units, velocity units, angular units, etc., depending on the native consumer.

Likewise, raw values such as weapon `RELOAD`, `AIMSPEED`, projectile `LIFE`, and timing counters are not to be converted to Q16 merely because they are integers. Their native operators determine their representation family.

## Cross-clock separation

- **30 Hz:** authoritative base simulation cadence; 30 ticks = 1 second.
- **`l`:** authoritative native gameplay duration; 1l = 1 second.
- **Q16:** numeric fixed-point representation; 65536 = 1.0.

These are three different concepts and must not be conflated.
