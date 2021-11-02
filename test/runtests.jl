using ISA
using Test
using LinearAlgebra
@testset "ISA.jl" begin

    C = AMFMtriplet(t->exp(-t^2),ω->100,0.0)
    ψ = AMFMcomp(C) #method 1

    @test norm(ψ(2.0).-[0.00892315352647076 - 0.015994997938278837im]) ≈0.0
    @test norm(ψ(collect(1:3)).-[0.31722938484878416 - 0.1862815090798727im,0.00892315352647076 - 0.015994997938278837im,-2.7269394561533185e-6 - 0.0001233796723367148im]) ≈0.0

    a(t) = exp(-t^2)
    ω(t) = 2.0*t
    φ = 0.0
    ψ = AMFMcomp(a,ω,φ) #method 2
    @test norm(ψ(1.0) .- [0.19876611034641298 + 0.3095598756531122im]) ≈0.0

    C₀ = AMFMtriplet(t->sin.(t),ω->10,0.1)
    C₁ = AMFMtriplet(t->2,ω->100,0.0)
    S = compSet([C₀,C₁])
    z = AMFMmodel(S) #method 1

    @test norm(z(1.0).-[1.0678122692987118 - 1.5387100967178977im]) ≈0.0

    C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
    ψ₀ = AMFMcomp(C₀)
    C₁ = AMFMtriplet(t->2,ω->10,0.0)
    ψ₁ = AMFMcomp(C₁)
    z = AMFMmodel([ψ₀,ψ₁]) #method 2
    @test norm(z(2.0).-[0.578153926388216 + 2.1672544356642636im]) ≈0.0

    C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
    C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
    z = AMFMmodel([C₀,C₁]) #method 3
    @test norm(z(3.0).-[5.411410145804563 - 1.4372358186796916im]) ≈0.0

end
