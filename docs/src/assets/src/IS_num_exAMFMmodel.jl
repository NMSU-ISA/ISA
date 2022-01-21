path = "docs/src/assets/"

using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->1.0+0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:3
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
plot(𝐳)
png(path*"IS_num_exAMFMmodel1.png")

using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->100*t+7.5*sin(t),0.1)
ψ₂ = AMFMcomp(t->1.0,t->10*t,0.1)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
plot(𝐳,view="RT")
png(path*"IS_num_exAMFMmodel2.png")
