using ISA
a₀(t) = exp(-t^2)
ω₀(t) = 2.0*t
φ₀ = 0.0

a₁(t) = cos.(t)
ω₁(t) = 10*exp(-t)
φ₁ = 0.1

C₀ = AMFMtriplet(a₀,ω₀,φ₀)
C₁ = AMFMtriplet(a₁,ω₁,φ₁)

ψ₀ = AMFMcomp(C₀)
ψ₁ = AMFMcomp(C₁)

#Evaluating the AM-FM components at a time instant
julia> t₀ = 2.0;
julia> ψ₀(t₀)
-0.01197190052166259 - 0.013861321214152955im

julia> ψ₁(t₀)
0.3240729773035514 - 0.261064924778887im
