

function fourierSeries(T::Real, aₖ::Function, kInds::Array{Int,1}=Vector(-1000:1000))
  components = []
  for k in kInds
    ia(t) = aₖ(k)
    ω(t) = k / T
    push!(components, AMFMcomp(ia, ω, 0))
  end
  return AMFMmodel(components)
end
