path = "docs/src/assets/"

using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->100*t,0.1)
ψ₂ = AMFMcomp(t->t,t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:2
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)
𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
plot(𝐒)
png(path*"IS_num_spectra1.png")


using ISA, Plots
ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->100*t,0.1)
ψ₂ = AMFMcomp(t->t,t->10 + 7.5*sin(t),π)
fs = 16_000
t = 0:1/fs:2
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)
𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
plot(𝐒,view="TF")
png(path*"IS_num_spectra2.png")
