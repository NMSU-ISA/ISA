# Frequency Modulation (FM) Components

An frequency modulation (FM) component has constant instantaneous amplitude

$a_0(t)\rightarrow a_0$

and thus corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0(t), \phi_0\vphantom{0^0}\right\}.$

and a component of the form

$\psi_0(t) = a_0 \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right).$

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFM1.png)
