path = "docs/src/assets/"

using ISA, Plots
fs = 16_000
t = 0.0:1/fs:3.0
πΆβ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
πΆβ = AMFMtriplet(t->π©α΅€(t; ΞΌ=1.5, Ο=1.0), t->150 + 125sin(5t), Ο)
πΆβ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
π = compSet([πΆβ,πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)

plot(πΆβ,timeaxis=t)
plot!(πΆβ,timeaxis=t)
plot!(πΆβ,timeaxis=t)
plot!(πΆβ,linealpha = sign.(abs.(πΆβ.a.(t))),timeaxis = t)
png(path*"paperFigureIS.png")

plot(z,timeaxis=t)
png(path*"paperFigureArgand.png")
