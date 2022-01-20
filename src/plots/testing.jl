using ISA, Plots

# AMFMmodel EXAMPLE
if 1==1
   𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
   𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
   𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
   𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
   z = AMFMmodel(𝑆)
end

# numComp EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
   fs = 3000
   t = collect(0:1/fs:1)
   𝚿₀ = numComp( ψ₀(t), fs )
   plot(𝚿₀)
end

# numTriplet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   plot(𝐂₀)
end

# numSet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
   ψ₁ = AMFMcomp(t->1.0,t->100*t,0.1)
   ψ₂ = AMFMcomp(t->t,t->25cos(t),0.0)#AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
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
end

# numerical model EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
   ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
   ψ₂ = AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝚿₁ = numComp( ψ₁(t), fs )
   𝚿₂ = numComp( ψ₂(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   𝐂₁ = AMFMdemod(𝚿₁)
   𝐂₂ = AMFMdemod(𝚿₂)
   𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
   #𝐳 = numModel(𝐒)# doesn't work
   𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
   plot(𝐳)
end


# ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
# plot(ψ₀, colorMap="VIRIDIS")
# savefig(raw"C:\Users\hemad\.julia\dev\ISA\docs\src\assets\changeColor.png")
