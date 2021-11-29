#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.

# ----------------------
# FOURIER SERIES
# ----------------------
"""
    S = fourierSeries(T, aₖ, kInds)

Create a 'AMFMmodel' by specifiying components drawn from a Fourier Series
  where 'T' is the fundemental period, 'aₖ' is a function specifying the Fourier
  series coefficients, and 'kInds' is a vector containing values of `k` to
  consider in the partial sum.

# Examples
```jldoctest
julia>

<EXAMPLE HERE>

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
