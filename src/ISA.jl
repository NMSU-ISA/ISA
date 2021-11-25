module ISA

include("components/basicComps.jl")
export AMFMtriplet, AMFMcomp

include("models/basicModels.jl")
export compSet, AMFMmodel

include("../plots/GRrecipes.jl")

end # module
