using ISA, Plots

include(raw".\GRrecipes.jl")


fs = 16_000
a₀(t) = exp(-1/2*(t-0.5)^2/(1.0/(10.0))^2)
ω₀(t) = 2π*(70 + 50*sin(2π*2*t))
𝐶₀ = AMFMtriplet(a₀,ω₀)

a₁(t) = 0.5 + 1/3*sin(20.0*t)
ω₁(t) = 2π*100.0
𝐶₁ = AMFMtriplet(a₁,ω₁)

a₂(t) = 0.54 - 0.46 * cos.(2π*t)
ω₂(t) = 2π*(10.0 + exp(t+4.5)-exp(4.5))
𝐶₂ = AMFMtriplet(a₂,ω₂)

𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])

z = AMFMmodel(𝑆)


# plot(z,camera=(20,80)) # 2) 3d plane 1
# plot(z,camera=(0,90)) # 1) time-freq plane 2
# plot(z,camera=(0,0)) # 3) time-real plane 3

# allPlots = []
# #p = plot(z,camera=(20.0,80.0))
# p = plot(z,camera=(20.0,90.0))
# plot(z,camera=(20.0,90.0),framestyle=:origin)#,framestyle = :zerolines)
# [push!(allPlots, plot(z,camera=(20.0,80.0))) for i in 1:30]

CNT = 0
for i ∈ 0:200
    θ1 = 20.0 - i*20.0/200.0
    θ2 = 80.0 + i*10.0/200.0
    #p1 = plot(z,camera=(θ1,θ2))
    #frame = plot(p1)
    #push!(allPlots, frame)
    #Plots.current()
    plot(z,camera=(θ1,θ2))
    savefig(raw"C:\Users\hemad\Desktop\Fall2020\EE590\images\plot"*lpad(i,4,"0")*".png")
    CNT = i
end

plot(z,camera=(0,90),zguide=" ",zticks=[])
for i in 1:90
    savefig(raw"C:\Users\hemad\Desktop\Fall2020\EE590\images\plot"*lpad((i + CNT),4,"0")*".png")
end

CNT = CNT + 90

for i ∈ 0:200
    plot(z,camera=(0,90-90*i/200))
    savefig(raw"C:\Users\hemad\Desktop\Fall2020\EE590\images\plot"*lpad((CNT + i),4,"0")*".png")
end

CNT = CNT + 200

plot(z,camera=(0,0),yticks=[],ylabel="")
for i in 1:100
    savefig(raw"C:\Users\hemad\Desktop\Fall2020\EE590\images\plot"*lpad((i + CNT),4,"0")*".png")
end



#ffmpeg -r 60 -f image2 -s 1920x1080 -i plot%04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

# p = plot(z,camera=(0,0))
# [push!(allPlots, p) for i in 1:30]


# @gif for i in 1:length(allPlots)
#     plot(allPlots[i])
# end

# anim = @animate for i ∈ 1:length(allPlots)
#     plot(allPlots[i])
# end
# #gif(anim, "animation.gif", fps = 15)
#
# mp4(anim, "animation.mp4", fps=300)



#plot(z,camera=(20,90))
# length(allPlots)
# plot3d()
# @gif for i=1:90
#     plot(z,camera=(20,i))
# end every 5

#plotattr("pos")
# normal output:
# AMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0), AMFMtriplet(a₁, ω₁, π), AMFMtriplet(a₂, ω₂, π)]))

# compact output:
# https://github.com/FluxML/Flux.jl/blob/dbb9f82ef8d4e196259ff1af56aeddc626159bf3/src/layers/show.jl
