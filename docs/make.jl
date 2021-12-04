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
        "Instantaneous Spectral Analysis" =>
                    ["Cannonical Triplets and Component Sets"   => "basics/triplets.md",
                     "AM--FM Components"     => "basics/components.md",
                     "AM--FM Models"         => "basics/models.md",
                     "Instantaneous Spectra" => "basics/spectra.md",],
        "Basic Examples" =>
                    ["Fourier Components/Series"     => "examples/Fourier.md",
                     "AM Components"     => "examples/AM.md",
                     "FM Components"     => "examples/FM.md",
                     "AM--FM Components"     => "examples/AMFM.md",],
        "Numerical ISA" =>
                    ["Numerical AM--FM Components"     => "numerical/components.md",
                     "Numerical AM--FM Models"     => "numerical/models.md",],
        "Types/Methods/Functions" => "typesMethods.md",
        "Cite" => "cite.md",
    ],
    repo="https://github.com/NMSU-ISA/ISA.jl/blob/{commit}{path}#{line}",
    assets=String[],
)

deploydocs(;
    repo="github.com/NMSU-ISA/ISA",
    devurl = "dev"
)
