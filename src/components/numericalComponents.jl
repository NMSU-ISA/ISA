#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

"""
    𝚿 = numComp(Ψ, t, fs)
    𝚿 = numComp(Ψ, t)
    𝚿 = numComp(Ψ, fs)
    𝚿 = numComp(Ψ)

Create a 'numComp' consisting of a complex-valed signal `Ψ`, and time index `t`, and sampling frequency `fs`.

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
```
"""
struct numComp
  Ψ::Vector{ComplexF64}
  t::Vector{Float64}
  fs::Real
end

# CONSTRUCTIONS
numComp(Ψ::Vector{ComplexF64}, fs::Real) = numComp(Ψ, collect(0:length(Ψ)-1)/fs, fs)
numComp(Ψ::Vector{ComplexF64}, t::Vector{Float64}) = numComp(Ψ, t, 1/(t[2]-t[1]) )
numComp(Ψ::Vector{ComplexF64}, t::StepRangeLen) = numComp(Ψ, collect(t) )
numComp(Ψ::Vector{ComplexF64}) = numComp(Ψ, collect(0:length(Ψ)-1), 1.0)

# METHODS
function (𝚿::numComp)(t::Vector{<:Int})
  return 𝚿.Ψ[t]
end
function (𝚿::numComp)(t::Int)
  return 𝚿.Ψ[t]
end
function (𝚿::numComp)(t::StepRangeLen)
  return 𝚿.Ψ[t]
end
function (𝚿::numComp)(t::UnitRange)
  return 𝚿.Ψ[t]
end

# DISPLAY
Base.show(io::IO, x::numComp) = print(io, "complex-valed component observation")

"""
    𝐂 = numTriplet( )

Create a 'numTriplet'...

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
```
"""
struct numTriplet
  Ψ::Vector{ComplexF64}
  t::Vector{Float64}
  fs::Float64
  a::Vector{Float64}
  ω::Vector{Float64}
  s::Vector{Float64}
  σ::Vector{Float64}
  θ::Vector{Float64}
end

# DISPLAY
Base.show(io::IO, x::numTriplet) = print(io, "numerical AM--FM triplet")
