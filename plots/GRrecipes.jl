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


a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
ψ₀ = AMFMcomp(𝐶₀)
a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
ψ₁ = AMFMcomp(𝐶₁)
a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π
𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
ψ₂ = AMFMcomp(𝐶₂)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
t = 0.0:0.005:2.0


#
# Plots.plot3d!(
#       t,
#       Fnorm.*z.comps[k].ω.(t),
#       real.(z.comps[k](t)),
#       )
a_max = maximum([maximum(abs.(z.S.S[1].a.(t))) for k in 1:length(z.S.S)])

for k in 1:length(z.S.S)
     Plots.plot3d!(
         t,
         z.S.S[k].ω.(t),
         real(AMFMcomp(z.S.S[k])(t)),
         camera = (20,80),
         c = cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[k].a.(t)) .* 256/a_max ),256),1) ]
         )
end
Plots.current()

getFnorm("rad/s")
t = Array(0.0:0.005:2.0)
plot(t,real(AMFMcomp(z.S.S[3]).(t)))

# method 1: z::AMFMmodel, t::Vector{Float64} or t::StepRangeLen
@recipe function temp(z::AMFMmodel;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(z.S.S[2].a.(t))) for k in 1:length(z.S.S)])
   #seriescolor --> cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[1].a.(t)) .* 256/a_max ),256),1) ]
   #c --> :red
   #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
   X = Array{Any}(undef,3,)
   Y = Array{Any}(undef,3,)
   Z = Array{Any}(undef,3,)
   #LC = Array{Any}(undef,3,)
   for k in 1:length(z.S.S)
      X[k] = timeaxis
      Y[k] = Fnorm.*z.S.S[k].ω.(t)
      Z[k] = real(AMFMcomp(z.S.S[k]).(t))
   end
   X,Y,Z
end
# issue with variable t (can't use t in the plot())
z = AMFMmodel(𝑆)
dd = 0.0:0.005:6.0
tt = collect(0.0:0.005:3.0)
plot(z,timeaxis=0.0:0.005:2.0,FreqUnits="rad/s")


z.S.S[1]
z.S.S[2].ω
z.S.S[3].ω


#Method 2: S::compSet, t::Vector{Float64} or t::StepRangeLen
@recipe function temp(S::compSet;timeaxis = 0.0:0.005:2.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(z.S.S[k].a.(t))) for k in 1:length(z.S.S)])
   seriescolor --> cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[1].a.(t)) .* 256/a_max ),256),1) ]
   linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
   X = Array{Any}(undef,3,)
   Y = Array{Any}(undef,3,)
   Z = Array{Any}(undef,3,)
   #LC = Array{Any}(undef,3,)
   for k in 1:length(z.S.S)
      X[k] = timeaxis
      Y[k] = Fnorm.*S.S[k].ω.(t)
      Z[k] = real(AMFMcomp(S.S[k]).(t))
   end
   X,Y,Z
end
# issue with variable t (can't use t in the plot())
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
dd = 0.0:0.005:6.0
tt = collect(0.0:0.005:3.0)
plot(𝑆,timeaxis=dd,FreqUnits="rad/s")



#Method 3: ψ::AMFMcomp
@recipe function temp(ψ::AMFMcomp;timeaxis = 0.0:0.005:2.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(z.S.S[k].a.(t))) for k in 1:length(z.S.S)])
   seriescolor --> cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[1].a.(t)) .* 256/a_max ),256),1) ]
   linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)


   timeaxis,ψ.C.ω.(t),real(ψ.(t))
end
# issue with variable t (can't use t in the plot())
ψ₀ = AMFMcomp(𝐶₀)
ψ₁ = AMFMcomp(𝐶₁)
ψ₂ = AMFMcomp(𝐶₂)
dd = 0.0:0.005:6.0
tt = collect(0.0:0.005:3.0)
plot(ψ₀,timeaxis=0.0:0.005:6.0,FreqUnits="rad/s")
plot(ψ₁,FreqUnits="rad/s")
plot(ψ₂,FreqUnits="rad/s")


#Method 4: 𝐶::AMFMtriplet
@recipe function temp(𝐶::AMFMtriplet;timeaxis = 0.0:0.005:2.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   #a_max = maximum([maximum(abs.(z.S.S[k].a.(t))) for k in 1:length(z.S.S)])
   #seriescolor --> cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[1].a.(t)) .* 256/a_max ),256),1) ]
   #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)

   timeaxis,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
dd = 0.0:0.005:6.0
tt = collect(0.0:0.005:3.0)
plot(𝐶₀,FreqUnits="rad/s")
plot!(𝐶₁,FreqUnits="rad/s")
plot!(𝐶₂,FreqUnits="rad/s")

𝐶₀
