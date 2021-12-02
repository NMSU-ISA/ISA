# Instantaneous Spectra

A **component set** `compSet` maps to an instantaneous spectrum (IS).

The two-dimensional (2D) IS in the time-frequency coordinates for a signal expressed with set of canonical triplets  ${\mathscr{S}=\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}}\}$ is given by

$\mathcal{S}(t,\omega;\mathscr{S})  =  2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right)\,\delta\left(\vphantom{0^0}\omega-{\omega}_k(t)\vphantom{0^0}\right)$

and  three-dimensional (3D) IS in the time-frequency-real coordinates is given by

$\mathcal{S}(t,\omega,s;\mathscr{S}) = 2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right) ~{}^{2}\delta\left(\omega-\omega_k(t),s-s_k(t)\vphantom{0^0}\right).$


## Visualizing an Instantaneous Spectrum

We can visualize a 3D IS as follows. First, define a **component set**, then pass it to the 'plot()' along with the time range.
```@example
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.005:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex1.png)

We can obtain a 2D IS plot via an orthographic projection of the 3D IS
```@example
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.005:3.0, camera=(0,90), zlabel="", zticks=:false,  left_margin=15Plots.mm, margin=5Plots.mm, yrotation = 90)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex2.png)
