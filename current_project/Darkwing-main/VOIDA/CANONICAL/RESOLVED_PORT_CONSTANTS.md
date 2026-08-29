# Resolved Port Constants — Timing / Motion / Resource

## Reload resolution

The weapon `RELOAD` field is treated as a weapon-specific configuration value whose **resolved gameplay duration is represented in the common 30-Hz simulation clock**. The raw configuration integer is retained unchanged in the recovered values table; the port uses the resolved state duration.

| Weapon | Raw RELOAD | Resolved duration | 30-Hz state |
|---|---:|---:|---:|
| Mass Driver | 20 | pending native behavioral confirmation | — |
| Torpedo | 200 | 3.0 s | 90 ticks |
| Laser | 0 | continuous | 0 / no positive reload state |
| Bomblet Spray | 50 | 0.8 s | 24 ticks |
| PEB / Scrambler family | 50 | 0.8 s reload state | 24 ticks |
| Machine Gun | 30 | 1.0 s | 30 ticks |
| Sniper Cannon | 100 | 3.3333 s when directly consumed as a 30-Hz state | 100 ticks |
| Fighter Bay | 1500 | 50.0 s when directly consumed as a 30-Hz state | 1500 ticks |
| PDL | 50 | 0.8 s | 24 ticks |

**Important:** the known behavioral anchors establish the common 30-Hz timing cadence, but they do not prove that every raw `RELOAD` integer is directly equal to ticks. Therefore values explicitly marked as direct-consumption are derived from the clock; anchored values are definitive gameplay timings. Do not invent a second weapon clock.

## Pulse fields

`PULSETIME` and `PULSE_FADETIME` are pulse-state controls, not universal reload values. `PULSETIME` is relevant to the pulse/Scrambler/PEB-style behavior.

## Recoil / FIRE_FORCE

`FIRE_FORCE` is applied as recoil opposite the projectile's travel vector. The application point is the weapon's attachment point in the component graph. The native port model does not introduce an external recoil direction or real-world force conversion.

No canonical weapon mass/weight field has been recovered. For the port, weapons are therefore treated as **weightless attachment nodes** and recoil is propagated through the connected physical component/body at the attachment point. If later native evidence supplies mass, this rule can be revised.

## Propulsion

Propulsion is graph-based: a thruster/propulsion component applies its force at its defined point in the component graph. It modifies the connected physical body's velocity through the same native relative physics representation. No external universal acceleration constant is introduced.

## Energy

Energy is a player-facing 0–100% representation backed by the capacitor subsystem. Capacitor sources recharge continuously on simulation ticks. Weapon fire consumes the shared resource. Depletion enters the recharge/lockout behavior and weapons become fireable again only after the required full recharge state.

No additional real-world energy unit is required for the port.

## Shield

Shield depletion/recharge uses the same authoritative simulation timing architecture. Do not introduce a separate shield clock. Any native shield duration/count is interpreted through the 30-Hz cadence; depletion and recharge values remain subsystem-specific until their native consumer is recovered.

## Spatial / velocity conventions

- Position and distance: `1 native = 1 port unit` for relative gameplay geometry.
- Fixed projectile speeds remain fixed per projectile type.
- Player ship velocity changes through propulsion/thruster graph forces.
- Fighter AI uses vector/impulse movement rather than projectile fixed-speed motion.

## Fixed-point conventions

- Q16 numeric scale: `65536 = 1.0`.
- Damage/health share the same native scale; canonical damage normalization is `2048` units.
- Angular quantities use the standardized native angular/fixed-point representation.
