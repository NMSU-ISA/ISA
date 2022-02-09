#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

using QuadGK #for numerical integration

"""
    C = AMFMtriplet(a, ω, φ)
    C = AMFMtriplet(a, ω)

Create a *canonical triplet* 'AMFMtriplet' consisting of an *instantenouse amplitude function* `a`, an *instantaneous frequency function* `ω`, and a *phase reference* `φ`.

Called with two inputs `a, ω`, this is equivalent to `AMFMtriplet(a, ω, 0.0)`.

# Examples
```@example
using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
```
"""
struct AMFMtriplet
  a::Function #real-valued function of time
  ω::Function #real-valued function of time
  φ::Real     #real-value
  function AMFMtriplet(a, ω, φ)
    if !(all(Base.return_types(a, (Int64,)).<:Real)) ; error("IA must be a real-valued function of one real variable"); end
    if !(all(Base.return_types(ω, (Int64,)).<:Real)) ; error("IF must be a real-valued function of one real variable"); end
    return new(a, ω, φ)
  end
end

# CONSTRUCTIONS
AMFMtriplet(a, ω) = AMFMtriplet(a, ω, zero(Float64))

# DISPLAY
Base.show(io::IO, x::AMFMtriplet) = print(io, "cannonical triplet")

"""
    ψ = AMFMcomp(C)
    ψ = AMFMcomp(a, ω, φ)
    ψ = AMFMcomp(a, ω)

Create a 'AMFMcomp' parameterized by a single 'AMFMtriplet'.

# Examples
```@example
 using ISA
 𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
 ψ₀ = AMFMcomp(𝐶₀)
```
Another convenient way to create a 'AMFMcomp' is by providing
an *instantenouse amplitude function* `a`,
an *instantaneous frequency function* `ω`, and a *phase reference* `φ`.

Called with two inputs `a, ω`, this is equivalent to `AMFMcomp(a, ω, 0.0)`.

```@example
using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
ψ₀ = AMFMcomp(a₀,ω₀,φ₀)
```
"""
struct AMFMcomp
  C::AMFMtriplet
end

# CONSTRUCTIONS
AMFMcomp(a, ω, φ) = AMFMcomp(AMFMtriplet(a, ω, φ))
AMFMcomp(a, ω) = AMFMcomp(AMFMtriplet(a, ω, 0.0))

# METHODS
function (ψ::AMFMcomp)(t::Vector{<:Real})
  a, ω, φ = ψ.C.a, ψ.C.ω, ψ.C.φ
  temp = quadgk.(ω, 0.0, t)
  θ = [ temp[i][1] for i in 1:length(t) ]
  a.(t) .* exp.( 1im .* ( θ .+ φ ) )
end
function (ψ::AMFMcomp)(a::Function,ω::Function,φ::Real)
   return AMFMcomp(AMFMtriplet(a, ω, φ))
end
function (ψ::AMFMcomp)(t::Real)
  return (ψ::AMFMcomp)([t::Real])[1]
end
function (ψ::AMFMcomp)(t::StepRangeLen)
  return (ψ::AMFMcomp)(collect(t))
end
function (ψ::AMFMcomp)(t::UnitRange)
  return (ψ::AMFMcomp)(collect(t))
end

# DISPLAY
Base.show(io::IO, x::AMFMcomp) = print(io, "AM--FM component")
