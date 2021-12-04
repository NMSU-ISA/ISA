using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png("IS_exFM1.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png("IS_exFM2.png")

# ----------------

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png("IS_exFM3.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)
png("IS_exFM4.png")
