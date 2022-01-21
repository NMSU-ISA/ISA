path = "docs/src/assets/"

using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
fs = 16_000
t = 0:1/fs:1
𝚿₀ = numComp( ψ₀(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
plot(𝐂₀)
png(path*"IS_num_exAMFMcomp1.png")
