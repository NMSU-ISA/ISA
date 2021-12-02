using ISA, Plots

fs = 16_000

a₀(t) = exp(-1/2*(t-0.5)^2/(1.0/(10.0))^2)
ω₀(t) = 2π*(70 + 50*sin(2π*2*t))
𝐶₀ = AMFMtriplet(a₀,ω₀)

a₁(t) = 0.5 + 1/3*sin(20.0*t)
ω₁(t) = 2π*100.0
𝐶₁ = AMFMtriplet(a₁,ω₁)

a₂(t) = 0.54 - 0.46 * cos.(2π*t)
ω₂(t) = 2π*(10.0 + exp(t+4.5)-exp(4.5))
𝐶₂ = AMFMtriplet(a₂,ω₂)

plot(𝐶₀,timeaxis=0.0:1/fs:1.0)
plot!(𝐶₁,timeaxis=0.0:1/fs:1.0)
plot!(𝐶₂, timeaxis=0.0:1/fs:1.0, camera = (7.5,80),
xticks=:false,yticks=:false ,zticks=:false,
xlabel = "",ylabel = "",zlabel = "")

savefig("logo.png")
savefig("logo-dark.png")
