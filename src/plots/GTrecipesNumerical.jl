using ISA, RecipesBase

# Load Colormap
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

using Plots

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

@recipe function temp(𝚿::numComp;FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "imag"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (45,45)
   framestyle --> :origin
   clim = (0,1)
   a_max = maximum(abs.(𝚿₀.(t)))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(𝚿₀.(t)) .* 256/a_max ),256),50) ]
   𝚿.t,imag(𝚿.Ψ),real(𝚿.Ψ)
end
# numComp EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
   fs = 3000
   t = collect(0:1/fs:1)
   𝚿₀ = numComp( ψ₀(t), fs )
   plot(𝚿₀)
end



@recipe function temp(𝐂::numTriplet;FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum(abs.(𝐂₀.a))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.((𝐂₀.Ψ)) .* 256/a_max ),256),50) ]
   𝐂.t,𝐂.ω,real.(𝐂.Ψ)
end
# numTriplet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   plot(𝐂₀)
end





@recipe function temp(𝐒::numSet;FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (20,80)
   ymirror --> true
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum([maximum(abs.(𝐒.S[k].a)) for k in 1:length(𝐒.S)])

   for k in 1:length(𝐒.S)
      #seriescolor := cubeYF()[ max.(min.(round.(Int, abs.((𝐒.S[k].Ψ)) .* 256/a_max ),256),50) ]
      @series begin
         𝐒.S[k].t,𝐒.S[k].ω,real.(𝐒.S[k].Ψ)
      end
   end
end
# numSet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
   ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
   ψ₂ = AMFMcomp(t->10t,t->25cos(t),0.0)#AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝚿₁ = numComp( ψ₁(t), fs )
   𝚿₂ = numComp( ψ₂(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   𝐂₁ = AMFMdemod(𝚿₁)
   𝐂₂ = AMFMdemod(𝚿₂)
   𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
   plot(𝐒)
end




#--------------------------numerical model
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)
𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
𝐳 = numModel(𝐒)# doesn't work

𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
