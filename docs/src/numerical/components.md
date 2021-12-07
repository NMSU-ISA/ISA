# Numerical ISA

## Numerical AM--FM Components

A **numerical AM--FM component** `numComp` is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `AMFMcomp`.
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
ψ₀ = AMFMcomp(𝐶₀)
fs = 16_000
𝛹 = numComp( ψ₀(0:1/fs:1), fs )
```

A **demodulated AM--FM component** `demodComp` is returned by calling `AMFMdemod()` with a **numerical AM--FM component** `numComp`.
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
ψ₀ = AMFMcomp(𝐶₀)
fs = 16_000
𝛹 = numComp( ψ₀(0:1/fs:1), fs )
𝚿 = AMFMdemod(𝛹)
```
