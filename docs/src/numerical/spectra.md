# Numerical Instantaneous Spectra

## Visualizing Numerical Instantaneous Spectra

We can visualize a 3D IS using the pre-defined plotting recipes as follows. First, define a **numerical component set**, then  call `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/).
```@julia
using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
ψ₁ = AMFMcomp(t->1.0, t->100t, 0.1)
ψ₂ = AMFMcomp(t->1+0.8cos(2t), t->100+70.5sin(t), π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp(ψ₀(t), fs)
𝚿₁ = numComp(ψ₁(t), fs)
𝚿₂ = numComp(ψ₂(t), fs)
𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)
𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
plot(𝐒)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_spectra1.png)


We can also visualize the IS corresponding to an individual **numerical canonical triplet** .
 ```@julia
using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2), t->200.0, 0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp(ψ₀(t), fs)
𝐂₀ = AMFMdemod(𝚿₀)
plot(𝐂₀)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_num_triplet1.png)
