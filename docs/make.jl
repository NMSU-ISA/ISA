push!(LOAD_PATH,"../src/")
push!(LOAD_PATH,"../docs/")

using Documenter, ISA

makedocs(;
    modules=[ISA],
    authors="Steven Sandoval, Hasan Al-Shammari, Mamta Dalal",
    sitename="ISA.jl",
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "ISA Theory" => "theory.md",
        "ISA Basics" =>
                    ["Cannonical Triplets and Component Sets"   => "basics/triplets.md",
                     "AM--FM Components"     => "basics/components.md",
                     "AM--FM Models"         => "basics/models.md",
                     "Instantaneous Spectra" => "basics/spectra.md",],
        "Numerical ISA" =>
                    ["Numerical Components"     => "numerical/componentsNumerical.md",],
        "Types/Methods/Functions" => "typesMethods.md",
        "References" => "cite.md",
    ],
    repo="https://github.com/NMSU-ISA/ISA.jl/blob/{commit}{path}#{line}",
    assets=String[],
)

deploydocs(;
    repo="github.com/NMSU-ISA/ISA",
    devurl = "dev"
)
