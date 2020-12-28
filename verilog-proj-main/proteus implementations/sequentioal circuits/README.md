
# Proteus Sequential Circuits Implementatios

### Up/Down Counter With Enable
assumptions:
- using `7476 JK flip flop`.
- If `E = 0`, the counter is disabled and remains at its present count even though clock pulses are applied to the flip‐flops.
- If `E = 1`, the counter is enabled and a second input.
- If `x = 1`, the circuit counts upward with the sequence `00, 01, 10, 11`.
- If `x = 0`, the circuit counts downward with the sequence `11, 10, 01, 00`, and the count repeats.

#### State Diagram :
![alt text](https://github.com/arvin2079/verilog-proj/blob/main/proteus%20implementations/sequentioal%20circuits/media/StateDiagram.png
 "State Diagram")

#### Truth table :

E (enable) | X (direction) || current Q1 | current Q2 | J1 | K1 | J2 | K2 | next Q1 | next Q2 | 
--- | --- | --- | ---  | ---  | ---  | ---   | ---  | ---  | ---  | ---
0 | 0 || 0 | 0 | 0 | x | 0 | x | 0 | 0
0 | 0 || 0 | 1 | 0 | x | x | 0 | 0 | 1
0 | 0 || 1 | 0 | x | 0 | 0 | x | 1 | 0
0 | 0 || 1 | 1 | x | 0 | x | 0 | 1 | 1
0 | 1 || 0 | 0 | 0 | x | 0 | x | 0 | 0
0 | 1 || 0 | 1 | 0 | x | x | 0 | 0 | 1
0 | 1 || 1 | 0 | x | 0 | 0 | x | 1 | 0
0 | 1 || 1 | 1 | x | 0 | x | 0 | 1 | 1
1 | 0 || 0 | 0 | 1 | x | 1 | x | 1 | 1
1 | 0 || 0 | 1 | 0 | x | x | 1 | 0 | 0
1 | 0 || 1 | 0 | x | 1 | 1 | x | 0 | 1
1 | 0 || 1 | 1 | x | 0 | x | 1 | 1 | 0
1 | 1 || 0 | 0 | 0 | x | 1 | x | 0 | 1
1 | 1 || 0 | 1 | 1 | x | x | 1 | 1 | 0
1 | 1 || 1 | 0 | x | 0 | 1 | x | 1 | 1
1 | 1 || 1 | 1 | x | 1 | x | 1 | 0 | 0

### Karnaugh map :
B flip-flop (J1) :
|Q1,Q2\EX| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | 0 | 0 | 1 | 0
**01** | 0 | 0 | 0 | 1
**11** | X | X | X | X
**10** | X | X | X | X

B flip-flop (K1) :
|Q1,Q2\EX| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | X | X | X | X
**01** | X | X | X | X
**11** | 0 | 0 | 0 | 1
**10** | 0 | 0 | 1 | 0

```
J1 = Q2'EX + Q2EX' = E(X ⊕ Q2)
K1 = E(X ⊕ Q2)
```

A flip-flop (J2) :
|Q1,Q2\EX| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | 0 | 0 | 1 | 1
**01** | X | X | X | X
**11** | X | X | X | X
**10** | 0 | 0 | 1 | 1

A flip-flop (K2) :
|Q1,Q2\EX| 00 | 01 | 11 | 10
--- | --- | --- | --- | ---
**00** | X | X | X | X
**01** | 0 | 0 | 1 | 1
**11** | 0 | 0 | 1 | 1
**10** | X | X | X | X

```
J2 = E
K2 = E
```

### Scheme :

![alt text](https://github.com/arvin2079/verilog-proj/blob/main/proteus%20implementations/sequentioal%20circuits/media/scheme.png "Up/Down Counter With Enable")

---

### Implemention
for implemention check out the [proteus directory](https://github.com/arvin2079/verilog-proj/tree/main/proteus%20implementations).
