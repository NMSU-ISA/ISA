#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

"""
    S = compSet([C₁,C₂,…,Cₖ])
    S = compSet([ψ₁,ψ₂,…,ψₖ])

Create a *component set* 'compSet' paramtertized by vector of AMFMtriplets.

# Examples
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
 𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
```
Create a *component set* 'compSet' paramtertized by vector of numerical AM--FM components.

# Examples
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 ψ₀ = AMFMcomp(𝐶₀)
 𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
 ψ₁ = AMFMcomp(𝐶₁)
 𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
 ψ₂ = AMFMcomp(𝐶₂)
 𝑆 = compSet([ψ₀,ψ₁,ψ₂])
```
"""
struct compSet
  S::Vector{AMFMtriplet}
end

# CONSTRUCTIONS
function compSet(V::Vector{AMFMcomp})
  return compSet([ψ.C  for ψ ∈ V])
end

# DISPLAY
Base.show(io::IO, x::compSet) = print(io, "component set")

"""
    z = AMFMmodel(S)
    z = AMFMmodel([ψ₁,ψ₂,…,ψₖ])
    z = AMFMmodel([C₁,C₂,…,Cₖ])

Create a 'AMFMmodel' paramtertized by a 'compSet'.

# Examples
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
```
Another convenient way to create a 'AMFMmodel' paramtertized
by vector of numerical AM--FM components.

# Examples
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 ψ₀ = AMFMcomp(𝐶₀)
 𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
 ψ₁ = AMFMcomp(𝐶₁)
 𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
 ψ₂ = AMFMcomp(𝐶₂)
 z = AMFMmodel([ψ₀,ψ₁,ψ₂])
```
Another convenient way to create a 'AMFMmodel' paramtertized
by vector of AMFMtriplets.

# Examples
```@example
using ISA
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
z = AMFMmodel([𝐶₀,𝐶₁,𝐶₂])
```
"""
mutable struct AMFMmodel
  S::compSet
end

# CONSTRUCTIONS
function AMFMmodel(W::Vector{AMFMcomp})
        return AMFMmodel(compSet(W))
end
function AMFMmodel(X::Vector{AMFMtriplet})
  return  AMFMmodel(compSet(X))
end

# METHODS
function (z::AMFMmodel)(t::Vector{<:Real})
  out = zeros(size(t))
  for k∈1:length(z.S.S)
    ψ = AMFMcomp(z.S.S[k])
    out += ψ(t)
  end
  return out
end
function (z::AMFMmodel)(t::Real)
  return (z::AMFMmodel)([t])[1]
end
function (z::AMFMmodel)(t::StepRangeLen)
  return (z::AMFMmodel)(collect(t))
end
function (z::AMFMmodel)(t::UnitRange)
  return (z::AMFMmodel)(collect(t))
end

# DISPLAY
Base.show(io::IO, x::AMFMmodel) = print(io, "AM--FM model")
