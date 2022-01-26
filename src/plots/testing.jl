using ISA, Plots

# AMFMmodel EXAMPLE
if 1==1
   𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
   𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
   𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
   𝑆 = compSet([𝐶₀,𝐶₂])
   z = AMFMmodel(𝑆)
end
plot(𝑆,realProj=true)

𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁])
plot(𝑆,realProj=true)

# numComp EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
   fs = 3000
   t = collect(0:1/fs:1)
   𝚿₀ = numComp( ψ₀(t), fs )
   plot(𝚿₀)
end

# numTriplet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   plot(𝐂₀)
end

# numSet EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->20.0,0.0)
   ψ₁ = AMFMcomp(t->1.0,t->100*t,0.1)
   ψ₂ = AMFMcomp(t->t,t->25cos(t),0.0)#AMFMcomp(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
   fs = 16_000
   t = 0:1/fs:2
   𝚿₀ = numComp( ψ₀(t), fs )
   𝚿₁ = numComp( ψ₁(t), fs )
   𝚿₂ = numComp( ψ₂(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   𝐂₁ = AMFMdemod(𝚿₁)
   𝐂₂ = AMFMdemod(𝚿₂)
   𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
   plot(𝐒)
end

# numerical model EXAMPLE
if 1==1
   ψ₀ = AMFMcomp(t->exp(-t^2),t->2.0,0.0)
   ψ₁ = AMFMcomp(t->1.0,t->10*t,0.1)
   ψ₂ = AMFMcomp(t->1+0.8*cos(2t),t->10 + 7.5*sin(t),π)
   fs = 16_000
   t = 0:1/fs:1
   𝚿₀ = numComp( ψ₀(t), fs )
   𝚿₁ = numComp( ψ₁(t), fs )
   𝚿₂ = numComp( ψ₂(t), fs )
   𝐂₀ = AMFMdemod(𝚿₀)
   𝐂₁ = AMFMdemod(𝚿₁)
   𝐂₂ = AMFMdemod(𝚿₂)
   𝐒 = numSet([𝐂₀,𝐂₁,𝐂₂])
   #𝐳 = numModel(𝐒)# doesn't work
   𝐳 = numModel([𝚿₀,𝚿₁,𝚿₂])
   # plot(𝐳)
end

𝐒 = numSet([𝐂₀,𝐂₂])
plot(𝐒,realProj=true,view="default")


# attempt fixing NaN problem
𝐂₀
T = typeof(𝐂₀)
T.types
fieldnames(T)[1]
for (name, typ) in zip(fieldnames(T), T.types)
   println(length(𝐂₀.typ))
   # text *= "\n"*"$name is $typ"
end


# savefig(raw"C:\Users\hemad\.julia\dev\ISA\docs\src\assets\changeColor.png")


using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀)
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/default1.png)

savefig(raw"C:\Users\hemad\.julia\dev\ISA\docs\src\assets\default1.png")


# change the time axis and camera angle
# recipes.md
#1
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀)
#2
plot(ψ₀, timeaxis=0.0:0.001:10.0)
#3
plot(ψ₀, camera=(20,50))
#4
plot(ψ₀, yguide="imaginary", ymirror=false)
#5
ψ₀ = AMFMcomp(t->10t,t->25cos(t),0.0)
plot(ψ₀)
#6 TR
plot(ψ₀,view="TR", margin=5Plots.mm)
#7 TI
plot(ψ₀,view="TI",left_margin=15Plots.mm, margin=5Plots.mm)
#8 RI
plot(ψ₀, view="RI",margin=5Plots.mm)
#9 IS 3d
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->10*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆)
#10 TF
plot(𝑆,view="TF",margins=5Plots.mm)
#11 TR
plot(𝑆,view="TR",margins=5Plots.mm)
#12 FR
plot(𝑆,view="FR",margins=5Plots.mm)
#13 real projection
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->2.0,0.0)
𝐶₁ = AMFMtriplet(t->0.8*cos(2t),t->10 + 7.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁])
plot(𝑆,realProj=true)
#14 colormap
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₀)
#14 virdis colormap
plot(ψ₀, colorMap="VIRIDIS")

#same colors??????????
include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")
viridis()
viridis()

#15 margins
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆; timeaxis=0.0:0.001:3.0)
# savefig(raw"C:\Users\hemad\.julia\dev\ISA\docs\src\assets\IS_exFourier3.png")


using ISA, Plots
T = 0.75
j=im
aₖ(k) = ifelse( k==0, 0, (1-exp(-j*k*2π/3)-exp(j*2π/3)*
exp(-j*k*4π/3)+exp(j*2π/3)*exp(-j*k*2π/3)-exp(j*4π/3)*
exp(-j*k*2π)+exp(j*4π/3)*exp(-j*k*4π/3))/(j*k*2π) )
kInds = -150:150
𝑆 = fourierSeries(T, aₖ, kInds)
z = AMFMmodel(𝑆)
plot(𝑆, timeaxis=-1.0:0.001:1.0)


plot(𝑆, timeaxis=-1.0:0.001:1.0, view="TF", left_margin=10Plots.mm)
savefig(raw"C:\Users\hemad\.julia\dev\ISA\docs\src\assets\IS_exFourier9.png")
