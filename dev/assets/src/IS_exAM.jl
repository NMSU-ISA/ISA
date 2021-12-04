
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM2.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png("IS_exAM3.png")

# -----------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png("IS_exAM6.png")
