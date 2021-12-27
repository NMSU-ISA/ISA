#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

using Dierckx #for interpolation

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
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
```
"""
struct numComp
  Ψ::Vector{ComplexF64}
  t::Vector{Float64}
  fs::Real
  s::Spline1D
  σ::Spline1D
end

# CONSTRUCTIONS
numComp(Ψ::Vector{ComplexF64}, t::Vector{Float64}, fs::Real) = numComp(Ψ, t, fs, Spline1D(t , real(Ψ)), Spline1D(t , imag(Ψ)))
numComp(Ψ::Vector{ComplexF64}, fs::Real) = numComp(Ψ, collect(0:length(Ψ)-1)/fs, fs)
numComp(Ψ::Vector{ComplexF64}, t::Vector{Float64}) = numComp(Ψ, t, 1/(t[2]-t[1]) )
numComp(Ψ::Vector{ComplexF64}, t::StepRangeLen) = numComp(Ψ, collect(t) )
numComp(Ψ::Vector{ComplexF64}) = numComp(Ψ, collect(0:length(Ψ)-1), 1.0)

# METHODS
function (𝚿::numComp)(t::Real)
  return ifelse(𝚿.t[1]<=t<=𝚿.t[end] ,𝚿.s(t)+1im*𝚿.σ(t),NaN)
end
function (𝚿::numComp)(t::Vector{<:Real})
  return [ifelse(𝚿.t[1]<=tₖ<=𝚿.t[end] ,𝚿.s(tₖ)+1im*𝚿.σ(tₖ),NaN) for tₖ∈t]
end
function (𝚿::numComp)(t::StepRangeLen)
  return [ifelse(𝚿.t[1]<=tₖ<=𝚿.t[end] ,𝚿.s(tₖ)+1im*𝚿.σ(tₖ),NaN) for tₖ∈t]
end
function (𝚿::numComp)(t::UnitRange)
  return [ifelse(𝚿.t[1]<=tₖ<=𝚿.t[end] ,𝚿.s(tₖ)+1im*𝚿.σ(tₖ),NaN) for tₖ∈t]
end

# DISPLAY
Base.show(io::IO, x::numComp) = print(io, "numerical AM--FM component")


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
Base.show(io::IO, x::numTriplet) = print(io, "numerical canonical triplet")
