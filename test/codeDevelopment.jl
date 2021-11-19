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

#########################
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

t₀ = 2.0
z(t₀)

C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
ψ₀ = AMFMcomp(C₀)
ψ₁ = AMFMcomp(C₁)
S=compSet([ψ₀,ψ₁]) # Method 2 for calling compSet
z = AMFMmodel(S)
z(2.0)
z([1.0,5.0])
z(collect(1:3))
z(1:0.1:2)


C₀ = AMFMtriplet(t->sin.(t),ω->10,0.1)
C₁ = AMFMtriplet(t->2,ω->100,0.0)
S = compSet([C₀,C₁])  # Method 1 for calling compSet [Primary method]
z = AMFMmodel(S)
z([2.0,3.0])
z(collect(1:3))
z(1.0:0.1:1.2)


using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
ϕ₀ = 0.0
a₁(t) = cos.(t)
ω₁(t) = 10*exp(-t)
ϕ₁ = 0.1
C₀ = AMFMtriplet(a₀,ω₀,ϕ₀)
C₁ = AMFMtriplet(a₁,ω₁,ϕ₁)
ψ₀ = AMFMcomp(C₀)
ψ₁ = AMFMcomp(C₁)
t₀ = 2.0
ψ₁(t₀)
