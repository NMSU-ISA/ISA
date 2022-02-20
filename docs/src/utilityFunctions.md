# Utility Functions

## Unit step function

A **unit step** function is defined by

$u(t) = \begin{cases}
        1, &   t \geq 0 \\
        0, &   t < 0       
        \end{cases}.$

```@example
using ISA
t = 1.25
x(t) = u(t-0.25)-u(t-2.5)
```

## Dirac delta function
