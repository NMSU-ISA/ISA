# Cannonical Triplets and Component Sets

## Cannonical Triplets
A **cannonical triplet** $\mathscr{C}$ is parameterized by an **instantaneous amplitude (IA)**
$a(t)$ (`Function`), an **instantaneous frequency (IF)** $\omega(t)$ `Function`, and
a **phase reference** $\phi$ (`Real`).

$\mathscr{C}\triangleq\left\{a(t),\omega(t), \phi\vphantom{0^0}\right\}$

### Defining a Cannonical Triplet
We can define a **cannonical triplet** by calling `AMFMtriplet()` with an IA $a(t)$ (`Function`)  and IF $\omega(t)$ (`Function`) that are both real-valued functions of a (real-valued) time variable, and a phase reference $\phi$ (`Real`) that is a real number. Appropriately calling `AMFMtriplet()` will return a **cannonical triplet**, $\mathscr{C}$ (`AMFMtriplet`).
```@example
using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
```

## Component Sets
A **component set** is a set of **cannonical triplet** of type `Vector{AMFMtriplet}`.

$\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

### Defining a Component Set
We define a **component set** primarily by defining a structure or
a constructor method which contains the object 𝑆 that creates
a vector of **cannonical triplets**.

```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
 𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
```
