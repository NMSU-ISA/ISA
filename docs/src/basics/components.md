# AM--FM Components

A **component triplet**  maps to an **AM--FM component** `AMFMcomp`.

$\psi_k \left( t ; \mathscr{C}_k \vphantom{0^0}\right) \triangleq a_k(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right)$

This mapping is provided in the ISA module.

## Defining an AM--FM Component
We define an **AM--FM component** by passing the function `AMFMcomp()`
an object of type `AMFMtriplet`. First we create an object say, C
of type `AMFMtriplet` by providing an instantaneous amplitude $a(t)$,
an instantaneous frequency $\omega(t)$, and a phase reference $\phi$
to function `AMFMtriplet`.
Then we simply pass the object C to the function `AMFMcomp()` that will
result into required **AM--FM component** as follows

```jldoctest components
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);
julia> ψ₀ = AMFMcomp(𝐶₀)

# output
```
We also allow an **AM--FM component** `AMFMcomp` to be defined by passing the
function `AMFMcomp()` an instantaneous amplitude (IA) `Function`,
an instantaneous frequency (IF) `Function`, and a phase reference `Real` as
follows:

```jldoctest components
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 1.0;
julia> ψ₀ = AMFMcomp(a₀,ω₀,φ₀)
AMFMcomp(AMFMtriplet(a₀, ω₀, 1.0))

```
## Evaluating an AM--FM Component
Once an  **AM--FM component** `AMFMcomp` is defined it can be evaluated at
a time instant `Float64`.

```jldoctest components
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);
julia> ψ₀ = AMFMcomp(𝐶₀);
julia> t₀ = 0.15;
julia> ψ₀(t₀)
0.9340814341784995 + 0.2889452476787552im
```
or over a step range of time instants.

```jldoctest components
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);
julia> ψ₀ = AMFMcomp(𝐶₀);
julia> t = 0.0:0.25:1.0;
julia> ψ₀(t)
5-element Vector{ComplexF64}:
                 1.0 + 0.0im
  0.8244125223371318 + 0.45037861361117465im
 0.42078785890539294 + 0.655338261900256im
 0.04030484257978472 + 0.5683555111221924im
 -0.1530918656742263 + 0.33451182923926226im
```

Another example of evaluating an **AM--FM component** over a
range of time instants using the `Plots` module follows.

```julia
using Plots
t = 0.0:0.005:2.0
p1 = plot(t, real(ψ₀(t)), xlab="t", ylab="real", legend = :false)
p2 = plot(t, imag(ψ₀(t)), xlab="t", ylab="imag", legend = :false)
plot(p1, p2, layout = (2,1))
```
[![](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/CompEval.png)](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/CompEval.png)
