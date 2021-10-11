using ISA
using Documenter

push!(LOAD_PATH,"../src/")

DocMeta.setdocmeta!(ISA, :DocTestSetup, :(using ISA); recursive=true)

makedocs(;
    modules=[ISA],
    authors="Steven Sandoval, Hasan AL-Shammari, Mamta Dalal",
    repo="https://github.com/NMSU-ISA/ISA.jl/blob/{commit}{path}#{line}",
    sitename="ISA.jl",
    fformat=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/NMSU-ISA/ISA.jl",
        assets=String[],
    ),

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
    assets=String[],
)


deploydocs(;
    repo="github.com/NMSU-ISA/ISA.jl",
#    devbranch="master",
)
