using ISA
C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
C₂ = AMFMtriplet(t->2*t,ω->20,2.0)
S1=compSet([C₀,C₁])

ψ₀ = AMFMcomp(C₀)
ψ₁ = AMFMcomp(C₁)
S2=compSet([ψ₀,ψ₁])

z1=AMFMmodel([ψ₀,ψ₁])
z2=AMFMmodel([C₀,C₁,C₂])
z=AMFMmodel(S1)
z2(3.0)
z1(2.0)
z1(collect(1:2))
