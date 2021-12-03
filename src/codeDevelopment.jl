using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect(0:1/fs:1)
𝛹₀ = numComp( ψ₀(t), fs )
𝛹₁ = numComp( ψ₁(t), fs )
𝛹₂ = numComp( ψ₂(t), fs )
Ξ = numModel([𝛹₀,𝛹₁,𝛹₂],t,fs)
𝚿 = AMFMdemod(Ξ)
