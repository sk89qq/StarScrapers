# Physics / Resource Scale Resolution — Definitive Port Semantics

## Resource display

Energy is a **0–100% player-facing visual representation**, not a native numeric quantity exposed to the player. The underlying resource is managed by the capacitor subsystem and its configured sources.

Energy regeneration is **continuous/tick-based and never voluntarily stops**. When energy falls below the weapon-fire threshold, the weapon system enters its exhausted/timeout state, waits for the capacitor/resource system to fully recharge, and only then makes weapons fireable again.

Do not invent a visible energy-number scale or an independent energy clock.

## Damage

For the port, native damage and native health use the same scale. A separate real-world damage unit is unnecessary. Use the canonical **damage scale = 2048** where normalized damage is required:

`normalized_damage = native_damage / 2048`

The important invariant is that health and damage remain on the same native scale; exact real-world interpretation is irrelevant to gameplay equivalence.

## Position / distance

Use **1 native distance unit = 1 port distance unit** as the canonical port coordinate basis. Preserve all relative positions, radii, ranges, offsets, and lengths. No meter conversion is required.

## Velocity

Use the native relative velocity scale directly. Fixed-speed projectiles retain their native velocity values; no real-world speed conversion is required. Player-ship velocity is dynamically changed by its propulsion/thruster configuration. Fighter AI movement is handled as vector/impulse-driven motion rather than a single fixed projectile-speed constant.

## Acceleration

Acceleration-bearing native fields are the acceleration inputs themselves. Do not introduce an external universal acceleration constant merely to give the values physical units. Integrate those native acceleration values using the authoritative simulation step.

Known examples include missile/torpedo acceleration and other propulsion values already present in the native data.

## Angular movement

Weapon `AIMSPEED` is the angular traverse/aiming speed and `AIMARC` is its angular envelope. `AIMSPEED=0` identifies fixed/non-pivoting modules. These use the standardized native angular representation and the established fixed-point numeric representation; no additional real-world angular unit is required for the port.

## Projectile motion

Projectile speeds are fixed by their native weapon/projectile configuration unless the projectile is an AI-controlled entity (for example fighter behavior). Projectile lifetime is governed by its native lifetime counter/duration and the authoritative 30 Hz simulation cadence where the lifetime is a base simulation counter, or by explicit `l` where the native expression uses `l`.

## Integration rule

The port should preserve the original relationships rather than impose real-world units:

- position += velocity per authoritative simulation step
- velocity += native acceleration per authoritative simulation step
- weapon/physics constants retain their relative native magnitudes
- Q16 is the working fixed-point numeric representation where the native field belongs to that family
- damage uses the separate 2048 normalization scale
- timing uses the definitive 30 Hz simulation cadence and native `l` durations

This document resolves unit questions for gameplay equivalence. Remaining forensic work is limited to identifying native operators/field consumers where needed, not inventing external units.
