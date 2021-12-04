# AM--FM Models

An **AM--FM model** $z(t)$ (`AMFMmodel`) is parameterized by a **component set** $\mathscr{S}$ (`compSet`).

$z\left( t ; \mathscr{S} \vphantom{0^0}\right)  \triangleq \sum\limits_{k=0}^{K-1}\psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right),~\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

## Defining an AM--FM Model
We can define an **AM--FM model** $z(t)$ (`AMFMmodel`) by calling `AMFMmodel()` with a **component set** $\mathscr{S}$ (`compSet`).
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
```

For convenience, we can also define an **AM--FM model** $z(t)$ (`AMFMmodel`) by calling `AMFMmodel()` with either a *vector of canonical triplets*
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
z = AMFMmodel([𝐶₀,𝐶₁,𝐶₂])
```
or a *vector of AMFM--components*
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
z = AMFMmodel([ψ₀,ψ₁,ψ₂])
```

## Evaluating an AM--FM Model
Once an  **AM--FM model** $z(t)$ `AMFMmodel` is defined, it can be evaluated at a time instant $t_0$ (`Real`).
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
t₀ = 2.0
z(t₀)
```
or over a range of time instants
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
t = 0.0:0.25:1.0
z(t)
```

## Visualizing an AM--FM Model
We can visualize an **AM--FM model** $z(t)$ (`AMFMmodel`) by calling `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/) with an **AM--FM model** $z(t)$ (`AMFMmodel`) and a time range.
```@example
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_models.png)
