
# ----------------------
# LATENT SIGNAL
# ----------------------
struct latentSig
  x::Vector{Float64}
  t::Vector{Float64}
  fs::Float64
end

# ----------------------
# LATENT COMPONENT
# ----------------------
struct latentComp
  s::Vector{Float64}
  t::Vector{Float64}
  fs::Float64
end
