using ISA, Plots
𝐶₀ = AMFMtriplet(t->1,t->t^2,0.0)
plot(𝐶₀; timeaxis=0.0:0.001:10.0)
png("IS_exFM1.png")
