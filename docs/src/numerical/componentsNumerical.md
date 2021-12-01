# Numerical AM--FM Components

A **Numerical AM--FM component** `numComp`

```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
ψ₀ = AMFMcomp(𝐶₀)
fs = 16_000
Ψ = numComp( ψ₀(0:1/fs :1),fs )
𝚿 = AMFMdemod(Ψ)
```

A **Numerical AM--FM component** `numComp` can be demodulated using the function `AMFMdemod()`.

```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
ψ₀ = AMFMcomp(𝐶₀)
fs = 16_000
Ψ = numComp( ψ₀(0:1/fs :1),fs )
𝚿 = AMFMdemod(Ψ)
```
