# Numerical AM--FM Model

A **numerical AM--FM model** `numModel` is parameterized by a *vector of  numerical AM--FM components** `numComp`.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect{0:1/fs:1}
𝛹₀ = numComp( ψ₀(t), fs )
𝛹₁ = numComp( ψ₁(t), fs )
𝛹₂ = numComp( ψ₂(t), fs )
numModel([𝛹₀,𝛹₁,𝛹₂],t,fs)
```

A **demodulated AM--FM model** `demodModel` is returned by calling `AMFMdemod()` with a **numerical AM--FM model** `numModel`.
```@example
using ISA

```
