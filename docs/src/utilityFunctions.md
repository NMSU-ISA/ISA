# Utility Functions

## Unit Step Function

We include a **unit step function** `u(t)` defined as

$\mathrm{u}(t) = \begin{cases}
        1, &   t \geq 0 \\
        0, &   t < 0       
        \end{cases}.$

## Unnormalized Gaussian Function

We include an unnormalized **Gaussian function** denoted `𝒩ᵤ(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` defined as


$\mathcal{N}_\mathrm{u}(x;\mu,\sigma) = \exp\left(-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2\right).$


## Unit Area Gaussian Function

We include a unit area **Gaussian function** denoted `𝒩(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` defined as

$\mathcal{N}(x;\mu,\sigma) = \frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2\right).$

## Dirac Delta Approximation

We include a Gaussian approximation for the **Dirac delta function** denoted `δ(t; σ)` defined as

$δ(t;\sigma) = \frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{1}{2}\left(\frac{t^2}{\sigma^2}\right)\right).$

## Normalized Dirac Delta Approximation

We include an amplitude normalized Gaussian approximation for the **Dirac delta function** denoted `δn(t; σ)` defined as

$δ_n(t;\sigma) = \exp\left(-\frac{1}{2}\left(\frac{t^2}{\sigma^2}\right)\right).$
