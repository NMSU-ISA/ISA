# Simple Harmonic Components / Fourier Components

## Simple Harmonic Components

A simple harmonic component (SHC) or Fourier component has a constant instantaneous amplitude

$a_0(t)\rightarrow a_0$

and constant instantaneous frequency

$\omega_0(t)\rightarrow \omega_0$

and thus corresponds to a canonical triplet with the form

$\mathscr{C}_0 = \left\{a_0,\omega_0, \phi_0\vphantom{0^0}\right\}$


and a component of the form

$\psi_0(t) = a_0 \mathrm{e}^{\,\mathrm{j}(\omega_0 t +\phi_0)}.$


```julia
using ISA, Plots, Interact
@manipulate for a= 0:0.05:1, ω = -5:0.1:20, φ = -pi:pi/50:pi
    a₀(t) = a
    ω₀(t) = ω
    φ₀ = φ
    𝐶₀ = AMFMcomp(a₀,ω₀,φ₀)
    plot(𝐶₀)
end
```
[IMAGE HERE]


## Fourier Series

Next consider a component set consisting of a set of harmonicly related SHCs

$\mathscr{S}\triangleq\left\{\cdots,\mathscr{C}_{-1},\mathscr{C}_0,\mathscr{C}_1,\cdots,\right\},~\mathscr{C}_k = \left\{a_k,k\omega_0, \phi_k\vphantom{0^0}\right\},~k = 0,\pm 1,\pm 2,\cdots .$

The AM--FM model corresponding to this set is a Fourier Series

$z(t) = \sum\limits_{k=-\infty}^{\infty} a_k \mathrm{e}^{\,\mathrm{j}(k\omega_0 t +\phi_k)}$

```julia
using ISA, Plots
T = 1.0
aₖ(k) = 1.0
kInds = collect(-25:25)
z = fourierSeries(T, aₖ, kInds)
plot(z; timeaxis=-1.0:0.001:1.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_exFourier.png)
