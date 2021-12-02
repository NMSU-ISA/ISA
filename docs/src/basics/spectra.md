# Instantaneous Spectra

A **component set** `compSet` maps to an instantaneous spectrum (IS).

The two-dimensional (2-D) IS in the time-frequency coordinates for a signal expressed with set of canonical triplets  ${\mathscr{S}=\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}}\}$ is given by

$\mathcal{S}(t,\omega;\mathscr{S})  =  2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right)\,\delta\left(\vphantom{0^0}\omega-{\omega}_k(t)\vphantom{0^0}\right)$

and  three-dimensional (3-D) IS in the time-frequency-real coordinates is given by

$\mathcal{S}(t,\omega,s;\mathscr{S}) = 2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right) ~{}^{2}\delta\left(\omega-\omega_k(t),s-s_k(t)\vphantom{0^0}\right).$

Visualization for ISs are provided in the ISA module.

## Visualizing an Instantaneous Spectrum
We can visualize a 3-D IS as follows. First, define a **component set**. Then, ...

```@example
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])

plot(z) # default timeaxis
plot(z, timeaxis=0.0:0.005:3.0) # custom timeaxis

plot(𝑆)
plot(𝑆,timeaxis=0.0:0.005:3.0)

plot(ψ₀,timeaxis=0.0:0.005:2.0)
plot!(ψ₁,timeaxis=0.0:0.005:2.0)
plot!(ψ₂,timeaxis=0.0:0.005:2.0)

plot(𝐶₀,timeaxis=0.0:0.005:5.0)
plot!(𝐶₁,timeaxis=0.0:0.005:5.0)
plot!(𝐶₂,timeaxis=0.0:0.005:5.0)
```
