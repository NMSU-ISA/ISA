# Cannonical Triplets and Component Sets

## Cannonical Triplets
A **cannonical triplet** consists of an instantaneous amplitude (IA) `Function`, an instantaneous frequency (IF) `Function`, and a phase reference `Real`.

$\mathscr{C}\triangleq\left\{a,\omega, \phi\vphantom{0^0}\right\}$

### Defining a Cannonical Triplet
We define an **cannonical triplet**  by passing the function `AMFMtriplet()` an instantaneous amplitude $a(t)$ i.e a real valued function of time, an instantaneous frequency $\omega(t)$ a real valued function of time
 , and a phase reference $\phi$ which is a real number as its input arguments.
The function `AMFMtriplet()` will return us the required **cannonical triplet**, 𝐶 as an object of type `AMFMtriplet` in the following way:

```julia
a₀(t) = exp(-t^2)

ω₀(t) = 2.0

φ₀ = 0.0

𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)

```

## Component Sets
A **component set** is a set of **cannonical triplet** of type `Vector{AMFMtriplet}`.

$\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

### Defining a Component Set
We can define a **component set** by defining a structure or a constructor method
which contains the object 𝑆 that creates a vector of **cannonical triplets**
as follows:

```julia
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)

a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)

a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π
𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)

𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
```
