using ISA
C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
S=compSet([C₀,C₁])
z=AMFMmodel(S)
# Evaluating AM-FM signal model at a time instant
julia> t₀=2.0
julia> z(t₀)
-2.4289272381356413 + 3.6879864883532325im
