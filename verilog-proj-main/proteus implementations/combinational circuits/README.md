

# Proteus Combinational Circuits Implementatios
## Issues :
1. Majority Logic
2. Parity Generator
3. Decoder Implementation
---

### Majority Logic
assumptions:
- `3` input.
- if `0` inputs were equal to `1` outputs return `0`.

#### Truth table :
A | B | C || F
--- | --- | --- | --- | ---
0 | 0 | 0 || 0
0 | 0 | 1 || 0
0 | 1 | 0 || 0
0 | 1 | 1 || 1
1 | 0 | 0 || 0
1 | 0 | 1 || 1
1 | 1 | 0 || 1
1 | 1 | 1 || 1

### Karnaugh map :
|A\BC| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**0** | 0 | 0 | 1 | 0
**1** | 0 | 1 | 1 | 1

```
F = AB + BC + AC
```

### Scheme :

![alt text](https://github.com/arvin2079/verilog-proj/blob/main/proteus%20implementations/media/MajorityLogic.PNG "Majority Logic")

---
### Even Parity Bit Generator
assumptions:
- `4` bit signal.
- This is even parity generator so we set `1` for F only when signal total `1` bit number is odd.

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

### Scheme :

![alt text](https://github.com/arvin2079/verilog-proj/blob/main/proteus%20implementations/media/EvenParityGenerator.PNG "Even Parity Generator")

---
### Decoder Implementation
assumptions:
```
F1 = xz + x!y!z!
F2 = x!y + xy!z!	
F3 = xy + x!y!z
```

#### Truth table : 
A | B | C || F1 | F2 | F3  
--- | --- | --- | --- | --- | --- | ---
0 | 0 | 0 || 1 | 0 | 1 
0 | 0 | 1 || 0 | 0 | 0 
0 | 1 | 0 || 0 | 1 | 0 
0 | 1 | 1 || 0 | 1 | 0 
1 | 0 | 0 || 0 | 1 | 0 
1 | 0 | 1 || 1 | 0 | 0 
1 | 1 | 0 || 0 | 0 | 1 
1 | 1 | 1 || 1 | 0 | 1 


### Scheme :

![alt text](https://github.com/arvin2079/verilog-proj/blob/main/proteus%20implementations/media/Decoder.PNG "Decoder")

***

### Implemention
for implemention check out the [proteus directory](https://github.com/arvin2079/verilog-proj/tree/main/proteus%20implementations).
