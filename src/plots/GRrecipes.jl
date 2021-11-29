using ISA, RecipesBase

# Load Colormap
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

# Supporting Functions
function getFnorm(FreqUnits)
   if FreqUnits == "rad/s"
      Fnorm = 1
   elseif FreqUnits == "Hz"
      Fnorm = 1/2π
   else
      error("invalid FreqUnits")
   end
end

# Method 1: z::AMFMmodel, t::Vector{Float64} or t::StepRangeLen
@recipe function temp(z::AMFMmodel;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   ymirror --> true
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(z.S.S[1].a.(t))) for k in 1:length(z.S.S)])

   for k in 1:length(z.S.S)
      seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(z.S.S[k].a.(t)) .* 256/a_max ),256),1) ]
      #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
      @series begin
         timeaxis, Fnorm.*z.S.S[k].ω.(t), real(AMFMcomp(z.S.S[k]).(t))
      end
   end
end

#Method 2: S::compSet, t::Vector{Float64} or t::StepRangeLen
@recipe function temp(S::compSet;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   ymirror --> true
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(S.S[2].a.(t))) for k in 1:length(S.S)])

   for k in 1:length(S.S)
      seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(S.S[k].a.(t)) .* 256/a_max ),256),1) ]
      #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
      @series begin
         timeaxis, Fnorm.*S.S[k].ω.(t), real(AMFMcomp(S.S[k]).(t))
      end
   end
end

#Method 3: ψ::AMFMcomp
@recipe function temp(ψ::AMFMcomp;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum(abs.(ψ.C.a.(t)))
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(ψ.(t)) .* 256/a_max ),256),1) ]
   t,ψ.C.ω.(t),real(ψ.(t))
end

#Method 4: 𝐶::AMFMtriplet
@recipe function temp(𝐶::AMFMtriplet;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum(abs.(𝐶.a.(t)))
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(AMFMcomp(𝐶).(t)) .* 256/a_max ),256),1) ]
   t,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end
