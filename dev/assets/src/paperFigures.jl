path = "docs/src/assets/"

using ISA, Plots
fs = 16_000
t = 0.0:1/fs:3.0
𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
𝐶₂ = AMFMtriplet(t->𝒩ᵤ(t; μ=1.5, σ=1.0), t->150 + 125sin(5t), π)
𝐶₃ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂,𝐶₃])
z = AMFMmodel(𝑆)

plot(𝐶₀,timeaxis=t)
plot!(𝐶₁,timeaxis=t)
plot!(𝐶₂,timeaxis=t)
plot!(𝐶₃,linealpha = sign.(abs.(𝐶₃.a.(t))),timeaxis = t)
png(path*"paperFigureIS.png")

plot(z,timeaxis=t)
png(path*"paperFigureArgand.png")
