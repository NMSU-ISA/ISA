path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
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
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
png(path*"IS_exAMFMmodel4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.01t^2)+10t,t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->t^2+100t,0.1)
𝐶₂ = AMFMtriplet(t->cos(0.1t),t->sin(0.1t),π)
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
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
png(path*"IS_exAMFMmodel7.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel8.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1.0,t->exp(-t^2),0.0)
𝐶₁ = AMFMtriplet(t->t^2+10,t->100.0,0.1)
𝐶₂ = AMFMtriplet(t->10.0,t->sin(10t)+2t,1.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFMmodel9.png")
