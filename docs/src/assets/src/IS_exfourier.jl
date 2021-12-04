
using ISA, Plots
T = 1.0
aₖ(k) = 1.0
kInds = -25:25
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0, ylims=(-1.0,1.0))
png("IS_exFourier1.png")


using ISA, Plots
T = 1.0
aₖ(k) = 1.0
kInds = -25:25
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png("IS_exFourier2.png")
