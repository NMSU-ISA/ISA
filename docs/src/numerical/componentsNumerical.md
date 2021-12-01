# Numerical AM--FM Components

A **Numerical AM--FM component** `AMFMcompN` is a complex vector `Vector{ComplexF64}` which has be demodulated using the function `AMFMdemod()`.

```
using ISA


a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
φ₀ = 0.0
C₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ₀ = AMFMcomp(C₀)

a₁(t) = cos.(t)
ω₁(t) = 10*exp(-t)
φ₁ = 0.1
C₁ = AMFMtriplet(a₁,ω₁,φ₁)
ψ₁ = AMFMcomp(C₁)


# Numerical
fs = 16_000
Ψ = numComp( ψ₀(0:1/fs :1) ,fs )
𝚿 = AMFMdemod(Ψ)
```
