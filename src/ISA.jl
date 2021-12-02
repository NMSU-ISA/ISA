module ISA

include("components/analyticComponents.jl")
export AMFMtriplet, AMFMcomp

include("models/analyticModels.jl")
export compSet, AMFMmodel

include("models/fourierSeries.jl")
export fourierSeries

include("components/numericalComponents.jl")
export latentSig, latentComp, numComp, demodComp

include("models/numericalModels.jl")
export numModel, demodModel

include("demod/demodulation.jl")
export derivApprox, AMFMdemod

include("latent/latentSignalAnalysis.jl")
export latentSig, latentComp

include("plots/GRrecipes.jl")
export timeFreq, timeReal, timeFreqReal, freqReal

end # module
