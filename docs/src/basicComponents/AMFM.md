## Amplitude Modulation--Frequency Modulation (AM--FM) Components

The most general form of a time-frequency component is an  **Amplitude Modulation--Frequency Modulation (AM--FM) component** $\psi_0(t;\mathscr{C}_0)$.

An AM--FM component has a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0(t),\omega_0(t), \phi_0\vphantom{0^0}\right\}$

and a component of the form

$\psi_0 \left( t ; \mathscr{C}_0 \vphantom{0^0}\right) = a_0(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_0(\tau)\mathrm{d}\tau +\phi_0\right] \right).$

The Argand diagram for the aforementioned component along with the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S})=2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right) \,\!{}^{2}\delta\!\left(\omega-\omega_0(t),s-s_0(t)\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

and 2D IS (i.e. time-frequency plane)

$\mathcal{S}(t,\omega;\mathscr{S})=  2 \pi  \psi_0\left( t ; \mathscr{C}_0 \vphantom{0^0}\right)\,\!\delta\!\left(\vphantom{0^0}\omega-{\omega}_0(t)\vphantom{0^0}\right),~\mathscr{S} = \{\mathscr{C}_0\}$

can be visualized.


### Example 1
For one choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->t^2,t->2cos(10t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->t^2,t->2cos(10t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM2.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->t^2,t->2cos(10t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM3.png)


### Example 2

For another choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(t),t->cos(5t)+50,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM4.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(t),t->cos(5t)+50,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)

```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM5.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(t),t->cos(5t)+50,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM6.png)


### Example 3

For another choice of parameters of the canonical triplet, we have the following Argand Diagram for $\psi_0(t;\mathscr{C}_0)$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```

![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM7.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM8.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFM9.png)
