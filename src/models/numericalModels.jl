#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

"""
    𝐒 = numSet( )

Create a numerical component set 'numSet' by providing a vector of
numerical canonical triplets.

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)
𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
```
"""
struct numSet
  S::Vector{numTriplet}
end

# DISPLAY
function displayS(x)
  text = "\n"
  for i in 1:length(x.S)
    T = typeof(x.S[i])
    text *= "numerical canonical triplet #$(i)\n"
    for (name, typ) in zip(fieldnames(T), T.types)
        text *= "$name is $typ\n"
    end
    text *= "\n"
  end
  return text
end
Base.show(io::IO, x::numSet) = print(io, "numerical component set with $(length(x.S)) components$(displayS(x))")



"""
    𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])

Create a 'numModel' by providing a vector of numerical components
'numComp'.

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
```
"""
struct numModel
  𝚿ₖ::Vector{numComp}
end

# METHODS
function (𝐳::numModel)(t::Real)
  out = 0.0
  for 𝚿 ∈ 𝐳.𝚿ₖ
    if 𝚿.t[1]<=t<=𝚿.t[end]
      out += 𝚿(t)
    end
  end
  return out
end
function (𝐳::numModel)(t::Vector{<:Real})
  return 𝐳.(t)
end
function (𝐳::numModel)(t::StepRangeLen)
  return 𝐳.(collect(t))
end
function (𝐳::numModel)(t::UnitRange)
  return 𝐳.(collect(t))
end

# DISPLAY
Base.show(io::IO, x::numModel) = print(io, "numerical AM-FM model with $(length(x.𝚿ₖ)) components")
