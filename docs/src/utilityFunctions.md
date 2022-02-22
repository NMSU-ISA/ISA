# Utility Functions

## Unit Step Function

We define a **unit step function** `u(t)` as

$\mathrm{u}(t) = \begin{cases}
        1, &   t \geq 0 \\
        0, &   t < 0       
        \end{cases}.$
Note that we chosen the value at $t=0$ as $1$.

## Unnormalized Gaussian Function

We define an unnormalized **Gaussian function** denoted `𝒩ᵤ(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` as

$ \mathcal{N}_\mathrm{u}(x;\mu,\sigma) = \exp\left(-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2\right).$

## Unit Area Gaussian Function

We define a unit area **Gaussian function** denoted `𝒩(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` as

$\mathcal{N}(x;\mu,\sigma) = \frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2\right).$

## Dirac Delta Approximation

We define a Gaussian approximation for the **Dirac delta function** denoted `δ(t; σ)` as

$δ(t) = \frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{1}{2}\left(\frac{t^2}{\sigma^2}\right)\right).$
