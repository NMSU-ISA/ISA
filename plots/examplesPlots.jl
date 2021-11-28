using ISA, Plots

#include(raw".\GRrecipes.jl")

#DEFINE 0th CANONICAL TRIPLET
a₀(t) = exp(-t^2)
ω₀(t) = 2.0
φ₀ = 0.0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)
#DEFINE 0th COMPONENT
ψ₀ = AMFMcomp(𝐶₀)
#DEFINE 1st CANONICAL TRIPLET
a₁(t) = 1.0
ω₁(t) = 10*t
φ₁ = 0.1
𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁)
#DEFINE 1st COMPONENT
ψ₁ = AMFMcomp(𝐶₁)
#DEFINE 2nd CANONICAL TRIPLET
a₂(t) = 0.8*cos(2t)
ω₂(t) = 10 + 7.5*sin(t)
φ₂ = π
𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂)
#DEFINE 2nd COMPONENT
ψ₂ = AMFMcomp(𝐶₂)
#DEFINE THE COMPONENT SET
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
#DEFINE THE AMFM MODEL
z = AMFMmodel(𝑆)
#DEFINE A TIME INDEX
t = Array(0.0:0.005:2.0)


# in ISA.jl, we can generate a 3D plot using different methods
# using the plot() function

# METHOD 1: z (AMFM MODEL)
plot(z) # default timeaxis
plot(z, timeaxis=0.0:0.005:3.0) # costum timeaxis


# METHOD 2: 𝑆 (COMPONENT SET)
plot(𝑆)
plot(𝑆,timeaxis=0.0:0.005:3.0)

#Method 3: ψ::AMFMcomp
plot(ψ₀,timeaxis=0.0:0.005:2.0)
plot!(ψ₁,timeaxis=0.0:0.005:2.0)
plot!(ψ₂,timeaxis=0.0:0.005:2.0)


#Method 4: 𝐶::AMFMtriplet
plot(𝐶₀,timeaxis=0.0:0.005:5.0)
plot!(𝐶₁,timeaxis=0.0:0.005:5.0)
plot!(𝐶₂,timeaxis=0.0:0.005:5.0)
