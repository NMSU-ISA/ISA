
struct compSet
  S::Vector{AMFMtriplet}
end

mutable struct AMFMmodel
  S::compSet
end

function (z::AMFMmodel)(t::Vector{<:Real})
#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.
  out = zeros(size(t))
  for k∈1:length(z.S.S)
    ψ = AMFMcomp(z.S.S[k])
    out += ψ(t)
  end
  return out
end

function (z::AMFMmodel)(t::Real)
  return (z::AMFMmodel)([t])[1]
end

function (z::AMFMmodel)(t::StepRangeLen)
  return (z::AMFMmodel)(collect(t))
end

function (z::AMFMmodel)(t::UnitRange)
  return (z::AMFMmodel)(collect(t))
end
