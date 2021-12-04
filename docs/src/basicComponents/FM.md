# Frequency Modulation (FM) Components

An frequency modulation (FM) component has constant instantaneous amplitude

$a_0(t)\rightarrow a_0$

and thus corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0(t), \phi_0\vphantom{0^0}\right\}.$

and a component of the form

$\psi_0(t;\mathscr{C}_0) = a_0 \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right).$

Finally, the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S}),~\mathscr{S} = \{\mathscr{C}_0\}$

and 2D IS

$\mathcal{S}(t,\omega;\mathscr{S}),~\mathscr{S} = \{\mathscr{C}_0\}$

can be visualized as follows.  

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM1.png)

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
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM2.png)

For another choice of parameters of the canonical triplet, we have the following 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$ and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM3.png)

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
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM4.png)
