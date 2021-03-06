# AM--FM Models

An **AM--FM model** $z(t)$ [`AMFMmodel`] is parameterized by a *component set* $\mathscr{S}$ [`compSet`].

$z\left( t ; \mathscr{S} \vphantom{0^0}\right)  \triangleq \sum\limits_{k=0}^{K-1}\psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right),~\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

## Defining an AM--FM Model
We can define an **AM--FM model** $z(t)$ [`AMFMmodel`] by calling `AMFMmodel()` with a *component set* $\mathscr{S}$ [`compSet`].
```@example
using ISA
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->1.0, t->100t, 0.1)
πΆβ = AMFMtriplet(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
```

For convenience, we can also define an **AM--FM model** $z(t)$ [`AMFMmodel`] by calling `AMFMmodel()` with either a *vector of canonical triplets*
```@example
using ISA
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->1.0, t->100t, 0.1)
πΆβ = AMFMtriplet(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
z = AMFMmodel([πΆβ,πΆβ,πΆβ])
```
or a *vector of AMFM--components*.
```@example
using ISA
Οβ = AMFMcomp(t->exp(-t^2/5), t->200.0, 0.0)
Οβ = AMFMcomp(t->1.0, t->100t, 0.1)
Οβ = AMFMcomp(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
z = AMFMmodel([Οβ,Οβ,Οβ])
```

## Evaluating an AM--FM Model
Once an  **AM--FM model** $z(t)$ [`AMFMmodel`] is defined, it can be evaluated at a time instant $t_0$ [`Real`].
```@example
using ISA
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->1.0, t->100t, 0.1)
πΆβ = AMFMtriplet(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
tβ = 2.0
z(tβ)
```
or over a range of time instants.
```@example
using ISA
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->1.0, t->100t, 0.1)
πΆβ = AMFMtriplet(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
t = 0.0:0.25:1.0
z(t)
```

## Visualizing an AM--FM Model
We can visualize an **AM--FM model** $z(t)$ [`AMFMmodel`] by evoking a pre-defined plotting recipe by calling `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/) with an *AM--FM model* $z(t)$ [`AMFMmodel`] and a time range.
```@example
using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->1.0, t->100t, 0.1)
πΆβ = AMFMtriplet(t->0.8cos(11t), t->100 + 70.5sin(5t), Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_models.png)
