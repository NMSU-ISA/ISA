using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2), t->50.0, 0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀; timeaxis=0.0:0.001:1.0)
png("IS_component.png")
