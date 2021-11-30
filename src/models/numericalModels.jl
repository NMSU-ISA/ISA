
# ----------------------
# NUMERICAL MODEL
# ----------------------
struct numModel
  C::Vector{numComp}
  t::Vector{Float64}
  fs::Float64
end

# ----------------------
# DEMODULATED MODEL
# ----------------------
struct demodModel
  D::Vector{demodComp}
  t::Vector{Float64}
  fs::Float64
end
