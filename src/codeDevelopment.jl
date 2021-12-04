

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)

z = AMFMmodel(𝑆)
plot(z; timeaxis=0.0:0.001:3.0)


using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
ψ₀ = AMFMcomp(𝐶₀)


plot(ψ₀; timeaxis=-1.0:0.001:1.0)

plot(𝐶₀; timeaxis=-1.0:0.001:1.0)
plot!( camera=(0,90),
       zlabel="", zticks=:false,
       left_margin=15Plots.mm, margin=5Plots.mm,
       yrotation = 90, ymirror=true)



       𝐶₀ = AMFMtriplet(t->exp(-t^2),t->200.0,0.0)
       𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
       𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->100 + 70.5*sin(5t),π)
       𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
       plot(𝑆; timeaxis=0.0:0.001:3.0)
















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
