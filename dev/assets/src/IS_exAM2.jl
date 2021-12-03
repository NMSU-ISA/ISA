using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->100,0.0)
plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
png("IS_exAM2.png")
