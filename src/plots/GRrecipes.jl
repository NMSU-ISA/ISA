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
function viewAngle3DArgand(view)
   normalized = uppercase(view)
   if normalized == "DEFAULT"
      return "time(s)","imag","real",(45,45),true,(true,true,true)
   elseif normalized == "TI" || normalized == "IT"
      return "time(s)","imag","",(0,90),true,(true,true,false)
   elseif normalized == "TR" || normalized == "RT"
      return "time(s)","","real",(0,0),false,(true,false,true)
   elseif normalized == "IR" || normalized == "RI"
      return "","Imag","real",(90,0),false,(false,true,true)
   else return error("Invalid Argand Graph. Choose from \"TR\", \"TI\", or \"IR\"")
   end
end

function colorSelect(CM)
   if isa(CM,Vector{RGB{Float64}})
      if length(CM)==256
         return CM
      else
         return error("Invalid color map. Colormap must be of lengh 256.")
      end
   else
      normalized = uppercase(CM)
      if normalized == "CUBEYF"
         return cubeYF()
      elseif normalized == "VIRIDIS"
         return viridis()
      else return error("Invalid color map. Choose from \"cubeYF\" or \"viridis\"")
      end
   end
end

@recipe function temp(ψ::AMFMcomp; timeaxis = 0.0:0.005:1.0,
                      FreqUnits = "rad/s", view="default",
                      colorMap="VIRIDIS")
   xguide --> viewAngle3DArgand(view)[1]
   yguide --> viewAngle3DArgand(view)[2]
   zguide --> viewAngle3DArgand(view)[3]
   camera --> viewAngle3DArgand(view)[4]
   ymirror --> viewAngle3DArgand(view)[5]
   xticks --> viewAngle3DArgand(view)[6][1]
   yticks --> viewAngle3DArgand(view)[6][2]
   zticks --> viewAngle3DArgand(view)[6][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   t = timeaxis
   linealpha --> sign.(abs.( ψ(timeaxis) ))
   a_max = maximum(abs.(ψ.C.a.(t)))
   clim = (0,1)
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(ψ.(t)) .* 256/a_max ),256),50) ]
   t,imag(ψ.(t)),real(ψ.(t))
end

@recipe function temp(z::AMFMmodel; timeaxis = 0.0:0.005:1.0,
                      FreqUnits = "rad/s", view="default",
                      colorMap="VIRIDIS")
   xguide --> viewAngle3DArgand(view)[1]
   yguide --> viewAngle3DArgand(view)[2]
   zguide --> viewAngle3DArgand(view)[3]
   camera --> viewAngle3DArgand(view)[4]
   ymirror --> viewAngle3DArgand(view)[5]
   xticks --> viewAngle3DArgand(view)[6][1]
   yticks --> viewAngle3DArgand(view)[6][2]
   zticks --> viewAngle3DArgand(view)[6][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   t = timeaxis
   linealpha --> sign.(abs.(z(timeaxis)))
   a_max = maximum(abs.(z(t)))
   clim = (0,1)
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(z(t)) .* 256/a_max ),256),50) ]
   timeaxis, imag(z(t)), real(z(t))
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

# 3D IS Plot
function getFnorm(FreqUnits)
   if FreqUnits == "rad/s"
      Fnorm = 1
   elseif FreqUnits == "Hz"
      Fnorm = 1/2π
   else
      error("invalid FreqUnits")
   end
end
function viewAngleIS(view,FreqUnits)
   normalized = uppercase(view)
   if normalized == "DEFAULT"
      return "time(s)","freq("*FreqUnits*")","real",(20,80),true,0,(true,true,true)
   elseif normalized == "TF" || normalized == "FT"
      return "time(s)","freq("*FreqUnits*")"," ",(0,90),true,-90,(true,true,false)
   elseif normalized == "TR" || normalized == "RT"
      return "time(s)"," ","real",(0,0),false,0,(true,false,true)
   elseif normalized == "FR" || normalized == "RF"
      return "","freq("*FreqUnits*")","real",(90,0),false,0,(false,true,true)
   else return error("Invalid IS Graph. Choose from \"TR\", \"TF\", or \"FR\"")
   end
end

@recipe function temp(𝐶::AMFMtriplet; timeaxis = 0.0:0.005:1.0,
                      FreqUnits = "rad/s",view="default",
                      colorMap="VIRIDIS")
   xguide --> viewAngleIS(view,FreqUnits)[1]
   yguide --> viewAngleIS(view,FreqUnits)[2]
   zguide --> viewAngleIS(view,FreqUnits)[3]
   camera --> viewAngleIS(view,FreqUnits)[4]
   ymirror --> viewAngleIS(view,FreqUnits)[5]
   yrotation --> viewAngleIS(view,FreqUnits)[6]
   xticks --> viewAngleIS(view,FreqUnits)[7][1]
   yticks --> viewAngleIS(view,FreqUnits)[7][2]
   zticks --> viewAngleIS(view,FreqUnits)[7][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   linealpha --> sign.(abs.( 𝐶.a.(timeaxis) ))
   a_max = maximum(abs.(𝐶.a.(t)))
   clim = (0,1)
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(AMFMcomp(𝐶).(t)) .* 256/a_max ),256),50) ]
   t,𝐶.ω.(t),real.(AMFMcomp(𝐶).(t))
end

@recipe function temp(S::compSet; timeaxis = 0.0:0.005:1.0,
                      FreqUnits = "rad/s",view="default",
                      colorMap="VIRIDIS",realProj=false)
   xguide --> viewAngleIS(view,FreqUnits)[1]
   yguide --> viewAngleIS(view,FreqUnits)[2]
   zguide --> viewAngleIS(view,FreqUnits)[3]
   camera --> viewAngleIS(view,FreqUnits)[4]
   ymirror --> viewAngleIS(view,FreqUnits)[5]
   yrotation --> viewAngleIS(view,FreqUnits)[6]
   xticks --> viewAngleIS(view,FreqUnits)[7][1]
   yticks --> viewAngleIS(view,FreqUnits)[7][2]
   zticks --> viewAngleIS(view,FreqUnits)[7][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   t = timeaxis
   a_max = maximum([maximum(abs.(S.S[k].a.(t))) for k in 1:length(S.S)])
   clim = (0,1)
   realProj ? projection = zeros(length(t)) : nothing
   realProj ? minVector = zeros(length(S.S)) : nothing
   for k in 1:length(S.S)
      seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(S.S[k].a.(t)) .* 256/a_max ),256),50) ]
      #linealpha --> max.(min.( abs.(z.S.S[1].a.(t)).^(1/2) .* 1/a_max ,1),0)

      @series begin
         linealpha --> sign.(abs.( S.S[k].a.(timeaxis) ))
         timeaxis, Fnorm.*S.S[k].ω.(t), real(AMFMcomp(S.S[k]).(t))
      end
      realProj ? minVector[k] = minimum(Fnorm.*S.S[k].ω.(t)) : nothing
      realProj ? projection += real(AMFMcomp(S.S[k]).(t)) : nothing
   end
   if realProj
      append!(minVector,0)
      @series begin
         seriescolor := :white
         timeaxis, zeros(length(t)).+minimum(minVector), projection
      end
   end
end


# Models
# 3D Argand Digram
@recipe function temp(𝚿::numComp;FreqUnits = "rad/s",
                      view="default", colorMap = "VIRIDIS")
   xguide --> viewAngle3DArgand(view)[1]
   yguide --> viewAngle3DArgand(view)[2]
   zguide --> viewAngle3DArgand(view)[3]
   camera --> viewAngle3DArgand(view)[4]
   ymirror --> viewAngle3DArgand(view)[5]
   xticks --> viewAngle3DArgand(view)[6][1]
   yticks --> viewAngle3DArgand(view)[6][2]
   zticks --> viewAngle3DArgand(view)[6][3]
   background_color --> colorSelect(colorMap)[1]
   linealpha --> sign.(abs.(𝚿(𝚿.t)))
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   a_max = maximum(abs.(𝚿.t))
   clim = (0,1)
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(reverse(𝚿.t)) .* 256/a_max ),256),50) ]
   𝚿.t,imag(𝚿.Ψ),real(𝚿.Ψ)
end



@recipe function temp(𝐳::numModel; FreqUnits = "rad/s",
                      view="default", colorMap = "VIRIDIS")
   xguide --> viewAngle3DArgand(view)[1]
   yguide --> viewAngle3DArgand(view)[2]
   zguide --> viewAngle3DArgand(view)[3]
   camera --> viewAngle3DArgand(view)[4]
   ymirror --> viewAngle3DArgand(view)[5]
   xticks --> viewAngle3DArgand(view)[6][1]
   yticks --> viewAngle3DArgand(view)[6][2]
   zticks --> viewAngle3DArgand(view)[6][3]
   background_color --> colorSelect(colorMap)[1]
   tt = 𝐳.𝚿ₖ[1].t
   linealpha --> sign.(abs.( 𝐳(tt)))
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   a_max = maximum(abs.(𝐳.(tt)))
   clim = (0,1)
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.(𝐳(tt)) .* 256/a_max ),256),50) ]
   tt, imag(𝐳(tt)), real(𝐳(tt))
end

# 3D IS Plot
@recipe function temp(𝐂::numTriplet;FreqUnits = "rad/s",
                      view="default",colorMap = "VIRIDIS")
   xguide --> viewAngleIS(view,FreqUnits)[1]
   yguide --> viewAngleIS(view,FreqUnits)[2]
   zguide --> viewAngleIS(view,FreqUnits)[3]
   camera --> viewAngleIS(view,FreqUnits)[4]
   ymirror --> viewAngleIS(view,FreqUnits)[5]
   yrotation --> viewAngleIS(view,FreqUnits)[6]
   xticks --> viewAngleIS(view,FreqUnits)[7][1]
   yticks --> viewAngleIS(view,FreqUnits)[7][2]
   zticks --> viewAngleIS(view,FreqUnits)[7][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum(abs.(𝐂.a))
   clim = (0,1)
   rm = (!).(isnan.(𝐂.ω))# remove "NaN" values in 𝐂.ω
   seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.((𝐂.a)) .* 256/a_max ),256),50) ][rm]
   𝐂.t[rm],𝐂.ω[rm],real.(𝐂.Ψ)[rm]
end

@recipe function temp(𝐒::numSet;FreqUnits = "rad/s",
                      view="default",colorMap = "VIRIDIS",realProj=false)
   xguide --> viewAngleIS(view,FreqUnits)[1]
   yguide --> viewAngleIS(view,FreqUnits)[2]
   zguide --> viewAngleIS(view,FreqUnits)[3]
   camera --> viewAngleIS(view,FreqUnits)[4]
   ymirror --> viewAngleIS(view,FreqUnits)[5]
   yrotation --> viewAngleIS(view,FreqUnits)[6]
   xticks --> viewAngleIS(view,FreqUnits)[7][1]
   yticks --> viewAngleIS(view,FreqUnits)[7][2]
   zticks --> viewAngleIS(view,FreqUnits)[7][3]
   background_color --> colorSelect(colorMap)[1]
   foreground_color --> :white
   legend --> false
   framestyle --> :origin
   Fnorm = getFnorm(FreqUnits)
   a_max = maximum([maximum(abs.(𝐒.S[k].a)) for k in 1:length(𝐒.S)])
   timeaxis = 𝐒.S[1].t
   clim = (0,1)
   realProj ? projection = zeros(length(timeaxis)) : nothing
   realProj ? minVector = zeros(length(𝐒.S)) : nothing
   for k in 1:length(𝐒.S)
      rm = (!).(isnan.(𝐒.S[k].ω))# remove "NaN" values in 𝐂.ω
      seriescolor := colorSelect(colorMap)[ max.(min.(round.(Int, abs.((𝐒.S[k].a)) .* 256/a_max ),256),50) ][rm]

      @series begin
         𝐒.S[k].t[rm],𝐒.S[k].ω[rm],real.(𝐒.S[k].Ψ)[rm]
      end
      realProj ? minVector[k] = sort(unique(𝐒.S[k].ω))[1] : nothing
      realProj ? projection += real.(𝐒.S[k].Ψ) : nothing
   end
   if realProj
      append!(minVector,0)
      @series begin
         seriescolor := :white
         timeaxis, zeros(length(timeaxis)).+minimum(minVector), projection
      end
   end
end
