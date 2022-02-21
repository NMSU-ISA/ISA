# Utility Functions

## Unit step function

A **unit step function** is defined by

$u(t) = \begin{cases}
        1, &   t \geq 0 \\
        0, &   t < 0       
        \end{cases}.$

```@example
using ISA
t = 1.25
x = u(t-0.25)-u(t-2.5)
```

## Gaussian function

A **Gaussian function** is defined by

$f(x) = \mathrm{e}^{-0.5\left(\dfrac{x-μ}{σ}\right)^2}$
where $x$ is an input data, μ is mean and σ is the standard
deviation.

```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
f = 𝒩ᵤ(x::Float64; μ, σ)
```

## Normalized Gaussian function

A normalized **Gaussian function** is defined by

$f(x) = \dfrac{1}{√(2π)σ}\mathrm{e}^{-0.5\left(\dfrac{x-μ}{σ}\right)^2}$
where $x$ is an input data, μ is mean and σ is the standard
deviation.

```@example
using ISA
x = 2.0
μ = 1.0
σ = 0.1
f = 𝒩(x::Float64; μ, σ)
```

## Dirac delta function

A **Dirac delta function** is defined using Gaussian approximation with
zero mean and variance $σ^2$ tending to zero (in limit).

$δ(t) = \mathrm{e}^{-0.5\left(\dfrac{t^2}{σ^2}\right)}.$

Another representation of **Dirac delta function** is defined
using normalized Gaussian approximation with
zero mean and variance $σ^2$ tending to zero (in limit).
This definition truly represents the Dirac delta function.

$δ(t) = \dfrac{1}{√(2π)σ}\mathrm{e}^{-0.5\left(\dfrac{t^2}{σ^2}\right)}.$
