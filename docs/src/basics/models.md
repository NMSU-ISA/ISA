# AM--FM Models
A **component set**  maps to an **AM--FM model** `AMFMmodel`.

$z\left( t ; \mathscr{S} \vphantom{0^0}\right)  \triangleq \sum\limits_{k=0}^{K-1}\psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right),~\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

This mapping is provided in the ISA module.

## Defining an AM--FM Model
We define an **AM--FM model** primarily by passing an object, 𝑆 to the
function `AMFMmodel()`. First, define a **component set**, 𝑆 by passing a
vector of type `AMFMtriplet` to the function `compSet`.

```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
```

We also allow an **AM--FM model** `AMFMmodel` to be defined by passing an
vector of `AMFMcomp` to the function `AMFMmodel()`.

```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
z = AMFMmodel([ψ₀,ψ₁,ψ₂])
```

## Evaluating an AM--FM Model
Once an  **AM--FM model** `AMFMmodel` is defined,
it can be evaluated at a time instant `Float64`.

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
or over a step range of time instants.

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

Another example of evaluating an **AM--FM model** over
a range of time instants using the `Plots` module follows.

```@example
using Plots
t = 0.0:0.005:2.0
p1 = plot(t, real(z(t)), xlab="t", ylab="real", legend = :false)
p2 = plot(t, imag(z(t)), xlab="t", ylab="imag", legend = :false)
plot(p1, p2, layout = (2,1))
```
[![](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/ModelEval.png)](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/ModelEval.png)
