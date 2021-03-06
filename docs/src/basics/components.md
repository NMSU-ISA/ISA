# AM--FM Components

An **AM--FM component** $\psi_k$ [`AMFMcomp`] is parameterized by *canonical triplet* $\mathscr{C}$ [`AMFMtriplet`].

$\psi_k \left( t ; \mathscr{C}_k \vphantom{0^0}\right) \triangleq a_k(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right)$

## Defining an AM--FM Component
We can define a  **AM--FM component** $\psi_k$ [`AMFMcomp`] by calling `AMFMcomp()` with a *canonical triplet* $\mathscr{C}$ [`AMFMtriplet`].
```@example
 using ISA
 πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
 Οβ = AMFMcomp(πΆβ)
```

For convenience, we can also define an  **AM--FM component** $\psi_k$ [`AMFMcomp`] by calling `AMFMcomp()` with the parameters of *canonical triplet*, specifically, an IA $a(t)$ [`Function`]  and IF $\omega(t)$ [`Function`] which are both real-valued functions of a (real-valued) time variable, and a phase reference $\phi$ [`Real`] which is a real number.
```@example
 using ISA
 Οβ = AMFMcomp(t->exp(-t^2/5), t->200.0, 0.0)
```

## Evaluating an AM--FM Component
Once an  **AM--FM component** $\psi_k$ [`AMFMcomp`] is defined, it can be evaluated at a time instant $t_0$ [`Real`]
```@example
 using ISA
 πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
 Οβ = AMFMcomp(πΆβ)
 tβ = 0.15
 Οβ(tβ)
```
or over a range of time instants.
```@example
 using ISA
 πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
 Οβ = AMFMcomp(πΆβ)
 t = 0.0:0.25:1.0
 Οβ(t)
```


## Visualizing an AM--FM Component
We can visualize an  **AM--FM component** $\psi_k$ [`AMFMcomp`] by evoking a pre-defined plotting recipe by calling `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/) with an  *AM--FM component* $\psi_k$ [`AMFMcomp`] and a time range.
```@example
using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=0.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_component.png)
