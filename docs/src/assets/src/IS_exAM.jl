path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM2.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAM3.png")

# -----------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM4.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM5.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->sin(11t),t->250,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAM6.png")

#------------------------------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->cos(t)+exp(-t),t->100,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM7.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->cos(t)+exp(-t),t->100,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0)
png(path*"IS_exAM8.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->cos(t)+exp(-t),t->100,1.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.0005:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAM9.png")
