path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM2.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFM3.png")

#--------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10sin(t),t->t^2+2t+1,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFM6.png")

#----------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM7.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM8.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(0.1t),t->t^2+t+10,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png(path*"IS_exAMFM9.png")
