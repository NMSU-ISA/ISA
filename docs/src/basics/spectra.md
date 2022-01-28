# Instantaneous Spectra

A **component set** `compSet` maps to an instantaneous spectrum (IS).

The two-dimensional (2D) IS in the time-frequency coordinates for a signal expressed with set of canonical triplets  ${\mathscr{S}=\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}}\}$ is given by

$\mathcal{S}(t,\omega;\mathscr{S})  =  2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right)\,\!\delta\!\left(\vphantom{0^0}\omega-{\omega}_k(t)\vphantom{0^0}\right)$

and  three-dimensional (3D) IS in the time-frequency-real coordinates is given by

$\mathcal{S}(t,\omega,s;\mathscr{S}) = 2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right) \,\!{}^{2}\delta\!\left(\omega-\omega_k(t),s-s_k(t)\vphantom{0^0}\right)$

where $\delta(\cdot)$ is the [Dirac delta](https://en.wikipedia.org/wiki/Dirac_delta_function).

## Visualizing Instantaneous Spectra

We can visualize a 3D IS using the pre-defined plotting recipes as follows. First, define a **component set**, then  call `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/)  along with a time range.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex1.png)

We can visualize the time-frequency plane associated with the IS (i.e. the 2D IS) by using the parameter `view`, which is an orthogonal projections of the 3D IS.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆,timeaxis=0.0:0.001:3.0,view="TF",
left_margin=15Plots.mm, margin=5Plots.mm)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex2.png)
