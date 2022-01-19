module ISA

include("components/analyticComponents.jl")
export AMFMtriplet, AMFMcomp

include("models/analyticModels.jl")
export compSet, AMFMmodel

include("models/fourierSeries.jl")
export fourierSeries

include("components/numericalComponents.jl")
export latentSig, latentComp, numComp, numTriplet

include("models/numericalModels.jl")
export numSet, numModel

include("demod/demodulation.jl")
export derivApprox, AMFMdemod

include("latent/latentSignalAnalysis.jl")
export latentSig, latentComp

include("plots/GRrecipes.jl")

end # module
