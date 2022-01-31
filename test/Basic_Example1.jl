using ISA
C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
ψ₀ = AMFMcomp(C₀)
ψ₁ = AMFMcomp(C₁)
# Evaluating AM-FM components at a time instant
julia> t₀=2.0
julia> ψ₀(t₀)
-0.2380101972385678 + 0.34136393420900824im

julia> ψ₁(t₀)
-2.1909170408970735 + 3.3466225541442243im
