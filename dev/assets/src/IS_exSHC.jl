path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC2.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exSHC3.png")

#------------------------------------
using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10π,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10π,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->10π,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exSHC6.png")

#-----------------------------------
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->exp(π),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC7.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->exp(π),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC8.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10,t->exp(π),1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exSHC9.png")
