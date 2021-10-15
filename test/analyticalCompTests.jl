using ISA

C = AMFMtriplet(t->exp(-t^2),ω->100,0.0)
S = compSet([C,C])
ψ = AMFMcomp(C)

#a₀(t) = exp(-t^2)
#ω₀(t) = 2.0
#φ₀ = 0.0
#ψ1 = AMFMcomp(a₀,ω₀,φ₀)

ψ([2.0])
ψ(2.0)
ψ(1:10)


<<<<<<< Updated upstream


z = AMFMmodel(S)
z(1.0)

isaPlot3d_PlotsGR(z,collect(-1.0:0.001:1.0))
=======
z=AMFMmodel(S)
>>>>>>> Stashed changes
