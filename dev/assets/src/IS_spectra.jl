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
png(path*"defaultIS.png")

plot(𝑆,view="TF")
png(path*"TFviewIS.png")

plot(𝑆,view="TR")
png(path*"TRviewIS.png")

plot(𝑆,view="FR")
png(path*"FRviewIS.png")

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->0.8*cos(2t),t->25 + 10.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁])
plot(𝑆,realProj=true)
png(path*"realProject.png")


using ISA, Plots
ψ₀ = AMFMcomp(t->t,t->25cos(t)+50,0.0)
plot(ψ₀)
png(path*"defaultColor.png")

plot(ψ₀, colorMap="cubeYF")
png(path*"cubeYFcolor.png")
