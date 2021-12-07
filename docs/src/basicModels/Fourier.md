# Basic ISA

## Fourier Series

Consider a component set consisting of a set of harmonicly related SHCs

$\mathscr{S}\triangleq\left\{\cdots,\mathscr{C}_{-1},\mathscr{C}_0,\mathscr{C}_1,\cdots\right\},~\mathscr{C}_k = \left\{a_k,k\omega_0, \phi_k\vphantom{0^0}\right\},~k = 0,\pm 1,\pm 2,\ldots,\pm\infty .$

The AM--FM model corresponding to this set is a [Fourier Series](https://en.wikipedia.org/wiki/Fourier_series)

$z(t) = \sum\limits_{k=-\infty}^{\infty} a_k \mathrm{e}^{\,\mathrm{j}(k\omega_0 t +\phi_k)}$

The AM--FM model corresponding to a partial sum (over $k$) of a Fourier series can be visualized. Additionally, the corresponding 3D IS

$\mathcal{S}(t,\omega,s;\mathscr{S})$

and 2D IS

$\mathcal{S}(t,\omega;\mathscr{S})$

can also be visualized.

### Example 1
Consider a signal $z(t)$ which consists of a Dirac delta impulse train with fundamental period $T$.

$z(t) = \sum\limits_{k=-\infty}^{\infty}\delta(t-kT)$

We can represent this signal with component set consisting of a set of harmonicly related SHCs

$\mathscr{S}\triangleq\left\{\cdots,\mathscr{C}_{-1},\mathscr{C}_0,\mathscr{C}_1,\cdots\right\},~\mathscr{C}_k = \left\{a_k,k\omega_0, \phi_k\vphantom{0^0}\right\},~k = 0,\pm 1,\pm 2,\ldots,K.$

where

$a_k = \mathrm{abs}(1/T)~~~\mathrm{and}~~~\phi_k= \mathrm{arg}(1/T).$

For a this choice of parameters of the component set, we have the following Argand Diagram, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$. Keep in mind, we are only considering a finite number of components $k = 0,\pm 1,\pm 2,\ldots,K$ not $k = 0,\pm 1,\pm2,\ldots,\pm\infty$.

```julia
using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0, ylims=(-1.0,1.0))
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier1.png)

```julia
using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier2.png)

```julia
using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier3.png)


### Example 2

Consider a signal $z(t)$ which consists of a
the periodic square wave (fundamental period $T$) with a 50% duty cycle where one period is defined by

$z(t) = \begin{cases}
        1, &   |t|<T/4  \\
        0, &   T/4<|t|<T/2        
        \end{cases}.$

We can represent this signal with component set consisting of a set of harmonicly related SHCs

$\mathscr{S}\triangleq\left\{\cdots,\mathscr{C}_{-1},\mathscr{C}_0,\mathscr{C}_1,\cdots\right\},~\mathscr{C}_k = \left\{a_k,k\omega_0, \phi_k\vphantom{0^0}\right\},~k = 0,\pm 1,\pm 2,\ldots,K .$

where

$a_k = \mathrm{abs}\left(\frac{\sin(k\pi/2)}{k\pi}\right)~~~\mathrm{and}~~~\phi_k= \mathrm{arg}\left(\frac{\sin(k\pi/2)}{k\pi}\right).$

For a this choice of parameters of the component set, we have the following Argand Diagram, 3D IS $\mathcal{S}(t,\omega,s;\mathscr{S})$, and 2D IS $\mathcal{S}(t,\omega;\mathscr{S})$. Keep in mind, we are only considering a finite number of components $k = 0,\pm 1,\pm 2,\ldots,K$ not $k = 0,\pm 1,\pm2,\ldots,\pm\infty$.

```julia
using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier4.png)


```julia
using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier5.png)


```julia
using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier6.png)


### Example 3

Consider a signal $z(t)$ which consists of a
the periodic square wave (fundamental period $T$) with a 50% duty cycle where one period is defined by

$z(t) = \begin{cases}
        1, &   0<|t|<T/3  \\
        \mathrm{e}^{\,\mathrm{j 2\pi/3}} , &   T/3<|t|<2T/3  \\
        \mathrm{e}^{\,\mathrm{j} 4\pi/3},  &   2T/3<|t|<T        
        \end{cases}.$

We can represent this signal with component set consisting of a set of harmonicly related SHCs

$\mathscr{S}\triangleq\left\{\cdots,\mathscr{C}_{-1},\mathscr{C}_0,\mathscr{C}_1,\cdots\right\},~\mathscr{C}_k = \left\{a_k,k\omega_0, \phi_k\vphantom{0^0}\right\},~k = 0,\pm 1,\pm 2,\ldots,K .$

where
