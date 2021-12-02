# Canonical Triplets and Component Sets

## Canonical Triplets
A **canonical triplet** $\mathscr{C}$ (`AMFMtriplet`) is parameterized by an **instantaneous amplitude (IA)**
$a(t)$ (`Function`), an **instantaneous frequency (IF)** $\omega(t)$ (`Function`), and
a **phase reference** $\phi$ (`Real`).

$\mathscr{C}\triangleq\left\{a(t),\omega(t), \phi\vphantom{0^0}\right\}$

### Defining a Canonical Triplet
We can define a **canonical triplet** $\mathscr{C}$ (`AMFMtriplet`) by calling `AMFMtriplet()` with an IA $a(t)$ (`Function`)  and IF $\omega(t)$ (`Function`) which are both real-valued functions of a (real-valued) time variable, and a phase reference $\phi$ (`Real`) which is a real number.
```@example
using ISA
a(t) = exp(-t^2)
ω(t) = 2.0
φ = 0.0
𝐶 = AMFMtriplet(a,ω,φ)
```


## Component Sets
A **component set** $\mathscr{S}$ (`compSet`) is parameterized by a *set of canonical triplets*.

$\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

### Defining a Component Set
We can define a **component set** by calling `compSet()` with a vector of **canonical triplets**.
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
 𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
```
