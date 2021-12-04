# Simple Harmonic Components

A simple harmonic component (SHC), or Fourier component, has a constant instantaneous amplitude

$a_0(t)\rightarrow a_0$

and constant instantaneous frequency

$\omega_0(t)\rightarrow \omega_0.$

This special case corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0, \phi_0\vphantom{0^0}\right\}$


and a component of the form

$\psi_0(t;\mathscr{C}_0) = a_0 \mathrm{e}^{\,\mathrm{j}(\omega_0 t +\phi_0)}.$

Finally, the corresponding IS $\mathcal{S}(t,\omega,s;\mathscr{S}),~\mathscr{S} = \{\mathscr{C}_0\}$ can be visualized as follows.  

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourierComp.png)
