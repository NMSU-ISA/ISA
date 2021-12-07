## Amplitude Modulation (AM) Components

An **amplitude modulation (AM) component** $\psi_0(t;\mathscr{C}_0)$ has constant instantaneous frequency

$\omega_0(t)\rightarrow \omega_0.$

This *special case* corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0(t),\omega_0, \phi_0\vphantom{0^0}\right\}$

and a component of the form

$\psi_0(t;\mathscr{C}_0) = a_0(t) \mathrm{e}^{\,\mathrm{j}(\omega_0 t +\phi_0)}.$

The Argand diagram for the aforementioned component along with the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S})=2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right) \,{}^{2}\delta\!\left(\omega-\omega_0,s-s_0(t)\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

and 2D IS (i.e. time-frequency plane)

$\mathcal{S}(t,\omega;\mathscr{S})=  2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right)\,\delta\!\left(\vphantom{0^0}\omega-{\omega}_0\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

can be visualized.


### Example 1

For one choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM2.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM3.png)


### Example 2

For another choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.


```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.0005:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM4.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM5.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM6.png)
