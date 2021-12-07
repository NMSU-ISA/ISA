# Numerical ISA

## Numerical AM--FM Components

A **numerical AM--FM component** `numComp` is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `AMFMcomp`.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
```


## Numerical AM--FM Triplet

A **numerical AM--FM triplet** `numTriplet` ...
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
```
