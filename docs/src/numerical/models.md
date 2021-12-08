## Numerical AM--FM Model

A **numerical AM--FM model** `𝐳` (`numModel`) is parameterized by a *vector of  numerical AM--FM components** `[𝚿₀,𝚿₁,𝚿₂]`.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
```

## Evaluating a Numerical AM--FM Model
Once an  **numerical AM--FM model** `𝐳` (`numModel`) is defined, it can be evaluated at
a time instant $t_0$ (`Real`)
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
𝐳(0.5)
```
or over a range of time instants.
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
𝐳(t)
```

## Visualizing a Numerical AM--FM Model
<DOCUMENT FUNCTIONALITY HERE>
