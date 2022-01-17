path = "docs/src/assets/"

using ISA, Plots
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
plot(𝚿₀)
png(path*"IS_num_exAMFMcomp1.png")
