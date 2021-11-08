# using ISA
# using Plots
#
# include(".//plotsGRBackend.jl")
#
# #DEFINE 0th CANONICAL TRIPLET
# a₀(t) = exp(-t^2)
# ω₀(t) = 100
# φ₀ = 0
# 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
# #DEFINE 0th COMPONENT
# ψ₀ = AMFMcomp(𝐶₀)
# #DEFINE 1st CANONICAL TRIPLET
# a₁(t) = 1
# ω₁(t) = 10*t
# φ₁ = π
# 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
# #DEFINE 1st COMPONENT
# ψ₁ = AMFMcomp(𝐶₁)
# #DEFINE 2nd CANONICAL TRIPLET
# a₂(t) = 0.8*cos(2t)
# ω₂(t) = 10 + 7.5*sin(t)
# φ₂ = π
# 𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
# #DEFINE 2nd COMPONENT
# ψ₂ = AMFMcomp(𝐶₂)
# #DEFINE THE COMPONENT SET
# 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
# #DEFINE THE AMFM MODEL
# z = AMFMmodel(𝑆)
# #DEFINE A TIME INDEX
# t = 0.0:0.005:2.0
# Fnorm=1
#
# getindex(z.S.S)
#
# isaPlot3d_PlotsGR(z,collect(t))
#
# Plots.plot3d(
#    legend = :false,
#    framestyle = :origin,
#    xlab = "time",
#    ylab = "freq ()",
#    zlab = "real",
#    camera = (20,80),
#    background_color=ISA.cmap[1],
#    foreground_color=:white,
#    )
# for k in 1:length(z.comps)
#    Plots.plot3d!(
#        t,
#        Fnorm.*z.comps[k].ω.(t),
#        real.(z.comps[k](t)),
#        c = ISA.cmap[ max.(min.(round.(Int, abs.(z.comps[k].a.(t)) .* 256/2 ),256),1) ],
#        linealpha = max.(min.( abs.(z.comps[k].a.(t)).^(1/2) .* 1/2 ,1),0)
#        )
# end
# Plots.current()
#
#
#
# @recipe function temp(z::AMFMmodel; t = 0.0:0.005:2.0)
#    xlab --> "time"
#    ylab --> "freq"
#    zlab --> "real"
#    legend := false
#    camera := (20,80)
#    framestyle := :origin
#    TT = Array{Any}(undef,3,)
#    W = Array{Any}(undef,3,)
#    R = Array{Any}(undef,3,)
#    for k in 1:length(z.comps)
#       TT[k] = t
#       W[k] = Fnorm.*z.comps[k].ω.(t)
#       R[k] = real.(z.comps[k](t))
#    end
#    TT,W,R
# end
#
#
#
# plot(z)
#
#
# a₀(t) = exp(-t^2)
# ω₀(t) = 100
# φ₀ = 0
# 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
# #DEFINE 0th COMPONENT
# ψ₀ = AMFMcomp(𝐶₀)
# #DEFINE 1st CANONICAL TRIPLET
# a₁(t) = 1
# ω₁(t) = 10*t
# φ₁ = π
# 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
# #DEFINE 1st COMPONENT
# ψ₁ = AMFMcomp(𝐶₁)
# #DEFINE 2nd CANONICAL TRIPLET
# a₂(t) = 0.8*cos(2t)
# ω₂(t) = 10 + 7.5*sin(t)
# φ₂ = π
# 𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
# #DEFINE 2nd COMPONENT
# ψ₂ = AMFMcomp(𝐶₂)
# #DEFINE THE COMPONENT SET
# 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
# #DEFINE THE AMFM MODEL
# z = AMFMmodel(𝑆)
#
# for k in 1:length(𝑆.S)
#      Plots.plot3d!(
#          t,
#          𝑆.S[k].ω.(t)
#          )
# end
# Plots.current()
#
#
# z.comps[k].ω.(t)
# real.(z.comps[k](t))
#
# z.S.S[3]
