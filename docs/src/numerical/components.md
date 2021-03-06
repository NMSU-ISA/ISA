# Numerical AM--FM Components

## Defining a Numerical AM--FM Component

A **numerical AM--FM component** `ğ¿â` [`numComp`] is parameterized by the discrete-time observation of a (complex-valued) **AM--FM component** `Ïâ` [`AMFMcomp`].

We can define **numerical AM--FM component** `ğ¿â` [`numComp`]
by calling `numComp()` with **AM--FM component** `Ïâ` [`AMFMcomp`] and fs (`Real`).
```@example
using ISA
Ïâ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
fs = 16_000
t = 0:1/fs:1
ğ¿â = numComp( Ïâ(t), fs )
```

## Evaluating a Numerical AM--FM Component
Once an  **numerical AM--FM component** `ğ¿â` [`numComp`] is defined, it can be evaluated at a time instant $t_0$ (`Real`)
```@example
using ISA
Ïâ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
fs = 16_000
t = 0:1/fs:1
ğ¿â = numComp( Ïâ(t), fs )
tâ = 0.5
ğ¿â(tâ)
```
or over a range of time instants.
```@example
using ISA
Ïâ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
fs = 16_000
t = 0:1/fs:1
ğ¿â = numComp( Ïâ(t), fs )
ğ¿â(t)
```


## Visualizing a Numerical AM--FM Component

We can visualize a **numerical AM--FM component** `ğ¿â` [`numComp`] by evoking a pre-defined plotting recipe by calling `plot()`  from [`Plots.jl`](http://docs.juliaplots.org/latest/) with a **numerical AM--FM component**.
```@julia
using ISA, Plots
Ïâ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
fs = 16_000
t = 0:1/fs:1
ğ¿â = numComp( Ïâ(t), fs )
ğâ = AMFMdemod(ğ¿â)
plot(ğ¿â)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_exAMFMcomp1.png)
