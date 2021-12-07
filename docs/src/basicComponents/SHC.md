# Basic Components

## Simple Harmonic Components

A simple harmonic component (SHC), or Fourier component, has a constant instantaneous amplitude

$a_0(t)\rightarrow a_0$

and constant instantaneous frequency

$\omega_0(t)\rightarrow \omega_0.$

This special case corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0, \phi_0\vphantom{0^0}\right\}$

and a component of the form

$\psi_0(t;\mathscr{C}_0) = a_0 \mathrm{e}^{\,\mathrm{j}(\omega_0 t +\phi_0)}.$


This component along with the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S}),~\mathscr{S} = \{\mathscr{C}_0\}$

and 2D IS

$\mathcal{S}(t,\omega;\mathscr{S}),~\mathscr{S} = \{\mathscr{C}_0\}$

can be visualized.  

### Example 1
For one choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exSHC1.png)



```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exSHC2.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exSHC3.png)
