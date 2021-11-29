using ISA
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

#Evaluating the AM-FM signal model at a time instant
julia> t₀ = 2.0;
julia> z(t₀)
0.3121010767818888 - 0.27492624599303994im
