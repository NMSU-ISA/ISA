
## AM--FM Models

AM--FM models correspond to sets of canonical triplets of general form

$\mathscr{S}=\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\},~\mathscr{C}_k=\left\{a_k(t),\omega_k(t), \phi_k\vphantom{0^0}\right\},$

AM--FM components of general form

$\psi_k \left( t ; \mathscr{C}_k \vphantom{0^0}\right) = a_k(t) \exp\left(\mathrm{j} \left[\int_{-\infty}^{t} \omega_k(\tau)\mathrm{d}\tau +\phi_k\right] \right),$

and AM--FM signal models of general form

$z\left( t ; \mathscr{S} \vphantom{0^0}\right)  = \sum\limits_{k=0}^{K-1}\psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right).$

The Argand diagram for the aforementioned AM--FM model, the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S}) = 2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right) \,\!{}^{2}\delta\!\left(\omega-\omega_k(t),s-s_k(t)\vphantom{0^0}\right)$

and corresponding 2D IS (i.e. time-frequency plane)

$\mathcal{S}(t,\omega;\mathscr{S})  =  2 \pi \sum\limits_{k=0}^{K-1} \psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right)\,\!\delta\!\left(\vphantom{0^0}\omega-{\omega}_k(t)\vphantom{0^0}\right)$

can be visualized.


### Example 1
For a this choice of parameters of the component set, we have the following Argand Diagram for $z(t;\mathscr{S})$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$. Keep in mind, we are only considering a finite number of components $k = 0,\pm 1,\pm 2,\ldots,K$ not $k = 0,\pm 1,\pm2,\ldots,\pm\infty$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel1.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel2.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel3.png)

### Example 2

For another choice of parameters of the component set, we have the following Argand Diagram for $z(t;\mathscr{S})$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$. Keep in mind, we are only considering a finite number of components $k = 0,\pm 1,\pm 2,\ldots,K$ not $k = 0,\pm 1,\pm2,\ldots,\pm\infty$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel4.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel5.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel6.png)


### Example 3
For another choice of parameters of the component set, we have the following Argand Diagram for $z(t;\mathscr{S})$, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$. Keep in mind, we are only considering a finite number of components $k = 0,\pm 1,\pm 2,\ldots,K$ not $k = 0,\pm 1,\pm2,\ldots,\pm\infty$.

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel7.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel8.png)

```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exAMFMmodel9.png)
