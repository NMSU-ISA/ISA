# Amplitude Modulation (AM) Components

An amplitude modulation (AM) component has constant instantaneous frequency

$\omega_0(t)\rightarrow \omega_0$

and thus corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0(t),\omega_0, \phi_0\vphantom{0^0}\right\}.$

```@example
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM1.png")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM1.png)

```@exampleusing ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM2.png")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAM2.png)
