
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
𝚿₁ = numComp( ψ₁(t), fs )
𝚿₂ = numComp( ψ₂(t), fs )

𝚿₀(5) #desired behavior?

𝐂₀ = AMFMdemod(𝚿₀)
𝐂₁ = AMFMdemod(𝚿₁)
𝐂₂ = AMFMdemod(𝚿₂)

𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])















T = typeof(𝚿₀)
for (name, typ) in zip(fieldnames(T), T.types)
    println("type of the fieldname $name is $typ")
end
