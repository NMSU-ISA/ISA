# Numerical AM--FM Components

## Defining a Numerical AM--FM Component

A **numerical AM--FM component** `𝚿₀` [`numComp`] is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `ψ₀` [`AMFMcomp`].

We can define **numerical AM--FM component** `𝚿₀` [`numComp`]
by calling `numComp()` with **AM--FM component** `ψ₀` [`AMFMcomp`] and fs (`Real`).
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
```
## Evaluating a Numerical AM--FM Component
Once an  **numerical AM--FM component** `𝚿₀` [`numComp`] is defined, it can be evaluated at
a time instant $t_0$ (`Real`)
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
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

<MAKE NOTE ABOUT INTERPOLATION & DOMAIN HERE>

## Visualizing a Numerical AM--FM Component

<DOCUMENT FUNCTIONALITY HERE>
