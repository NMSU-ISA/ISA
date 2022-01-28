# Numerical AM--FM Components

## Defining a Numerical AM--FM Component

A **numerical AM--FM component** `𝚿₀` [`numComp`] is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `ψ₀` [`AMFMcomp`].

We can define **numerical AM--FM component** `𝚿₀` [`numComp`]
by calling `numComp()` with **AM--FM component** `ψ₀` [`AMFMcomp`] and fs (`Real`).
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
```

## Evaluating a Numerical AM--FM Component
Once an  **numerical AM--FM component** `𝚿₀` [`numComp`] is defined, it can be evaluated at a time instant $t_0$ (`Real`)
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
t₀ = 0.5
𝚿₀(t₀)
```
or over a range of time instants.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₀(t)
```


## Visualizing a Numerical AM--FM Component

We can visualize a **numerical AM--FM component** `𝚿₀` [`numComp`] by evoking a pre-defined plotting recipe by calling `plot()`  from [`Plots.jl`](http://docs.juliaplots.org/latest/) with a **numerical AM--FM component**.
```@julia
using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
plot(𝚿₀)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_exAMFMcomp1.png)
