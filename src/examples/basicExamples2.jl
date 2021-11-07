# Evaluating the AM-FM model at a time instant
# of type Float64.
julia> t₀ = 2.0; z(t₀)
-0.14301691708182013 - 0.40883650170394287im

# Evaluating the AM-FM model over a step range
# of time instants.
julia> t=1.0:0.1:1.2; z(t)
3-element Vector{ComplexF64}:
 -0.22297667728629453 - 0.02816723727420639im
   0.1525504825286645 - 0.17212705030880993im
   0.3545611578416981 + 0.07197075870884703im

# Evaluating the AM-FM model at time instants
# of type Vector{Float64}.
julia> t = collect(1.0:3.0); z(t)
3-element Vector{ComplexF64}:
 -0.22297667728629453 - 0.02816723727420639im
 -0.14301691708182013 - 0.40883650170394287im
 -0.24970876450182436 + 0.9580627692632645im
