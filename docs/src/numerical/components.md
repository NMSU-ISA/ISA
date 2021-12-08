# Numerical ISA

## Defining a Numerical AM--FM Components

A **numerical AM--FM component** `numComp` is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `AMFMcomp`.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
```
## Evaluating a Numerical AM--FM Components
Once an  **numerical AM--FM component** $\Psi_$ (`numComp`) is defined, it can be evaluated at
a time instant $t_0$ (`Real`)
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
t₀ = 0.5
𝚿₀(t₀)
```
or over a range of time instants.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₀(t)
```

MAKE NOTE ABOUT INTERPOLATION & DOMAIN HERE

## Visualizing a Numerical AM--FM Component
