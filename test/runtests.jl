using ISA
using Test
using LinearAlgebra
@testset "ISA.jl" begin

    C = AMFMtriplet(t->exp(-t^2),ω->100,0.0)
    ψ = AMFMcomp(C) # Method 1 for calling AMFMcomp [Primary method]

    @test norm(ψ(2.0).-[0.00892315352647076 - 0.015994997938278837im]) ≈0.0
    @test norm(ψ([1.0,2.0]).-[0.31722938484878416 - 0.1862815090798727im,0.00892315352647076 - 0.015994997938278837im]) ≈0.0
    @test norm(ψ(collect(1:3)).-[0.31722938484878416 - 0.1862815090798727im,0.00892315352647076 - 0.015994997938278837im,-2.7269394561533185e-6 - 0.0001233796723367148im]) ≈0.0
    @test norm(ψ(1.0:0.1:1.2).-[0.31722938484878416 - 0.1862815090798727im,-0.297905288624261 - 0.013193046239668925im,0.19290207250849095 + 0.13756290654119888im]) ≈0.0

    a(t) = exp(-t^2)
    ω(t) = 2.0*t
    φ = 0.0
    ψ = AMFMcomp(a,ω,φ) # Method 2 for calling AMFMcomp
    @test norm(ψ(1.0) .- [0.19876611034641298 + 0.3095598756531122im]) ≈0.0

    C₀ = AMFMtriplet(t->sin.(t),ω->10,0.1)
    C₁ = AMFMtriplet(t->2,ω->100,0.0)
    S = compSet([C₀,C₁])  # Method 1 for calling compSet [Primary method]
    z = AMFMmodel(S)    # Method 1 for calling AMFMmodel [Primary method]

    @test norm(z(1.0).-[1.0678122692987118 - 1.5387100967178977im]) ≈0.0
    @test norm(z([2.0,3.0]).-[1.2607139350797716 - 0.8835580800588573im,-0.008614145678599652 - 2.1360729657685265im]) ≈0.0
    @test norm(z(collect(1:3)).-[1.0678122692987118 - 1.5387100967178977im,1.2607139350797716 - 0.8835580800588573im,-0.008614145678599652 - 2.1360729657685265im]) ≈0.0
    @test norm(z(1.0:0.1:1.2).-[1.0678122692987118 - 1.5387100967178977im,-1.9051457123030229 - 0.9748379427457438im,2.460864948804596 + 0.7421333565723409im]) ≈0.0


    C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
    ψ₀ = AMFMcomp(C₀)
    C₁ = AMFMtriplet(t->2,ω->10,0.0)
    ψ₁ = AMFMcomp(C₁)
    z = AMFMmodel([ψ₀,ψ₁]) # Method 2 for calling AMFMmodel
    @test norm(z(2.0).-[0.578153926388216 + 2.1672544356642636im]) ≈0.0

    C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
    C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
    z = AMFMmodel([C₀,C₁]) # Method 3 for calling AMFMmodel
    @test norm(z(3.0).-[5.411410145804563 - 1.4372358186796916im]) ≈0.0

    C₀ = AMFMtriplet(t->cos.(t),ω->100,0.1)
    C₁ = AMFMtriplet(t->2*t,ω->10,1.0)
    ψ₀ = AMFMcomp(C₀)
    ψ₁ = AMFMcomp(C₁)
    S = compSet([ψ₀,ψ₁]) # Method 2 for calling compSet
    z = AMFMmodel(S)
    @test norm(z(2.0).-[-2.4289272381356413 + 3.6879864883532325im]) ≈0.0

end
