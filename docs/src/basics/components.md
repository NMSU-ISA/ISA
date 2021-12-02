# AM--FM Components

An **AM--FM component** $\psi_k$ (`AMFMcomp`) is parameterized by **canonical triplet** $\mathscr{C}$ (`AMFMtriplet`).

$\psi_k \left( t ; \mathscr{C}_k \vphantom{0^0}\right) \triangleq a_k(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right)$

## Defining an AM--FM Component
We can define a  **AM--FM component** $\psi_k$ (`AMFMcomp`) by calling `AMFMcomp()` with a **canonical triplet** $\mathscr{C}$ (`AMFMtriplet`).
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 ψ₀ = AMFMcomp(𝐶₀)
```

For convenience, we can also define a  **AM--FM component** $\psi_k$ (`AMFMcomp`) by calling `AMFMcomp()` withteh parameters of **canonical triplet**, specifically, an IA $a(t)$ (`Function`)  and IF $\omega(t)$ (`Function`) which are both real-valued functions of a (real-valued) time variable, and a phase reference $\phi$ (`Real`) which is a real number.
```@example
 using ISA
 ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
```

## Evaluating an AM--FM Component
Once an  **AM--FM component** $\psi_k$ (`AMFMcomp`) is defined, it can be evaluated at
a time instant $t_0$ (`Real`)
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
 ψ₀ = AMFMcomp(𝐶₀)
 t₀ = 0.15
 ψ₀(t₀)
```
or over a step range of time instants.
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2), t->2.0, 0.0)
 ψ₀ = AMFMcomp(𝐶₀)
 t = 0.0:0.25:1.0
 ψ₀(t)
```
