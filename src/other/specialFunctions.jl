#unit step function
"""
    x = u(t::Float64)::Float64

Define a *unit step function* 'u' consisting of argument t of type Float64.
The unit step function, 'u' returns the value 1.0 for
non-negative input argument, t otherwise returns 0.0.
# Examples
```@example
using ISA
t = 2.5
x = u(t-1.725)
```
"""
function u(t::Float64)::Float64 #unit step function
    return ifelse( t < 0, zero(t), one(t) )
end
"""
    f = 𝒩ᵤ(x::Float64; μ::Float64, σ::Float64)::Float64

Define an unnormalized *Gaussian function* '𝒩ᵤ' consisting of
argument x (input data), μ (mean), and σ (standard devivation)
of type Float64.

# Examples
```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
f = 𝒩ᵤ(x::Float64; μ, σ)
```
"""#unnormalized Gaussian function
function 𝒩ᵤ(x::Float64; μ::Float64, σ::Float64)::Float64
    return exp(-0.5 * ((x - μ) / σ)^2)
end

"""
    f = 𝒩(x::Float64; μ::Float64, σ::Float64)::Float64

Define a normalized *Gaussian function* '𝒩' consisting of
argument x (input data), μ (mean), and σ (standard
devivation) of type Float64.

# Examples
```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
f = 𝒩(x::Float64; μ, σ)
```
"""#normalized Gaussian function
function 𝒩(x::Float64; μ::Float64, σ::Float64)::Float64
    return 1 / (σ * sqrt(2 * π)) * exp(-0.5 * ((x - μ) / σ)^2)
end

"""
    x = δn(t::Float64,σ::Float64=1.0e-11)::Float64

Define a *Dirac delta function*, 'δn' using unnormalized Gaussian approximation, consisting of
argument t, with zero mean (μ=0.0), and σ, standard
devivation of type Float64.

# Examples
```@example
using ISA
t = 1.5
σ = 1.0e-11
x = δn(t, σ)
```
"""#Dirac delta (Gaussian approximation) amplitude normalized
function δn(t::Float64,σ::Float64=1.0e-11)::Float64
   return 𝒩ᵤ(t, μ=0.0, σ=σ)
end

"""
    x = δ(t::Float64,σ::Float64=1.0e-11)::Float64

Define a *Dirac delta function*, 'δ' using normalised Gaussian approximation, consisting of
argument t, zero mean, μ=0.0, and σ, standard
devivation of type Float64. It returns an impulse of unit area.

# Examples
```@example
using ISA
t = 2.5
σ = 1.0e-11
x = δ(t, σ)
```
"""#Dirac delta (Gaussian approximation) unit area
function δ(t::Float64,σ::Float64=1.0e-11)::Float64
   return 𝒩(t, μ=0.0, σ=σ)
end
