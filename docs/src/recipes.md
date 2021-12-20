# Plotting Recipes

[Recipes](https://docs.juliaplots.org/latest/recipes/) are a way of defining visualizations in your own packages and code, without having to depend on [Plots](http://docs.juliaplots.org/latest/). The functionality relies on [RecipesBase](http://juliaplots.org/RecipesBase.jl/stable/), a super lightweight but powerful package which allows users to create advanced plotting logic without Plots.

## 3D Argand Diagrams
An [Argand Diagram](https://mathworld.wolfram.com/ArgandDiagram.html) is a geometric representation of a complex number. We provided a way that allows users to visualize AM-FM components using the pre-defined plotting recipes to plot an Argand diagram as follows. First, define a canonical triplet, then call `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/)  along with a time range.
### Example
For one choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM4.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)

```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM5.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM6.png)


## Instantaneous Spectra
An [Instantaneous Spectrum](https://web.nmsu.edu/~spsandov/ISA/literature.html#openModal1) allows visualization of multiple aspects of the signal model simultaneously, including both magnitude and phase of each signal component. While it may take some time to become comfortable with the 3D visualization, we believe it has significant advantages in terms of interpretability over other time-frequency visualizations.

We can visualize a 3D IS using the pre-defined plotting recipes as follows. First, define a component set, then  call `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/)  along with a time range.
### Example
For a this choice of parameters of the component set, we have the following Argand Diagram for $z(t;\mathscr{S})$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex0.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex2.png)
