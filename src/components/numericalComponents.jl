#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

# ----------------------
# NUMERICAL COMPONENT
# ----------------------
"""
    Ψ = numComp(Ψ, t, fs)
    Ψ = numComp(Ψ, t)
    Ψ = numComp(Ψ, fs)
    Ψ = numComp(Ψ)

Create a 'numComp' consisting of a complex-valed signal `Ψ`, and time index `t`, and sampling frequency `fs`.

# Examples
```jldoctest
julia>

<EXAMPLE HERE>

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

# DISPLAY
Base.show(io::IO, x::numComp) = print(io, "numerical AM--FM component")

# ----------------------
# DEMODULATED COMPONENT
# ----------------------
"""
    𝚿 = demodComp(Ψ, t, fs, a, ω, s, σ, θ)

Create a 'demodComp'.

# Examples
```jldoctest
julia>

<EXAMPLE HERE>

```
"""
struct demodComp
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
Base.show(io::IO, x::demodComp) = print(io, "demodulated AM--FM component")
