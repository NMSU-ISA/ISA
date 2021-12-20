## Frequency Modulation (FM) Components

An **frequency modulation (FM) component** $\psi_0(t;\mathscr{C}_0)$ has constant instantaneous amplitude

$a_0(t)\rightarrow a_0.$

This *special case (of an AM--FM component)* corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0(t), \phi_0\vphantom{0^0}\right\}$

and a component of the form

$\psi_0(t;\mathscr{C}_0) = a_0 \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right).$

The Argand diagram for the aforementioned component along with the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S})=2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right) \,\!{}^{2}\delta\!\left(\omega-\omega_0(t),s-s_0(t)\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

and 2D IS (i.e. time-frequency plane)

$\mathcal{S}(t,\omega;\mathscr{S})=  2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right)\,\!\delta\!\left(\vphantom{0^0}\omega-{\omega}_0(t)\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

can be visualized.




### Example 1

For one choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM2.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM3.png)


### Example 2
For another choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM4.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM5.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM6.png)

### Example 3

For another choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10+t*cos(10t),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM7.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10+t*cos(10t),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM8.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10+t*cos(10t),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM9.png)
