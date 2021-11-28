using ISA, Plots

include(raw"..\..\plots\GRrecipes.jl")


a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0

a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1

a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π

C₀ = AMFMtriplet(a₀,ω₀,φ₀)
C₁ = AMFMtriplet(a₁,ω₁,φ₁)
C₂ = AMFMtriplet(a₂,ω₂,φ₂)
S = compSet([C₀,C₁,C₂])
z = AMFMmodel(S)

t = 0.0:0.005:2.0

plot(z)
