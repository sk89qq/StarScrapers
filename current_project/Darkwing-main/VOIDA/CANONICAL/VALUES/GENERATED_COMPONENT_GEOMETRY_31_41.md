# Generated Component Geometry — Slots 31–41

Source: `VOIDA/ORIGINAL_JAR/PREPROCESSING_01_06/javap-targeted/wlb.txt`, native `fnb`/`uca` construction chain.

Native constants recovered from `fnb`: `fnb.b = 5120`, `fnb.a = floor(5120*sin(pi/3)) = 4434`. The generator initializes `n1 = 2560`, `n2 = 2217`, and `n3 = 1365` in the slot-30 transition.

| Slot | Native construction recovered | Notes |
|---|---|---|
| 31 | `new wfb(new int[]{-n1,-n1,n1,-n1,n1+2*n2,0,n1,n1,-n1,n1},-n1,0)` | Hardpoints: `(-116,n1/2,n3)`, `(n2+n1,-n1/2,-n3)`, `(0,n1,2048)`, `(0,-n1,-2048)`; `wfb.a(126,15)`; `wfb.a=2`. |
| 32 | computed 16-int polygon from `n1` then `ta.a(poly,124,wfb)` | `wfb.a(105,15)`; `wfb.a=2`; source bytecode 5062–5456. |
| 33 | computed 12-int polygon from `n1,n2` then `ta.a(poly,127,wfb)` | `wfb.a(118,15)`; `wfb.a=3`; `B=0`, `q=0`; source bytecode 5563–5843. |
| 34 | `uca.a(-b/2,9,new int[]{1,4,7,8,9,10,11,2,5},-b/2)` | `new wfb(...,-b/2,0)`; `wfb.a(110,15)`; `wfb.a=2`; hardpoint table `{0,1,2,3,4,5,6,7}`. |
| 35 | `uca.a(-b/2,9,new int[]{3,7,8,11,0},-b/2)` | `new wfb(...,-b/2,0)`; `wfb.a(111,15)`; `wfb.a=3`; `B=0`, `q=0`; source bytecode 6160–6365. |
| 36 | `uca.a(0,9,new int[]{2,6,7,10,11},-b/2)` | `new wfb(...,-b/2,b/2)`; `wfb.a(113,15)`; `wfb.a=3`; `B=0`, `q=0`; source bytecode 6378–6530. |
| 37 | computed 12-int polygon from `n1,n2` then `ta.a(poly,127,wfb)` | `wfb.a(118,15)`; `wfb.a=3`; `B=0`, `q=0`; source bytecode 5563–5843. |
| 38 | `uca.a(-b/2,9,new int[]{7,8,9,11,3,2},-b/2)` | `new wfb(...,-b/2,-b/2)`; `wfb.a=2`; source bytecode 6856–6863. |
| 39 | `uca.a(-b/2,9,new int[]{5,7,9,11,1},-n2)` | `new wfb(...,-n2,0)`; `wfb.a=2`; source bytecode 7036–7029. |
| 40 | `uca.a(-n2,9,new int[]{3,3,7,9,9,11},n1)` | `new wfb(...,-n2,0)`; `wfb.a=3`; `B=0`, `q=0`; source bytecode 5558–5651. |
| 41 | `uca.a(-b/2,9,new int[]{5,7,11,7,11,1},-n2)` | `new wfb(...,-n2,0)`; `wfb.a=2`; source bytecode 7135 onward. |

These are source-derived generator expressions, not inferred static polygons. Slots 48–55 remain procedural `jba.a(...)` definitions and are not covered by this closure.
