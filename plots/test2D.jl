using ISA
using Plots

include("..//plots//viridis.jl")

cmap
# define 𝐶₀
a₀(t) = exp(-t^2)
ω₀(t) = 100
φ₀ = 0
ψ₀ = AMFMcomp(a₀,ω₀,φ₀)

t = 0.0:0.005:2.0
plot(t,ψ₀.a,xlab="time",ylab="amplitude",background_color=cmap[1])

plot(ψ₀)

@recipe function temp(ψ₀::AMFMcomp; t = 0.0:0.005:2.0)
    # set a default value for an attribute with `-->`
    xlab --> "time"
    ylab --> "amplitude"
    title --> "rad/s"
    @series begin
        seriestype := :path
        primary := false
        linecolor := nothing
        fillcolor := :lightgray
        fillalpha := 0.5
        background_color := cmap[1]
        ψ₀.a, t
    end
    ψ₀.a, t
end

plot(ψ₀)
