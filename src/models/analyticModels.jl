#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

# ----------------------
# COMPONENT SET
# ----------------------
"""
    S = compSet([C₁,C₂,…,Cₖ])
    S = compSet([ψ₁,ψ₂,…,ψₖ])

Create a 'compSet' paramtertized by a vector of 'AMFMtriplet'.

# Examples
```jldoctest
julia>

<EXAMPLE HERE>

```
"""
struct compSet
  S::Vector{AMFMtriplet}
end

# CONSTRUCTIONS
function compSet(W::Vector{AMFMcomp})
  temp = []
  for i ∈ 1:length(W)
    push!(temp,W[i].C)
  end
  return compSet(Vector(temp))
end

# ----------------------
# AM--FM MODEL
# ----------------------
"""
    z = AMFMmodel(S)
    z = AMFMmodel([ψ₁,ψ₂,…,ψₖ])

Create a 'AMFMmodel' paramtertized by a 'compSet'.

# Examples
```jldoctest
julia>

<EXAMPLE HERE>

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
