# Example - 1 (Using primary methods)
# Defining AMFMtriplet using input as a(t),ω(t), φ.
# Defining component set,S using vector of type AMFMtriplet.
# Defining AM-FM model using input of type compSet,S.

using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
φ₀ = 0.0
C₀ = AMFMtriplet(a₀,ω₀,φ₀)
a₁(t) = cos.(t)
ω₁(t) = 10
φ₁ = 0.1
C₁ = AMFMtriplet(a₁,ω₁,φ₁)
S=compSet([C₀,C₁])
z=AMFMmodel(S)
