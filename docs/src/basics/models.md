# AM--FM Models
A **component set**  maps to an **AM--FM model** `AMFMmodel`.

$z\left( t ; \mathscr{S} \vphantom{0^0}\right)  \triangleq \sum\limits_{k=0}^{K-1}\psi_k\left( t ; \mathscr{C}_k \vphantom{0^0}\right),~\mathscr{S}\triangleq\left\{\mathscr{C}_0,\mathscr{C}_1,\cdots,\mathscr{C}_{K-1}\vphantom{0^0}\right\}$

This mapping is provided in the ISA module.
```
using ISA
```


## Defining an AM--FM Model
We can define an **AM--FM model** as follows. First, define a **component set**, 𝑆 by
passing an object of type `AMFMtriplet` to the function `compSet`.
```
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)

a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)

𝑆 = compSet([𝐶₀,𝐶₁])
```
Then, pass the **component set**, 𝑆 to the function `AMFMmodel()`.
```
julia> z = AMFMmodel(𝑆)
AMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1)]))
```

We also allow an **AM--FM model** `AMFMmodel` to be defined by passing an array of `AMFMcomp` to the function `AMFMmodel()`. First, define the components.
```
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
ψ₀ = AMFMcomp(a₀,ω₀,φ₀)

a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
ψ₁ = AMFMcomp(a₁,ω₁,φ₁)

a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π
ψ₂ = AMFMcomp(a₂,ω₂,φ₂)
```
Then pass the array of `AMFMcomp` to the function `AMFMmodel()`.
```
z = AMFMmodel([ψ₀,ψ₁,ψ₂])
```


## Evaluating an AM--FM Model
Once an  **AM--FM model** `AMFMmodel` is defined it can be evaluated at a time instant `Float64`
```
julia> t₀ = 0.15
julia> z(t₀)
1.9115881433508801 + 0.4998495708278627im
```
or over a range of time instants `Array{Float64,1}`.
```
julia> t = 0.0:0.25:1.0
julia> z(t)
5-element Vector{ComplexF64}:
  1.9950041652780257 + 0.09983341664682815im
   1.740533956870742 + 0.8512794956108032im
  0.6397945459984344 + 1.631061619726915im
 -0.9335680061860003 + 0.7954494882259775im
 0.22488587703875393 - 0.5913028530884702im
```

Another example of evaluating an **AM--FM model** over a range of time instants using the `Plots` module follows.
```
using Plots
t = 0.0:0.005:2.0
p1 = plot(t, real(z(t)), xlab="t", ylab="real", legend = :false)
p2 = plot(t, imag(z(t)), xlab="t", ylab="imag", legend = :false)
plot(p1, p2, layout = (2,1))
```
[![](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/ModelEval.png)](https://raw.githubusercontent.com/ssandova/ISAdocs/master/images/ModelEval.png)
