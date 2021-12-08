# Numerical Canonical Triplets and Component Sets

## Defining a Numerical Canonical Triplet

A **numerical canonical triplet** `𝐂₀` (`numTriplet`) can be defined by calling `AMFMdemod()` with a **numerical AM--FM component** `𝚿₀` (`numComp`).
```@example
using ISA
ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = collect(0:1/fs:1)
𝚿₀ = numComp( ψ₀(t), fs )
𝐂₀ = AMFMdemod(𝚿₀)
```

## Defining a Numerical Component Set

A **numerical component set** `𝐒` (`numSet`) is parameterized by a *set of numerical canonical triplet* `[𝐂₀,𝐂₁,𝐂₂]`.
```@example
using ISA
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
```

# Numerical Instantaneous Spectra

## Visualizing Numerical Instantaneous Spectra
<DOCUMENT FUNCTIONALITY HERE>
