using ISA, Plots
ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
plot(ψ₀)
fs = 160000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
plot(𝚿₀)

#a_max??
