using ISA, Plots

a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
φ₀ = 0.0

a₁(t) = cos.(t)
ω₁(t) = 10*exp(-t)
φ₁ = 0.1

C₀ = AMFMtriplet(a₀,ω₀,φ₀)
C₁ = AMFMtriplet(a₁,ω₁,φ₁)

S = compSet([C₀,C₁])
z = AMFMmodel(S)
t = 0.0:0.005:2.0
p1 = plot(t, real(z(t)), xlab="t", ylab="real",
legend = :false)
p2 = plot(t, imag(z(t)), xlab="t", ylab="imag",
legend = :false)
p = plot(p1, p2, layout = (2,1))
