# Cannonical Triplets and Component Sets

## Cannonical Triplets
A **cannonical triplet** consists of an instantaneous amplitude (IA)
`Function`, an instantaneous frequency (IF) `Function`, and
a phase reference `Real`.

$\mathscr{C}\triangleq\left\{a(t),\omega(t), \phi\vphantom{0^0}\right\}$

### Defining a Cannonical Triplet
We define an **cannonical triplet**  by passing the function `AMFMtriplet()`
an instantaneous amplitude $a(t)$ which is a real valued function of time,
an instantaneous frequency $\omega(t)$ a real valued function of time
, and a phase reference $\phi$ which is a real number as its input arguments.
The function `AMFMtriplet()` will return the required
**cannonical triplet**, 𝐶 as an object of type `AMFMtriplet` as follows

```@example
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
```
## Component Sets
A **component set** is a set of **cannonical triplet** of type `Vector{AMFMtriplet}`.

$\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

### Defining a Component Set
We define a **component set** primarily by defining a structure or
a constructor method which contains the object 𝑆 that creates
a vector of **cannonical triplets**.

```jldoctest triplets
julia> using ISA
julia> a₀(t) = exp(-t^2);
julia> ω₀(t) = 2.0;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);

julia> a₁(t) = 1.0;
julia> ω₁(t) = 10*t;
julia> φ₁ = 0.1;
julia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);

julia> a₂(t) = 0.8*cos(2t);
julia> ω₂(t) = 10 + 7.5*sin(t);
julia> φ₂ = π;
julia> 𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂);

julia> 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1), AMFMtriplet(a₂, ω₂, π)])
```

We also allow another method to define a **component set**
by providing the vector of AM-FM components as follows

```jldoctest triplets
julia> using ISA
julia> a₀(t) = cos.(t);
julia> ω₀(t) = 100;
julia> φ₀ = 0.0;
julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);

julia> a₁(t) = 2*t;
julia> ω₁(t) = 10;
julia> φ₁ = 1.0;
julia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);

julia> ψ₀ = AMFMcomp(C₀);
julia> ψ₁ = AMFMcomp(C₁);
julia> S = compSet([ψ₀,ψ₁])

compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 1.0)])
```
