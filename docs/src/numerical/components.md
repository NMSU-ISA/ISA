# Numerical AM--FM Components

## Defining a Numerical AM--FM Component

A **numerical AM--FM component** `𝚿₀` [`numComp`] is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `ψ₀` [`AMFMcomp`].

We can define **numerical AM--FM component** `𝚿₀` [`numComp`]
by calling `numComp()` with **AM--FM component** `ψ₀` [`AMFMcomp`] and fs [`Real`].
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
```

We can also define **numerical AM--FM component** `𝚿₀` [`numComp`] by calling `numComp()` with **AM--FM component** `ψ₀` [`AMFMcomp`].
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t) )
```
Another convenient way to define **numerical AM--FM component** `𝚿₀` [`numComp`] by calling `numComp()` with either **AM--FM component** `ψ₀` [`AMFMcomp`] and t [`Real`].
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), t)
```
or with **AM--FM component** `ψ₀` [`AMFMcomp`], t [`Real`] and
fs [`Real`].
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), t, fs)
```

## Evaluating a Numerical AM--FM Component
Once an  **numerical AM--FM component** `𝚿₀` [`numComp`] is defined, it can be evaluated at
a time instant $t_0$ [`Real`]
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

We can visualize an  **numerical AM--FM component** `𝚿₀` [`numComp`] by evoking a pre-defined plotting recipe by calling `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/) with **AM--FM component** `ψ₀` [`AMFMcomp`].
```@example
using ISA, Plots
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
plot(𝚿₀,view="IR")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_exAMFMcomp1.png)
