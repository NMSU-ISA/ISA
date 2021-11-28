push!(LOAD_PATH,"../src/")
push!(LOAD_PATH,"../docs/")

using Documenter, ISA

makedocs(;
    modules=[ISA],
    authors="Steven Sandoval, Hasan AL-Shammari, Mamta Dalal",
    sitename="ISA",
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "ISA Basics" =>
                    ["Cannonical Triplets and Component Sets"   => "basics/triplets.md",
                     "AM--FM Components"     => "basics/components.md",
                     "AM--FM Models"         => "basics/models.md",
                     "Instantaneous Spectra" => "basics/spectra.md",
                     "Numerical Components"     => "basics/componentsNumerical.md",],
        "Decomposition" => "decomposition/EMD.md",
        "Distributions" => "distributions/STFT.md",
        "Citation" => "cite.md",
    ],
    repo="https://github.com/NMSU-ISA/ISA.jl/blob/{commit}{path}#{line}",
    assets=String[],
)

deploydocs(;
    repo="github.com/NMSU-ISA/ISA.jl",
    devurl = "devt"
)
