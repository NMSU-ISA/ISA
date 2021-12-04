#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.
using ISA, RecipesBase

# Load Colormap
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

"""
    S = plot()

Create a 3D Argand Digram ...

# Examples
```@example
using ISA, Plots

```
"""
# 3D Argand Digram
@recipe function temp(z::AMFMmodel;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
   xguide --> "time(s)"
   yguide --> "freq("*FreqUnits*")"
   zguide --> "real"
   background_color --> cubeYF()[1]
   foreground_color --> :white
   legend --> false
   camera --> (45,45)
   ymirror --> true
   framestyle --> :origin
   t = timeaxis
   a_max = maximum(abs.(z(t)))
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(z(t)) .* 256/a_max ),256),1) ]
   timeaxis, imag(z(t)), real(z(t))
end
# 3D Argand Digram
@recipe function temp(ψ::AMFMcomp;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
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
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(ψ.(t)) .* 256/a_max ),256),1) ]
   t,imag(ψ.(t)),real(ψ.(t))
end


"""
    S = plot()

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
@recipe function temp(S::compSet;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
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
   a_max = maximum([maximum(abs.(S.S[2].a.(t))) for k in 1:length(S.S)])

   for k in 1:length(S.S)
      seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(S.S[k].a.(t)) .* 256/a_max ),256),1) ]
      #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)
      @series begin
         timeaxis, Fnorm.*S.S[k].ω.(t), real(AMFMcomp(S.S[k]).(t))
      end
   end
end

# 3D IS Plot
@recipe function temp(𝐶::AMFMtriplet;timeaxis = 0.0:0.005:1.0,FreqUnits = "rad/s")
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
   seriescolor := cubeYF()[ max.(min.(round.(Int, abs.(AMFMcomp(𝐶).(t)) .* 256/a_max ),256),1) ]
   t,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end
