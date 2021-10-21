using QuadGK

struct AMFMtriplet
  a::Function #real-valued function of time
  ω::Function #real-valued function of time
  φ::Real     #real-value
  function AMFMtriplet(a, ω, φ)
    if !(all(Base.return_types(a, (Int64,)).<:Real)) ; error("IA must be a real-valued function of one real variable"); end
    if !(all(Base.return_types(ω, (Int64,)).<:Real)) ; error("IF must be a real-valued function of one real variable"); end
    return new(a, ω, φ)
  end
end
AMFMtriplet(a, ω) = AMFMtriplet(a, ω, zero(Float64))

struct AMFMcomp
  C::AMFMtriplet
end

AMFMcomp(a, ω) = AMFMcomp( AMFMtriplet(a, ω, 0.0))
AMFMcomp(a, ω) = AMFMcomp(a, ω, 0.0)

# Method -1

function (ψ::AMFMcomp)(t::Vector{<:Real})
#References: Sandoval, Steven, and Phillip L. De Leon. "The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis." IEEE Transactions on Signal Processing 66.21 (2018): 5679-5693.
  a, ω, φ = ψ.C.a, ψ.C.ω, ψ.C.φ
  temp = quadgk.(ω, 0.0, t)
  θ = [ temp[i][1] for i in 1:length(t) ]
  a.(t) .* exp.( 1im .* ( θ .+ φ ) )
end

# Method - 2
#function (ψ::AMFMcomp)(t::Vector{<:Real})
#  AMFMtriplet(a, ω) = AMFMtriplet(a, ω, zero(Float64))
#    return AMFMcomp( AMFMtriplet(a, ω))
#end



function (ψ::AMFMcomp)(t::Real)
  return (ψ::AMFMcomp)([t::Real])[1]
end

function (ψ::AMFMcomp)(t::StepRangeLen)
  return (ψ::AMFMcomp)(collect(t))
end

function (ψ::AMFMcomp)(t::UnitRange)
  return (ψ::AMFMcomp)(collect(t))
end
