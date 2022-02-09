module ISA

include("components/analyticComponents.jl")
export AMFMtriplet, AMFMcomp

include("components/numericalComponents.jl")
export numComp, numTriplet

include("demod/demodulation.jl")
export derivApprox, AMFMdemod

include("models/analyticModels.jl")
export compSet, AMFMmodel

include("models/fourierSeries.jl")
export fourierSeries

include("models/numericalModels.jl")
export numSet, numModel

include("other/specialFunctions.jl")
export u, 𝒩ᵤ, 𝒩, δ, δn

include("plots/GRrecipes.jl")

end # module
