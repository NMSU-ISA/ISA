path = "docs/src/assets/"

using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0,ylims=(-1.0,1.0))
png(path*"IS_exFourier1.png")


using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exFourier2.png")


using ISA, Plots
T = 0.5
aₖ(k) = 1/T
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exFourier3.png")

# -----------------

using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0, ylims=(-1.0,1.0))
png(path*"IS_exFourier4.png")


using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exFourier5.png")


using ISA, Plots
T = 0.5
aₖ(k) = ifelse( k==0, 1/2, sin(k*π/2)/(k*π) )
kInds = -10:10
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exFourier6.png")

#-------------------------------
using ISA, Plots
T = 0.75
j=im
aₖ(k) = ifelse( k==0, 0, (1-exp(-j*k*2π/3)-exp(j*2π/3)*
exp(-j*k*4π/3)+exp(j*2π/3)*exp(-j*k*2π/3)-exp(j*4π/3)*
exp(-j*k*2π)+exp(j*4π/3)*exp(-j*k*4π/3))/(j*k*2π) )

kInds = -150:150
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(z; timeaxis=-1.0:0.001:1.0, camera=(60,15))
png(path*"IS_exFourier7.png")


using ISA, Plots
T = 0.75
j=im
aₖ(k) = ifelse( k==0, 0, (1-exp(-j*k*2π/3)-exp(j*2π/3)*
exp(-j*k*4π/3)+exp(j*2π/3)*exp(-j*k*2π/3)-exp(j*4π/3)*
exp(-j*k*2π)+exp(j*4π/3)*exp(-j*k*4π/3))/(j*k*2π) )

kInds = -150:150
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exFourier8.png")


using ISA, Plots
T = 0.75
j=im
aₖ(k) = ifelse( k==0, 0, (1-exp(-j*k*2π/3)-exp(j*2π/3)*
exp(-j*k*4π/3)+exp(j*2π/3)*exp(-j*k*2π/3)-exp(j*4π/3)*
exp(-j*k*2π)+exp(j*4π/3)*exp(-j*k*4π/3))/(j*k*2π) )

kInds = -150:150
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exFourier9.png")
