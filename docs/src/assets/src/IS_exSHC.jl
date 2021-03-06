path = "docs/src/assets/"

using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->100,0.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC1.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->100,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC2.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->100,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exSHC3.png")

#------------------------------------
using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->10Ο,0.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC4.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->10Ο,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC5.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->1,t->10Ο,0.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exSHC6.png")

#-----------------------------------
using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->exp(Ο),1.0)
Οβ = AMFMcomp(πΆβ)
plot(Οβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC7.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->exp(Ο),1.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exSHC8.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->exp(Ο),1.0)
Οβ = AMFMcomp(πΆβ)
plot(πΆβ; timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exSHC9.png")
