using ISA

C = AMFMtriplet(t->exp(-t^2),ω->100,0.0)
#S = compSet([C,C])
ψ = AMFMcomp(C)

a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
φ₀ = 0.0
C₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ = AMFMcomp(a₀,ω₀,φ₀)
#ψ₀= AMFMcomp(a₀,ω₀,φ₀)
t₀ = 1.0
t=collect(1:5)
ψ(t₀)
ψ(t)
ψ([2.0])
ψ(2.0)
ψ(1:10)

a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
C₁ = AMFMtriplet(a₁,ω₁,φ₁)


<<<<<<< Updated upstream

C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
S = compSet([C₀,C₁])

z = AMFMmodel(S)
z(3.0)

isaPlot3d_PlotsGR(z,collect(-1.0:0.001:1.0))
=======
z=AMFMmodel(S)
>>>>>>> Stashed changes
