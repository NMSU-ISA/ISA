path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:1.0)
png(path*"IS_component.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t)+50,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀;timeaxis=0.0:0.001:3.0)
png(path*"default1.png")

plot(ψ₀; timeaxis=0.0:0.001:10.0)
png(path*"costum0.png")

plot(ψ₀, timeaxis=0.0:0.001:3.0, camera=(20,50))
png(path*"costum1.png")

plot(ψ₀, timeaxis=0.0:0.001:3.0,
     yguide="imaginary", ymirror=false)
png(path*"costum2.png")


using ISA, Plots
ψ₀ = AMFMcomp(t->10t,t->25cos(t)+50,0.0)
plot(ψ₀, timeaxis=0.0:0.001:3.0)
png(path*"default3d.png")

plot(ψ₀,view="TR", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TRview3d.png")

plot(ψ₀, view="TI", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TIview3d.png")


plot(ψ₀, view="RI", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"RIview3d.png")
