# Native Repair Functions — Resolved

**Status:** RESOLVED for the native repair-application functions and their timing/amount inputs.

## Native configuration

The original JAR's `oq` static initializer establishes `l = 50` and derives:

- `oq.q = 40 * l = 2000` — repair-mode cooldown.
- `oq.k = 5 * l = 250` — repair-mode active-time value.

The native variable registry maps these to `REPAIR_MODE_COOLDOWN` and `REPAIR_MODE_ACTIVE_TIME` respectively.

## Actual repair application function

The JAR-derived bytecode for `pe.a(tfa[], int, tfa[], int)` is the concrete repair application path. It loads:

- `wra.p = 20` — player repair interval.
- `uja.b = 20` — AI repair interval.
- `gka.q = 256` — player repair amount.
- `ela.q = 256` — AI repair amount.
- `wj.p = 1` — fighter repair interval.
- `bjb.o = -2` — fighter repair amount.

When the relevant interval divides the supplied counter (`iload 4 % repairTime == 0`), the corresponding repair amount is applied to the component/target. For player/AI repair, the time values are multiplied by `lja.d` when the native `fra.a` condition selects that scaling path.

This establishes that the repair functions are **periodic application functions**, distinct from the separate repair-mode cooldown/active-time configuration.

## Timing interpretation

Do not equate the repair interval values (`20`) with `oq`'s `l` unit without additional evidence. Likewise, `oq.k = 250` is the native repair-mode active-time value, but the bytecode evidence available here does not establish that this is the observed three-second pre-repair channel.

The user's observed ~3-second channel is therefore a separate consumer-timing question. The concrete repair application path is now resolved and can be used to trace the caller/channel that precedes it.

## Provenance

Evidence source: `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-all.txt`, original-JAR-derived bytecode/decompilation.
