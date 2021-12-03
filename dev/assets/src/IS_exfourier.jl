using ISA, Plots
T = 1.0
aₖ(k) = 1.0
kInds = collect(-25:25)
z = fourierSeries(T, aₖ, kInds)
plot(z; timeaxis=-1.0:0.001:1.0)

png("IS_exFourier.png")
