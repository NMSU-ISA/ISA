# Cannonical Triplets and Component Sets

## Cannonical Triplets
A **cannonical triplet** consists of an instantaneous amplitude (IA) `Function`, an instantaneous frequency (IF) `Function`, and a phase reference `Real`.

$\mathscr{C}\triangleq\left\{a,\omega, \phi\vphantom{0^0}\right\}$

### Defining a Cannonical Triplet
We define an **cannonical triplet**  by passing the function `AMFMtriplet()` an
instantaneous amplitude $a(t)$ i.e a real valued function of time
, an instantaneous frequency $\omega(t)$ again a real valued function of time
 , and a phase reference $\phi$ which is a real number as its input parameters.
The function `AMFMtriplet()` will return us the required **cannonical triplet**
as an object of type `AMFMtriplet` in the following way:
```
julia> a₀(t) = exp(-t^2)
a₀ (generic function with 1 method)

julia> ω₀(t) = 2.0
ω₀ (generic function with 1 method)

julia> φ₀ = 0.0
0.0

julia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
AMFMtriplet(a₀, ω₀, 0.0)
```

## Component Sets
A **component set** is a set of **cannonical triplet** of type `Vector{AMFMtriplet}` .

### Defining a Component Set
We can define a **component set** by defining a structure or constructor method
which contains the object **S** that creates a vector of **cannonical triplet**.


$\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

```
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
```
Then, store the k **cannonical triplets** in the following way:
`Vector{AMFMtriplet} with k elements`

```
julia> S = compSet([𝐶₀,𝐶₁,𝐶₂])
compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1), AMFMtriplet(a₂, ω₂, π)])
```
