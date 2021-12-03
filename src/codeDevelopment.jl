

# -----------------------------------------------------------------
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
# -----------------------------------------------------------------






# -----------------------------------------------------------------
using ISA, Plots, Interact #References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.
@manipulate for a= 0:0.05:1, ω = -5:0.1:20, φ = -pi:pi/50:pi
    a₀(t) = a
    ω₀(t) = ω
    φ₀ = φ
    𝐶₀ = AMFMcomp(a₀,ω₀,φ₀)
    plot(𝐶₀)
end
# -----------------------------------------------------------------
