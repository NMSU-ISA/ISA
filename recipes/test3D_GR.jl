using ISA

# temporary
using Plots

#Load colormap
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

#Supporting functions
function  getFnorm(FreqUnits)
   if FreqUnits == "rad/s"
         Fnorm = 1
   elseif FreqUnits == "Hz"
         Fnorm = 1/2π
    else
         error("invalid FreqUnits")
   end
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
t = 0.0:0.005:2.0

a_max = maximum([maximum(abs.(z.S.S[k].a.(t))) for k in 1:length(z.S.S)])

linealpha = max.(min.( abs.(z.comps[k].a.(t)).^(1/2) .* 1/a_max ,1),0)
Plots.plot3d(xlab = "time",
            ylab = "freq ()",
            zlab = "real",
            camera = (20,80))
for k in 1:length(𝑆.S)
     Plots.plot3d!(
         t,
         z.S.S[k].ω.(t),
         real(AMFMcomp(z.S.S[k]).(t)),
         c = cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[k].a.(t)) .* 256/a_max ),256),1) ]
         )
end
Plots.current()


@recipe function temp(z::AMFMmodel; t = 0.0:0.005:2.0, FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum([maximum(abs.(z.S.S[k].a.(t))) for k in 1:length(z.S.S)])
   seriescolor --> cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[1].a.(t)) .* 256/a_max ),256),1) ]
   X = Array{Any}(undef,3,)
   Y = Array{Any}(undef,3,)
   Z = Array{Any}(undef,3,)
   #LC = Array{Any}(undef,3,)
   for k in 1:length(z.S.S)
      X[k] = t
      Y[k] = Fnorm.*z.S.S[k].ω.(t)
      Z[k] = real(AMFMcomp(z.S.S[k]).(t))
   end
   X,Y,Z
end

plot(z)
