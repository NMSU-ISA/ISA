

# ----------------------
# NUMERICAL MODEL
# ----------------------
"""
    Ξ = numModel([𝛹₀,𝛹₁,𝛹₂],t,fs)

Create a *numerical AM-FM Model* 'numModel' paramtertized by set of canonical triplets stored in a vector of 'AMFMtriplet'.

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect{0:1/fs:1}
𝛹₀ = numComp( ψ₀(t), fs )
𝛹₁ = numComp( ψ₁(t), fs )
𝛹₂ = numComp( ψ₂(t), fs )
Ξ = numModel([𝛹₀,𝛹₁,𝛹₂],t,fs)
```
"""
struct numModel
  C::Vector{numComp}
  t::Vector{Float64}
  fs::Float64
end

# DISPLAY
Base.show(io::IO, x::numModel) = print(io, "numerical AM-FM model")

# ----------------------
# DEMODULATED MODEL
# ----------------------
"""
    𝚿 = demodMode(Ξ)

Create a *demodulated AM-FM Model* 'demodModel' ...

# Examples
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect(0:1/fs:1)
𝛹₀ = numComp( ψ₀(t), fs )
𝛹₁ = numComp( ψ₁(t), fs )
𝛹₂ = numComp( ψ₂(t), fs )
Ξ = numModel([𝛹₀,𝛹₁,𝛹₂],t,fs)
𝚿 = AMFMdemod(Ξ,t,fs)
```
"""
struct demodModel
  D::Vector{demodComp}
  t::Vector{Float64}
  fs::Float64
end

# DISPLAY
Base.show(io::IO, x::demodModel) = print(io, "demodulated AM-FM model")
