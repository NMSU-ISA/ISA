path = "docs/src/assets/"

using ISA, Plots
πΆβ = AMFMtriplet(t->10t+100,t->25cos(t)+50,0.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM1.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10t+100,t->25cos(t)+50,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM2.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10t+100,t->25cos(t)+50,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFM3.png")

#--------------------------

using ISA, Plots
πΆβ = AMFMtriplet(t->10sin(t),t->t^2+2t+50,1.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM4.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10sin(t),t->t^2+2t+50,1.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM5.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10sin(t),t->t^2+2t+50,1.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFM6.png")

#----------------------------

using ISA, Plots
πΆβ = AMFMtriplet(t->5exp(0.1t)+15,t->t^2+t+25,0.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM7.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->5exp(0.1t)+15,t->t^2+t+25,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0)
png(path*"IS_exAMFM8.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->5exp(0.1t)+15,t->t^2+t+25,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=0.0:0.001:10.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFM9.png")
