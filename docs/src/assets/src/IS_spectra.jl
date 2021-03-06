path = "docs/src/assets/"

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(z; timeaxis=0.0:0.001:3.0)
png(path*"IS_ex0.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
plot(π; timeaxis=0.0:0.001:3.0)
png(path*"IS_ex1.png")


using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
plot(π,timeaxis=0.0:0.001:3.0,view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_ex2.png")


using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->10*t^2+50,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(2t),t->25 + 10.5*sin(t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
plot(π)


using ISA, Plots
πΆβ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
π = compSet([πΆβ,πΆβ])
plot(π,realProj=true)
png(path*"realProject.png")


using ISA, Plots
Οβ = AMFMcomp(t->t,t->25cos(t)+50,0.0)
plot(Οβ, timeaxis=0.0:0.001:3.0)
png(path*"defaultColor.png")

plot(Οβ, timeaxis=0.0:0.001:3.0, colorMap="cubeYF")
png(path*"cubeYFcolor.png")

myColorMap  = reverse(colormap("Blues",256))
plot(Οβ, timeaxis=0.0:0.001:3.0, colorMap = myColorMap)
png(path*"myColorMap.png")

#---------------------------------------------------

πΆβ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
πΆβ = AMFMtriplet(t->π©α΅€(t; ΞΌ=1.5, Ο=1.0), t->150 + 125sin(5t), Ο)
πΆβ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
π = compSet([πΆβ,πΆβ,πΆβ,πΆβ])
plot(π; timeaxis=0.0:0.001:3.0)
png(path*"defaultIS.png")

plot(π,view="TF", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TFviewIS.png")

plot(π,view="TR", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TRviewIS.png")

plot(π,view="FR", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"FRviewIS.png")
