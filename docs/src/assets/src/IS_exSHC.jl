using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png("IS_exSHC1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90)
png("IS_exSHC2.png")
