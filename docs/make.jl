using ISA
using Documenter

DocMeta.setdocmeta!(ISA, :DocTestSetup, :(using ISA); recursive=true)

makedocs(;
    modules=[ISA],
    authors="Hasanfcb <h.emadfcb@gmail.com> and contributors",
    repo="https://github.com/Hasanfcb/ISA.jl/blob/{commit}{path}#{line}",
    sitename="ISA.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Hasanfcb.github.io/ISA.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

#deploydocs(;
#    repo="github.com/Hasanfcb/ISA.jl",
#    devbranch="master",
#)


deploydocs(;
    repo="github.com/NMSU-ISA/ISA.jl",
#    devbranch="master",
)
