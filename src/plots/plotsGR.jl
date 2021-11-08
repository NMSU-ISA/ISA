viridis()


import Makie

#Construct isaPlot3d from type AMFMmodel called with a time index using Makie backend
function isaPlot3d_Makie(z::AMFMmodel,t::Vector{Float64})
    a_max = 1 #need to finish
    myScene = Makie.Scene(resolution = (1080,1080),
    camera = Makie.cam3d!)
    cc = viridis()
    for i in 1:length(z.S.S)
        myScene = Makie.lines!(-t,
         -z.S.S[i].ω.(t),
          real.(z.S.S[i](t)),
           color = cc[max.(min.(round.(Int, abs.(z.S.S[i].a.(t)) .* 256 / a_max), 256), 1)])
    end
              axis = myScene[Makie.Axis] # get the axis object from the scene
              axis.names.axisnames = ("t", "ω(t)","x(t)")
              myScene
end

#DEFINE 0th CANONICAL TRIPLET
a₀(t) = exp(-t^2)
ω₀(t) = 100
φ₀ = 0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
#DEFINE 0th COMPONENT
ψ₀ = AMFMcomp(𝐶₀)
#DEFINE 1st CANONICAL TRIPLET
a₁(t) = 1
ω₁(t) = 10*t
φ₁ = π
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

isaPlot3d_Makie(z,t)
