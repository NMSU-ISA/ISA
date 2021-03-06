#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

using DSP #for phase unwrapping

"""
    đ = AMFMdemod(đż)
    đ = AMFMdemod([đżâ,đżâ,đżâ])
    đ = AMFMdemod(đł)

Create a *numerical canonical triplet* 'numTriplet' from a *numerical component* 'numComp'.

Create a *numerical component set* 'numSet' from a *vector of numerical components*.

Create a *numerical component set* 'numSet' from a *numerical AM--FM model* 'numModel'.

# Examples
```@example
using ISA
Ďâ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
fs = 16_000
t = 0:1/fs:1
đżâ = numComp( Ďâ(t), fs )
đâ = AMFMdemod(đżâ)
```

```@example
using ISA
Ďâ = AMFMcomp(t->exp(-t^2),t->200.0,0.0)
Ďâ = AMFMcomp(t->1.0,t->100*t,0.1)
Ďâ = AMFMcomp(t->1+0.8*cos(2t),t->100 + 70.5*sin(t),Ď)
fs = 16_000
t = 0:1/fs:1
đżâ = numComp( Ďâ(t), fs )
đżâ = numComp( Ďâ(t), fs )
đżâ = numComp( Ďâ(t), fs )
đł = numModel([đżâ,đżâ,đżâ])
đ = AMFMdemod(đł)
```
"""
function AMFMdemod(đż::numComp; derivMethod="center11")::numTriplet
  return numTriplet( đż.Î¨,
                     đż.t,
                     đż.fs,
                     abs.(đż.Î¨),
                     derivApprox(unwrap(angle.(đż.Î¨)),fs=đż.fs, method=derivMethod),
                     real.(đż.Î¨),
                     imag.(đż.Î¨),
                     unwrap(angle.(đż.Î¨)),
                     )
end
function AMFMdemod(V::Vector{numComp}; derivMethod="center11")::numSet
  return numSet([ AMFMdemod(đż;derivMethod=derivMethod) for đżâV])
end
function AMFMdemod(đł::numModel; derivMethod="center11")::numSet
  return AMFMdemod(đł.đżâ; derivMethod=derivMethod)
end
"""
    fâ˛ = derivApprox(f; fs, method)

Numerically approximate the derivative `fâ˛` of a signal `f` with sampling rate `fs` using one of the a numerical differentiation methods listed below.

`forward` - forward difference

`backward` - backward difference

`center3` - 3-pt stencil central difference

`center5` - 5-pt stencil central difference

`center7` - 7-pt stencil central difference

`center9` - 9-pt stencil central difference

`center11` - 11-pt stencil central difference [default]

`center13` - 13-pt stencil central difference

`center15` - 15-pt stencil central difference

**References**:
[Numerical Differentiation](http://www.holoborodko.com/pavel/numerical-methods/numerical-derivative/central-differences/), [Finite Difference Coefficients Calculator](https://web.media.mit.edu/~crtaylor/calculator.html)

Called with a single input `f`, is equivalent to `derivApprox(f, fs=1.0, method="center11")`.

A vector of the same length as the input is returned; values at the signal edges that cannot be computed are filled with `NaN`.

# Examples
```@example
using ISA
x = collect(0.0:0.01:10.0)
f = sin.(x)
fâ˛ = derivApprox(f, fs=1.0, method="center11")
```
"""
function derivApprox(x::Vector{Float64}; fs=1.0, method="center11")::Vector{Float64}
    if method == "forward"
        if length(x)<2; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!([NaN],fs.*diff(x))
    end
    if method == "backward"
        if length(x)<2; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!(fs.*diff(x),[NaN])
    end
    if method == "center3"
        if length(x)<3; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!([NaN], fs.*(x[3:end]-x[1:end-2])./2.0 ) ,[NaN])
    end
    if method == "center5"
        if length(x)<5; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!(NaN*ones(Float64,2), fs.*(x[1:end-4]-8.0.*x[2:end-3]+8.0.*x[4:end-1]-x[5:end])./12.0 ) ,NaN*ones(Float64,2))
    end
    if method == "center7"
        if length(x)<7; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!(NaN*ones(Float64,3), fs.*(-x[1:end-6]+ 9.0.*x[2:end-5]- 45.0.*x[3:end-4] +45.0.*x[5:end-2] -9.0.*x[6:end-1] + x[7:end]   )./60.0
 ) ,NaN*ones(Float64,3))
    end
    if method == "center9"
        if length(x)<9; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!(NaN*ones(Float64,4), fs.*(3.0.*x[1:end-8] - 32.0.*x[2:end-7] + 168.0.*x[3:end-6] -672.0.*x[4:end-5] + 672.0.*x[6:end-3] -168.0.*x[7:end-2] + 32.0.*x[8:end-1] -3.0.*x[9:end]  )./840.0
 ) ,NaN*ones(Float64,4))
    end
    if method == "center11"
        if length(x)<11; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!(NaN*ones(Float64,5), fs.*(-2.0.*x[1:end-10] +25.0.*x[2:end-9] -150.0.*x[3:end-8] +600.0.*x[4:end-7] -2100.0.*x[5:end-6] + 2100.0.*x[7:end-4]  -600.0.*x[8:end-3] +150.0.*x[9:end-2] -25.0.*x[10:end-1] +2.0.*x[11:end]  )./2520.0
 ) ,NaN*ones(Float64,5))
    end
    if method == "center13"
        if length(x)<13; error("derivApprox:vector too short for selected method"); end
        xâ˛ = append!( append!(NaN*ones(Float64,6), fs.*(5.0.*x[1:end-12] - 72.0.*x[2:end-11] + 495.0.*x[3:end-10] -2200.0.*x[4:end-9]   +7425.0.*x[5:end-8]  -23760.0.*x[6:end-7]  +23760.0.*x[8:end-5]   + -7425.0.*x[9:end-4]   + 2200.0.*x[10:end-3] -495.0.*x[11:end-2] + 72.0.*x[12:end-1] -5.0.*x[13:end]  )./27720.0
 ) ,NaN*ones(Float64,6))
    end
    return xâ˛
end
