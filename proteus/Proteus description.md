
# Proteus 

## Issues :

1. Majority Logic

2. Parity Generator

3. Decoder Implementation

------------------------------------------------------

### Majority Logic
assumptions:
- `4` input.
- if `0` inputs were equal to `1` outputs return `0`.

<br/>

#### Truth table :
A | B | C | D || F
--- | --- | --- | --- | --- | ---
0 | 0 | 0 | 0 || 0
0 | 0 | 0 | 1 || 0
0 | 0 | 1 | 0 || 0
0 | 0 | 1 | 1 || 0
0 | 1 | 0 | 0 || 0
0 | 1 | 0 | 1 || 0
0 | 1 | 1 | 0 || 0
0 | 1 | 1 | 1 || 1
1 | 0 | 0 | 0 || 0
1 | 0 | 0 | 1 || 0
1 | 0 | 1 | 0 || 0
1 | 0 | 1 | 1 || 1
1 | 1 | 0 | 0 || 0
1 | 1 | 0 | 1 || 1
1 | 1 | 1 | 0 || 1
1 | 1 | 1 | 1 || 1

<br/>

### Karnaugh map :

|AB\CD| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | 0 | 0 | 0 | 0
**01** | 0 | 0 | 1 | 0
**11** | 0 | 1 | 1 | 1
**10** | 0 | 0 | 1 | 0

```
F = CDB + ABC + ACD + ABD
  .
  .

  = ((((BC)')'(D'A')')')((((AD)')'(B'C')')')
```

<br/>





-----------------------------------------------------------

### Even Parity Bit Generator
assumptions:
- `4` bit signal.
- This is even parity generator so we set `1` for F only when signal total `1` bit number is odd.
<br/>

#### Truth table :
A | B | C | D || F
--- | --- | --- | --- | --- | ---
0 | 0 | 0 | 0 || 0
0 | 0 | 0 | 1 || 1
0 | 0 | 1 | 0 || 1
0 | 0 | 1 | 1 || 0
0 | 1 | 0 | 0 || 1
0 | 1 | 0 | 1 || 0
0 | 1 | 1 | 0 || 0
0 | 1 | 1 | 1 || 1
1 | 0 | 0 | 0 || 1
1 | 0 | 0 | 1 || 0
1 | 0 | 1 | 0 || 0
1 | 0 | 1 | 1 || 1
1 | 1 | 0 | 0 || 0
1 | 1 | 0 | 1 || 1
1 | 1 | 1 | 0 || 1
1 | 1 | 1 | 1 || 0

<br/>

### Karnaugh map :

|AB\CD| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | 0 | 1 | 0 | 1
**01** | 1 | 0 | 1 | 0
**11** | 0 | 1 | 0 | 1
**10** | 1 | 0 | 1 | 0

```
F = A'B'C'D + A'B'CD' + AB'C'D' + AB'CD
    + ABC'D + ABCD' + AB'C'D' + AB'CD
  .
  .

  = A ⊕ B ⊕ C ⊕ D
```

<br/>

