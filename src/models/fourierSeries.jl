#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

"""
    S = fourierSeries(T, aₖ, kInds)

Create a 'AMFMmodel' by specifiying components drawn from a Fourier Series
  where 'T' is the fundemental period, 'aₖ' is a function specifying the Fourier
  series coefficients, and 'kInds' is a vector containing values of `k` to
  consider in the partial sum.

# Examples
```@example
using ISA, Plots
T = 1.0
aₖ(k) = 1.0
kInds = collect(-25:25)
z = fourierSeries(T, aₖ, kInds)
plot(z; timeaxis=-1.0:0.001:1.0)
```
"""
function fourierSeries(T::Real, aₖ::Function, kInds::Array{Int,1}=Vector(-100:100))
  function getIA(k)
    function a(t::Real)
      ia = abs(aₖ(k))
      return ia::Real
    end
    return a
  end
  function getIF(k)
      function ω(t::Real)
        omega = k/T
        return omega::Real
      end
    return ω
  end
  function getPh(k)
    ph = angle(aₖ(k))
    return ph
  end
  S = [ AMFMcomp( getIA(k), getIF(k), getPh(k) ) for k ∈ kInds]
  return AMFMmodel(S)
end

# CONSTRUCTIONS
fourierSeries(T::Real, aₖ::Function, kInds::StepRangeLen) = fourierSeries(T, aₖ, collect(kInds))
fourierSeries(T::Real, aₖ::Function, kInds::UnitRange) = fourierSeries(T, aₖ, collect(kInds))
