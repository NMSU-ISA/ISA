# Numerical AM--FM Models

## Defining a Numerical AM--FM Model

A **numerical AM--FM model** `𝐳` [`numModel`] is parameterized by a *vector of  numerical AM--FM components* `[𝚿₀,𝚿₁,𝚿₂]`.

We can define **numerical AM--FM model** `𝐳` [`numModel`] by calling `numModel()`with a *vector of  numerical AM--FM components* `[𝚿₀,𝚿₁,𝚿₂]`.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
ψ₁ = AMFMcomp(t->1.0, t->100t+50, 0.1)
ψ₂ = AMFMcomp(t->1.0+0.8cos(2t), t->100+7.5sin(t), π)
fs = 16_000
t = 0:1/fs:3
𝚿₀ = numComp(ψ₀(t), fs)
𝚿₁ = numComp(ψ₁(t), fs)
𝚿₂ = numComp(ψ₂(t), fs)
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
```

## Evaluating a Numerical AM--FM Model
Once an  **numerical AM--FM model** `𝐳` [`numModel`] is defined, it can be evaluated at
a time instant $t_0$ (`Real`)
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
ψ₁ = AMFMcomp(t->1.0, t->100t+50, 0.1)
ψ₂ = AMFMcomp(t->1.0+0.8cos(2t), t->100+7.5sin(t), π)
fs = 16_000
t = 0:1/fs:3
𝚿₀ = numComp(ψ₀(t), fs)
𝚿₁ = numComp(ψ₁(t), fs)
𝚿₂ = numComp(ψ₂(t), fs)
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
𝐳(0.5)
```
or over a range of time instants.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
ψ₁ = AMFMcomp(t->1.0, t->100t+50, 0.1)
ψ₂ = AMFMcomp(t->1.0+0.8cos(2t), t->100+7.5sin(t), π)
fs = 16_000
t = 0:1/fs:3
𝚿₀ = numComp(ψ₀(t), fs)
𝚿₁ = numComp(ψ₁(t), fs)
𝚿₂ = numComp(ψ₂(t), fs)
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
𝐳(t)
```

## Visualizing a Numerical AM--FM Model
We can visualize a **numerical AM--FM model** $𝐳(t)$ [`numModel`] by evoking a pre-defined plotting recipe by calling `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/) with an *numerical AM--FM model* $𝐳(t)$ [`numModel`].
```@julia
using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
ψ₁ = AMFMcomp(t->1.0, t->100t+50, 0.1)
ψ₂ = AMFMcomp(t->1.0+0.8cos(2t), t->100+7.5sin(t), π)
fs = 16_000
t = 0:1/fs:3
𝚿₀ = numComp(ψ₀(t), fs)
𝚿₁ = numComp(ψ₁(t), fs)
𝚿₂ = numComp(ψ₂(t), fs)
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
plot(𝐳)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_exAMFMmodel1.png)
