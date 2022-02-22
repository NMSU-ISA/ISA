# Utility Functions

## Unit Step Function

We define a **unit step function** `u(t)` as

$u(t) = \begin{cases}
        1, &   t \geq 0 \\
        0, &   t < 0       
        \end{cases}.$

Note that we chosen the value at $t=0$ as $1$.

## Gaussian Function

We define a **Gaussian function** denoted `𝒩ᵤ(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` as

$f(x) = \mathrm{e}^{-0.5\left(\frac{x-μ}{σ}\right)^2}.$


## Normalized Gaussian Function

We define a **unit area Gaussian function** denoted `𝒩(x; μ, σ)` parameterized by mean `μ` and standard deviation `σ` as

$f(x) = \frac{1}{√(2π)σ}\mathrm{e}^{-0.5\left(\frac{x-μ}{σ}\right)^2}$
where $x$ is an input data, μ is mean and σ is the standard
deviation.


## Dirac Delta Approximation

We define a Gaussian approximation for the **Dirac delta function** denoted `δ(t; σ)` as

$δ(t) = \frac{1}{\sqrt{2π}σ}\mathrm{e}^{-0.5\left(\frac{t^2}{σ^2}\right)}.$


## Normalized Dirac Delta Approximation

We define an amplitude normalized Gaussian approximation for the **Dirac delta function** denoted `δn(t; σ)` as

$δ_n(t) = \mathrm{e}^{-0.5\left(\frac{t^2}{σ^2}\right)}.$
