using ISA
using Test
using LinearAlgebra
@testset "ISA.jl" begin
    C = AMFMtriplet(t->exp(-t^2),ω->100,0.0)
    ψ = AMFMcomp(C) #method 1
    #ψ = AMFMcomp(t->exp(-t^2),ω->100,0.0) #method 2

    @test norm(ψ(2.0).-[0.00892315352647076 - 0.015994997938278837im]) ≈0.0
    @test norm(ψ(collect(1:3)).-[0.31722938484878416 - 0.1862815090798727im,0.00892315352647076 - 0.015994997938278837im,-2.7269394561533185e-6 - 0.0001233796723367148im]) ≈0.0
end
