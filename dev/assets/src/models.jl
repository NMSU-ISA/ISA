path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel2.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFMmodel3.png")

#--------------------------------
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
𝐶₁ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
𝐶₂ = AMFMtriplet(t->sin(11t),t->250,0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
𝐶₁ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
𝐶₂ = AMFMtriplet(t->sin(11t),t->250,0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
𝐶₁ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
𝐶₂ = AMFMtriplet(t->sin(11t),t->250,0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFMmodel6.png")

#---------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->10t^2+2t+1,1.0)
𝐶₁ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
𝐶₂ = AMFMtriplet(t->10t,t->5cos(50t),0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel7.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->10t^2+2t+1,1.0)
𝐶₁ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
𝐶₂ = AMFMtriplet(t->10t,t->5cos(50t),0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel8.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->10t^2+2t+1,1.0)
𝐶₁ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
𝐶₂ = AMFMtriplet(t->10t,t->5cos(50t),0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFMmodel9.png")
