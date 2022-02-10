path = "docs/src/assets/"

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)
png(path*"IS_ex0.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)
png(path*"IS_ex1.png")


using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆,timeaxis=0.0:0.001:3.0,view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_ex2.png")


using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t^2+50,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->25 + 10.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆)


using ISA, Plots
𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
𝑆 = compSet([𝐶₀,𝐶₁])
plot(𝑆,realProj=true)
png(path*"realProject.png")


using ISA, Plots
ψ₀ = AMFMcomp(t->t,t->25cos(t)+50,0.0)
plot(ψ₀, timeaxis=0.0:0.001:3.0)
png(path*"defaultColor.png")

plot(ψ₀, timeaxis=0.0:0.001:3.0, colorMap="cubeYF")
png(path*"cubeYFcolor.png")

myColorMap = [RGB(rand(), rand(), rand()) for i in 1:256]
plot(ψ₀, timeaxis=0.0:0.001:3.0, colorMap = myColorMap)
png(path*"myColorMap.png")

#---------------------------------------------------

𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
𝐶₂ = AMFMtriplet(t->𝒩ᵤ(t; μ=1.5, σ=1.0), t->150 + 125sin(5t), π)
𝐶₃ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂,𝐶₃])
plot(𝑆; timeaxis=0.0:0.001:3.0)
png(path*"defaultIS.png")

plot(𝑆,view="TF", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TFviewIS.png")

plot(𝑆,view="TR", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"TRviewIS.png")

plot(𝑆,view="FR", timeaxis=0.0:0.001:3.0,
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"FRviewIS.png")
