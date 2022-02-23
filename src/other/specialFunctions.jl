
"""
    u(t::Float64)::Float64

Unit Step Function

``\\mathrm{u}(t)= \\begin{cases} 1, &   t \\geq 0 \\\\ 0, &   t < 0 \\end{cases}``

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
    𝒩ᵤ(x::Float64; μ::Float64, σ::Float64)::Float64

Unnormalized Gaussian Function

``\\mathcal{N}_\\mathrm{u}(x;\\mu,\\sigma) = \\exp\\left(-\\frac{1}{2}\\left(\\frac{x-\\mu}{\\sigma}\\right)^2\\right).``

# Examples
```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
𝒩ᵤ(x; μ, σ)
```
"""
function 𝒩ᵤ(x::Float64; μ::Float64, σ::Float64)::Float64
    return exp(-0.5 * ((x - μ) / σ)^2)
end

"""
    𝒩(x::Float64; μ::Float64, σ::Float64)::Float64

Unit Area Gaussian Function

``\\mathcal{N}(x;\\mu,\\sigma) = \\frac{1}{\\sqrt{2\\pi}\\sigma}\\exp\\left(-\\frac{1}{2}\\left(\\frac{x-\\mu}{\\sigma}\\right)^2\\right).``

# Examples
```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
𝒩(x; μ, σ)
```
"""
function 𝒩(x::Float64; μ::Float64, σ::Float64)::Float64
    return 1 / (σ * sqrt(2 * π)) * exp(-0.5 * ((x - μ) / σ)^2)
end

"""
    δn(t::Float64,σ::Float64=1.0e-11)::Float64

Normalized Dirac Delta Approximation

``δ_n(t) = \\exp\\left(-\\frac{1}{2}\\left(\\frac{t^2}{\\sigma^2}\\right)\\right). ``

# Examples
```@example
using ISA
t = 1.0e-10
σ = 1.0e-11
δn(t; σ)
```
"""
function δn(t::Float64,σ::Float64=1.0e-11)::Float64
   return 𝒩ᵤ(t, μ=0.0, σ=σ)
end

"""
    δ(t::Float64,σ::Float64=1.0e-11)::Float64

Dirac Delta Approximation

``δ(t) = \\frac{1}{\\sqrt{2\\pi}\\sigma}\\exp\\left(-\\frac{1}{2}\\left(\\frac{t^2}{\\sigma^2}\\right)\\right). ``

# Examples
```@example
using ISA
t = 1.0e-10
σ = 1.0e-11
δ(t; σ)
```
"""
function δ(t::Float64,σ::Float64=1.0e-11)::Float64
   return 𝒩(t, μ=0.0, σ=σ)
end
