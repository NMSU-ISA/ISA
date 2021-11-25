using ISA

include(raw".\GRrecipes.jl")

#DEFINE 0th CANONICAL TRIPLET
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
#DEFINE 0th COMPONENT
ψ₀ = AMFMcomp(𝐶₀)
#DEFINE 1st CANONICAL TRIPLET
a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
#DEFINE 1st COMPONENT
ψ₁ = AMFMcomp(𝐶₁)
#DEFINE 2nd CANONICAL TRIPLET
a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π
𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
#DEFINE 2nd COMPONENT
ψ₂ = AMFMcomp(𝐶₂)
#DEFINE THE COMPONENT SET
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
#DEFINE THE AMFM MODEL
z = AMFMmodel(𝑆)
#DEFINE A TIME INDEX
t = Array(0.0:0.005:2.0)

using Plots

# plot(z,camera=(20,80)) # 2) 3d plane 1
# plot(z,camera=(0,90)) # 1) time-freq plane 2
# plot(z,camera=(0,0)) # 3) time-real plane 3

allPlots = []
p = plot(z,camera=(20.0,80.0))
[push!(allPlots, plot(z,camera=(20.0,80.0))) for i in 1:30]
for i ∈ 0:50
    θ1 = 20.0 - i*20.0/50.0
    θ2 = 80.0 + i*10.0/50.0
    p1 = plot(z,camera=(θ1,θ2))
    frame = plot(p1)
    push!(allPlots, frame)
end
p = plot(z,camera=(0,90))
[push!(allPlots, p) for i in 1:30]
for i ∈ 0:90
    p1 = plot(z,camera=(0,90-i))
    frame = plot(p1)
    push!(allPlots, frame)
end
p = plot(z,camera=(0,0))
[push!(allPlots, p) for i in 1:30]


@gif for i in 1:length(allPlots)
    plot(allPlots[i])
end

#
# anim = @animate for i ∈ 1:length(allPlots)
#     plot(allPlots[i])
# end
#gif(anim, "animation.gif", fps = 30)


#plot(z,camera=(20,90))
# length(allPlots)
# plot3d()
# @gif for i=1:90
#     plot(z,camera=(20,i))
# end every 5


# normal output:
# AMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0), AMFMtriplet(a₁, ω₁, π), AMFMtriplet(a₂, ω₂, π)]))

# compact output:
# https://github.com/FluxML/Flux.jl/blob/dbb9f82ef8d4e196259ff1af56aeddc626159bf3/src/layers/show.jl
