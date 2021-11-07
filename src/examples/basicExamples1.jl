# Example - 1

# Illustrating the use of primary methods associated
# with each defined structure.

# Defining AMFMtriplet using input as a(t),ω(t), φ.
# Defining component set,S using vector of
# type AMFMtriplet.
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
S = compSet([C₀,C₁])
z = AMFMmodel(S)

# Example - 2

# Illustrating the use of 2nd method associated
# with AMFMcomp and compSet structure but defining
# the AMFMmodel with primary method of type compSet.

# Defining AMFMcomp using input as a(t),ω(t), φ.
# Defining component set,S using vector of type AMFMcomp.
# Defining AM-FM model using input of type compSet,S.

ψ₀ = AMFMcomp(a₀,ω₀,φ₀)
ψ₁ = AMFMcomp(a₁,ω₁,φ₁)
S = compSet([ψ₀,ψ₁])
z = AMFMmodel(S)

# Example - 3

# Illustrating the use of 2nd method associated
# with AMFMcomp and AMFMmodel structure.

# Defining AMFMcomp using input as a(t),ω(t), φ.
# Defining AM-FM model using vector of type AMFMcomp.

ψ₀ = AMFMcomp(a₀,ω₀,φ₀)
ψ₁ = AMFMcomp(a₁,ω₁,φ₁)
z = AMFMmodel([ψ₀,ψ₁])

# Example - 4

# Illustrating the use of 3rd method associated
# AMFMmodel structure.

# Defining AMFMtriplet using input as a(t),ω(t), φ.
# Defining AM-FM model using vector of type AMFMtriplet.

C₀ = AMFMtriplet(a₀,ω₀,φ₀)
C₁ = AMFMtriplet(a₁,ω₁,φ₁)
z = AMFMmodel([C₀,C₁])
