#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.
using ISA, RecipesBase

# Load Colormap
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

"""
    plot(z::AMFMmodel; timeaxis = 0.0:0.005:1.0)
    plot(ψ::AMFMcomp;  timeaxis = 0.0:0.005:1.0)

Create a 3D Argand Digram ...

# Examples
```@example
using ISA, Plots
ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
plot(ψ₀)
```
"""
# 3D Argand Digram
@recipe function temp(z::AMFMmodel; timeaxis = 0.0:0.005:1.0, FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "imag"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (45,45)
   ymirror --> true
   framestyle --> :origin
   t = timeaxis
   a_max = maximum(abs.(z(t)))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(z(t)) .* 256/a_max ),256),50) ]
   timeaxis, imag(z(t)), real(z(t))
end
# 3D Argand Digram
@recipe function temp(ψ::AMFMcomp; timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "imag"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (45,45)
   framestyle --> :origin
   t = timeaxis
   a_max = maximum(abs.(ψ.C.a.(t)))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(ψ.(t)) .* 256/a_max ),256),50) ]
   t,imag(ψ.(t)),real(ψ.(t))
end


"""
    plot(S::compSet;     timeaxis = 0.0:0.005:1.0, FreqUnits = "rad/s")
    plot(𝐶::AMFMtriplet; timeaxis = 0.0:0.005:1.0, FreqUnits = "rad/s")

Create a 3D Instantaneous Spectrum...

# Examples
```@example
using ISA, Plots

```
"""

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

# 3D IS Plot
@recipe function temp(S::compSet; timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
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
   t = timeaxis
   a_max = maximum([maximum(abs.(S.S[k].a.(t))) for k in 1:length(S.S)])
   clim = (0,1)

   for k in 1:length(S.S)
      seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(S.S[k].a.(t)) .* 256/a_max ),256),50) ]
      #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
      @series begin
         timeaxis, Fnorm.*S.S[k].ω.(t), real(AMFMcomp(S.S[k]).(t))
      end
   end
end

# 3D IS Plot
@recipe function temp(𝐶::AMFMtriplet; timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time(s)"
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
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(AMFMcomp(𝐶).(t)) .* 256/a_max ),256),50) ]
   t,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end



#------------------numerical plotting
# 3D numComp
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

# 3D numTriplet
@recipe function temp(𝐂::numTriplet;FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   ymirror --> true
   camera --> (20,80)
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum(abs.(𝐂₀.a))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.((𝐂₀.Ψ)) .* 256/a_max ),256),50) ]
   𝐂.t,𝐂.ω,real.(𝐂.Ψ)
end

# 3D numSet
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

# numerical model
@recipe function temp(𝐳::numModel; FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "imag"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (45,45)
   ymirror --> true
   framestyle --> :origin
   tt = 𝐳.𝚿ₖ[1].t
   a_max = maximum(abs.(𝐳.(tt)))
   clim = (0,1)
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(𝐳(tt)) .* 256/a_max ),256),50) ]
   tt, imag(𝐳(tt)), real(𝐳(tt))
end
