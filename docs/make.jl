push!(LOAD_PATH,"../src/")
push!(LOAD_PATH,"../docs/")

using Documenter, ISA

makedocs(;
    modules=[ISA],
    authors="Steven Sandoval, Hasan Al-Shammari, Mamta Dalal",
    sitename="ISA.jl",
    format=Documenter.HTML(),
    pages=[
        "Home" => "home.md",
        "ISA Basics" =>
                    ["Cannonical Triplets and Component Sets"   => "basics/triplets.md",
                     "AM--FM Components"     => "basics/components.md",
                     "AM--FM Models"         => "basics/models.md",
                     "Instantaneous Spectra" => "basics/spectra.md",],
        "Numerical ISA" =>
                    ["Numerical Components"     => "numerical/componentsNumerical.md",],
        "Index" => "index.md",
        "Citation" => "cite.md",
    ],
    repo="https://github.com/NMSU-ISA/ISA.jl/blob/{commit}{path}#{line}",
    assets=String[],
)

deploydocs(;
    repo="github.com/NMSU-ISA/ISA",
    devurl = "dev"
)
