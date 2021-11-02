# AM--FM Components

A **component triplet**  maps to an **AM--FM component** `AMFMcomp`.

$\psi_k \left( t ; \mathscr{C}_k \vphantom{0^0}\right) \triangleq a_k(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right)$

This mapping is provided in the ISA module.
```
using ISA
```

## Defining an AM--FM Component
We define an **AM--FM component** by passing the function `AMFMcomp()` a object
of type `AMFMtriplet`. First we create an object say, C of type `AMFMtriplet`
by providing an instantaneous amplitude $a(t)$, an instantaneous frequency
$\omega(t)$, and a phase reference $\phi$ to function `AMFMtriplet`.
Then we simply pass the object C to the function `AMFMcomp()` that will
result into required **AM--FM component**.

```@example
using ISA

a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ₀ = AMFMcomp(𝐶₀)

```
We also allow an **AM--FM component** `AMFMcomp` to be defined by passing the
function `AMFMcomp()` an instantaneous amplitude (IA) `Function`,
an instantaneous frequency (IF) `Function`, and a phase reference `Real` as
follows:

```@example
using ISA

a(t) = exp(-t^2)
ω(t) = 2.0
φ = 0.0

ψ = AMFMcomp(a,ω,φ)

```

## Evaluating an AM--FM Component
Once an  **AM--FM component** `AMFMcomp` is defined it can be evaluated at
a time instant `Float64`

```@example
using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ₀ = AMFMcomp(𝐶₀)
t₀ = 0.15
ψ₀(t₀)

```
or over a range of time instants `Vector{Float64}`.

```@example
using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ₀ = AMFMcomp(𝐶₀)
t = 0.0:0.25:1.0
ψ₀(t)

```

Another example of evaluating an **AM--FM component** over a range of time instants using the `Plots` module follows.

```julia
using Plots
t = 0.0:0.005:2.0
p1 = plot(t, real(ψ₀(t)), xlab="t", ylab="real", legend = :false)
p2 = plot(t, imag(ψ₀(t)), xlab="t", ylab="imag", legend = :false)
plot(p1, p2, layout = (2,1))
```
[![](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/CompEval.png)](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/CompEval.png)
