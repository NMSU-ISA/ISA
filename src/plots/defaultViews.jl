using ISA, Plots

include(raw".\GRrecipes.jl")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)


@recipe function timeFreq(𝐶::AMFMtriplet,view="TF"; timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "Time"
   yguide --> "freq("*FreqUnits*")"
   zguide --> ""
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (0,90)
   left_margin --> 15Plots.mm
   margin --> 5Plots.mm
   yrotation --> 90
   ymirror --> true
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum(abs.(𝐶.a.(t)))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(AMFMcomp(𝐶).(t)) .* 256/a_max ),256),50) ]
   t,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end

# plot(𝐶₀; timeaxis=0.0:0.001:10.0,view="D")
#
# default(ymirror =false)
#
# plot(𝐶₀; timeaxis=0.0:0.001:10.0,view="TF")
