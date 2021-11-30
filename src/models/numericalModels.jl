
# ----------------------
# NUMERICAL MODEL
# ----------------------
struct numModel
  C::Vector{numComp}
  t::Vector{Float64}
  fs::Float64
end

# DISPLAY
Base.show(io::IO, x::numComp) = print(io, "numerical AM-FM model")

# ----------------------
# DEMODULATED MODEL
# ----------------------
struct demodModel
  D::Vector{demodComp}
  t::Vector{Float64}
  fs::Float64
end

# DISPLAY
Base.show(io::IO, x::numComp) = print(io, "demodulated numerical AM-FM model")
