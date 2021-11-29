using ISA #References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.


# ----------------------------
# BASIC EXAMPLES
# ----------------------------

#DEFINE 0th CANONICAL TRIPLET
a₀(t) = exp(-t^2)
ω₀(t) = 100
φ₀ = 0
𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)

#DEFINE 0th COMPONENT
ψ₀ = AMFMcomp(𝐶₀)


#DEFINE 1st CANONICAL TRIPLET
a₁(t) = 1
ω₁(t) = 10*t
φ₁ = π
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

#EVALUATE THE 0th COMPONENT AT THE POINTS IN THE TIME INDEX
ψ₀(t)

#EVALUATE THE AMFM MODEL AT THE POINTS IN THE TIME INDEX
z(t)

#----------------------------
# FOURIER SERIES
#----------------------------

T = 1.0
aₖ(k) = 1.0
kInds = Vector(-10:10)

z₀ = fourierSeries(T,aₖ,kInds)

z₀(t)
