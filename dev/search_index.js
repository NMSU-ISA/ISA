var documenterSearchIndex = {"docs":
[{"location":"basics/models/#AM–FM-Models-1","page":"AM–FM Models","title":"AM–FM Models","text":"","category":"section"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"A component set  maps to an AM–FM model AMFMmodel.","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"zleft( t  mathscrS vphantom0^0right)  triangleq sumlimits_k=0^K-1psi_kleft( t  mathscrC_k vphantom0^0right)mathscrStriangleqleftmathscrC_0mathscrC_1cdotsmathscrC_K-1vphantom0^0right","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"This mapping is provided in the ISA module.","category":"page"},{"location":"basics/models/#Defining-an-AM–FM-Model-1","page":"AM–FM Models","title":"Defining an AM–FM Model","text":"","category":"section"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"We define an AM–FM model primarily by passing an object, 𝑆 to the function AMFMmodel(). First, define a component set, 𝑆 by passing a vector of type AMFMtriplet to the function compSet.","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\njulia> 𝑆 = compSet([𝐶₀,𝐶₁]);\njulia> z = AMFMmodel(𝑆)\nAMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1)]))","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"We also allow an AM–FM model AMFMmodel to be defined by passing an vector of AMFMcomp to the function AMFMmodel().","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> ψ₀ = AMFMcomp(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> ψ₁ = AMFMcomp(a₁,ω₁,φ₁);\njulia> z = AMFMmodel([ψ₀,ψ₁])\nAMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1)]))\n","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"There is another method to define AM–FM model AMFMmodel by passing a vector of AMFMtriplet to the function AMFMmodel().","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\njulia> z = AMFMmodel([𝐶₀,𝐶₁])\nAMFMmodel(compSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1)]))","category":"page"},{"location":"basics/models/#Evaluating-an-AM–FM-Model-1","page":"AM–FM Models","title":"Evaluating an AM–FM Model","text":"","category":"section"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"Once an  AM–FM model AMFMmodel is defined, it can be evaluated at a time instant Float64.","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\njulia> 𝑆 = compSet([𝐶₀,𝐶₁]);\njulia> z = AMFMmodel(𝑆);\njulia> t₀ = 2.0;\njulia> z(t₀)\n0.30292900716627164 + 0.9352632324337417im","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"or over a step range of time instants.","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\njulia> 𝑆 = compSet([𝐶₀,𝐶₁]);\njulia> z = AMFMmodel(𝑆);\njulia> t = 0.0:0.25:1.0;\njulia> z(t)\n5-element Vector{ComplexF64}:\n  1.9950041652780257 + 0.09983341664682815im\n   1.740533956870742 + 0.8512794956108032im\n  0.6397945459984344 + 1.631061619726915im\n -0.9335680061860003 + 0.7954494882259775im\n 0.22488587703875393 - 0.5913028530884702im","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"Another example of evaluating an AM–FM model over a range of time instants using the Plots module follows.","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"using Plots\nt = 0.0:0.005:2.0\np1 = plot(t, real(z(t)), xlab=\"t\", ylab=\"real\", legend = :false)\np2 = plot(t, imag(z(t)), xlab=\"t\", ylab=\"imag\", legend = :false)\nplot(p1, p2, layout = (2,1))","category":"page"},{"location":"basics/models/#","page":"AM–FM Models","title":"AM–FM Models","text":"(Image: )","category":"page"},{"location":"basics/triplets/#Cannonical-Triplets-and-Component-Sets-1","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"","category":"section"},{"location":"basics/triplets/#Cannonical-Triplets-1","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets","text":"","category":"section"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"A cannonical triplet consists of an instantaneous amplitude (IA) Function, an instantaneous frequency (IF) Function, and a phase reference Real.","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"mathscrCtriangleqlefta(t)omega(t) phivphantom0^0right","category":"page"},{"location":"basics/triplets/#Defining-a-Cannonical-Triplet-1","page":"Cannonical Triplets and Component Sets","title":"Defining a Cannonical Triplet","text":"","category":"section"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"We define an cannonical triplet  by passing the function AMFMtriplet() an instantaneous amplitude a(t) which is a real valued function of time, an instantaneous frequency omega(t) a real valued function of time , and a phase reference phi which is a real number as its input arguments. The function AMFMtriplet() will return the required cannonical triplet, 𝐶 as an object of type AMFMtriplet as follows","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀)\nAMFMtriplet(a₀, ω₀, 0.0)\n","category":"page"},{"location":"basics/triplets/#Component-Sets-1","page":"Cannonical Triplets and Component Sets","title":"Component Sets","text":"","category":"section"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"A component set is a set of cannonical triplet of type Vector{AMFMtriplet}.","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"mathscrStriangleqleftmathscrC_0mathscrC_1cdotsmathscrC_K-1vphantom0^0right","category":"page"},{"location":"basics/triplets/#Defining-a-Component-Set-1","page":"Cannonical Triplets and Component Sets","title":"Defining a Component Set","text":"","category":"section"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"We define a component set primarily by defining a structure or a constructor method which contains the object 𝑆 that creates a vector of cannonical triplets.","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 1.0;\njulia> ω₁(t) = 10*t;\njulia> φ₁ = 0.1;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\n\njulia> a₂(t) = 0.8*cos(2t);\njulia> ω₂(t) = 10 + 7.5*sin(t);\njulia> φ₂ = π;\njulia> 𝐶₂ = AMFMtriplet(a₂,ω₂,φ₂);\n\njulia> 𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])\ncompSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 0.1), AMFMtriplet(a₂, ω₂, π)])","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"We also allow another method to define a component set by providing the vector of AM-FM components as follows","category":"page"},{"location":"basics/triplets/#","page":"Cannonical Triplets and Component Sets","title":"Cannonical Triplets and Component Sets","text":"julia> using ISA\njulia> a₀(t) = cos.(t);\njulia> ω₀(t) = 100;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\n\njulia> a₁(t) = 2*t;\njulia> ω₁(t) = 10;\njulia> φ₁ = 1.0;\njulia> 𝐶₁ = AMFMtriplet(a₁,ω₁,φ₁);\n\njulia> ψ₀ = AMFMcomp(C₀);\njulia> ψ₁ = AMFMcomp(C₁);\njulia> S = compSet([ψ₀,ψ₁])\n\ncompSet(AMFMtriplet[AMFMtriplet(a₀, ω₀, 0.0), AMFMtriplet(a₁, ω₁, 1.0)])","category":"page"},{"location":"cite/#Citation-1","page":"Citation","title":"Citation","text":"","category":"section"},{"location":"cite/#","page":"Citation","title":"Citation","text":"If you use this software in you research, please cite the following work.","category":"page"},{"location":"cite/#","page":"Citation","title":"Citation","text":"Sandoval, Steven, and Phillip L. De Leon. \"The Instantaneous Spectrum: A General Framework for Time-Frequency Analysis.\" IEEE Transactions on Signal Processing, vol. 66, pp. 5679–5693, Nov. 2018.","category":"page"},{"location":"cite/#","page":"Citation","title":"Citation","text":"@article{Sandoval2018ISA,\n           title = {The Instantaneous Spectrum: A General Framework for\n                    Time-Frequency Analysis},\n           author = {S.~Sandoval and P.~L.~{De~Leon}},\n           journal = {{IEEE Trans.~Signal Process.}},\n           volume = {66},\n           year = {2018},\n           month = {Nov},\n           pages = {5679-5693}\n}","category":"page"},{"location":"basics/components/#AM–FM-Components-1","page":"AM–FM Components","title":"AM–FM Components","text":"","category":"section"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"A component triplet  maps to an AM–FM component AMFMcomp.","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"psi_k left( t  mathscrC_k vphantom0^0right) triangleq a_k(t) expleft(mathrmj leftint_-infty^t omega_k(tau)mathrmdtau +phi_kright right)","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"This mapping is provided in the ISA module.","category":"page"},{"location":"basics/components/#Defining-an-AM–FM-Component-1","page":"AM–FM Components","title":"Defining an AM–FM Component","text":"","category":"section"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"We define an AM–FM component by passing the function AMFMcomp() an object of type AMFMtriplet. First we create an object say, C of type AMFMtriplet by providing an instantaneous amplitude a(t), an instantaneous frequency omega(t), and a phase reference phi to function AMFMtriplet. Then we simply pass the object C to the function AMFMcomp() that will result into required AM–FM component as follows","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\njulia> ψ₀ = AMFMcomp(𝐶₀)\nAMFMcomp(AMFMtriplet(a₀, ω₀, 0.0))\n","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"We also allow an AM–FM component AMFMcomp to be defined by passing the function AMFMcomp() an instantaneous amplitude (IA) Function, an instantaneous frequency (IF) Function, and a phase reference Real as follows:","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 1.0;\njulia> ψ₀ = AMFMcomp(a₀,ω₀,φ₀)\nAMFMcomp(AMFMtriplet(a₀, ω₀, 1.0))\n","category":"page"},{"location":"basics/components/#Evaluating-an-AM–FM-Component-1","page":"AM–FM Components","title":"Evaluating an AM–FM Component","text":"","category":"section"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"Once an  AM–FM component AMFMcomp is defined it can be evaluated at a time instant Float64.","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\njulia> ψ₀ = AMFMcomp(𝐶₀);\njulia> t₀ = 0.15;\njulia> ψ₀(t₀)\n0.9340814341784995 + 0.2889452476787552im","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"or over a step range of time instants.","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"julia> using ISA\njulia> a₀(t) = exp(-t^2);\njulia> ω₀(t) = 2.0;\njulia> φ₀ = 0.0;\njulia> 𝐶₀ = AMFMtriplet(a₀,ω₀,φ₀);\njulia> ψ₀ = AMFMcomp(𝐶₀);\njulia> t = 0.0:0.25:1.0;\njulia> ψ₀(t)\n5-element Vector{ComplexF64}:\n                 1.0 + 0.0im\n  0.8244125223371318 + 0.45037861361117465im\n 0.42078785890539294 + 0.655338261900256im\n 0.04030484257978472 + 0.5683555111221924im\n -0.1530918656742263 + 0.33451182923926226im","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"Another example of evaluating an AM–FM component over a range of time instants using the Plots module follows.","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"using Plots\nt = 0.0:0.005:2.0\np1 = plot(t, real(ψ₀(t)), xlab=\"t\", ylab=\"real\", legend = :false)\np2 = plot(t, imag(ψ₀(t)), xlab=\"t\", ylab=\"imag\", legend = :false)\nplot(p1, p2, layout = (2,1))","category":"page"},{"location":"basics/components/#","page":"AM–FM Components","title":"AM–FM Components","text":"(Image: )","category":"page"},{"location":"#ISA:-The-Julia-Library-for-Instantaneous-Spectral-Analysis-1","page":"Home","title":"ISA: The Julia Library for Instantaneous Spectral Analysis","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"#Installation-1","page":"Home","title":"Installation","text":"","category":"section"},{"location":"#Users-1","page":"Home","title":"Users","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Download Julia 1.6 or later, if you haven't already.\nAdd the ISA module entering the following at the REPL ]add https://github.com/NMSU-ISA/ISA.","category":"page"},{"location":"#Student-Developers-1","page":"Home","title":"Student Developers","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Download/Clone the ISA module to username/.julia/dev/.\nEnter the package manager in REPL by pressing ]  then add the package by typing dev ISA rather than add ISA.","category":"page"},{"location":"#Type/Function-Index-1","page":"Home","title":"Type/Function Index","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Modules = [ISA]","category":"page"},{"location":"#ISA.AMFMcomp","page":"Home","title":"ISA.AMFMcomp","text":"ψ = AMFMcomp(C)\nψ = AMFMcomp(a, ω, φ)\nψ = AMFMcomp(a, ω)\n\nCreate a 'AMFMcomp' paramtertized by a single 'AMFMtriplet'.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.AMFMmodel","page":"Home","title":"ISA.AMFMmodel","text":"z = AMFMmodel(S)\nz = AMFMmodel([ψ₁,ψ₂,…,ψₖ])\n\nCreate a 'AMFMmodel' paramtertized by a 'compSet'.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.AMFMtriplet","page":"Home","title":"ISA.AMFMtriplet","text":"C = AMFMtriplet(a, ω, φ)\nC = AMFMtriplet(a, ω)\n\nCreate a 'AMFMtriplet' consisting of an instantenouse amplitude function a, and instantaneous frequency function ω, and a phase reference φ.\n\nCalled with two inputs a, ω, this is equivalent to AMFMtriplet(a, ω, 0.0).\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.compSet","page":"Home","title":"ISA.compSet","text":"S = compSet([C₁,C₂,…,Cₖ])\nS = compSet([ψ₁,ψ₂,…,ψₖ])\n\nCreate a 'compSet' paramtertized by a vector of 'AMFMtriplet'.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.demodComp","page":"Home","title":"ISA.demodComp","text":"𝚿 = demodComp(Ψ, t, fs, a, ω, s, σ, θ)\n\nCreate a 'demodComp'.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.numComp","page":"Home","title":"ISA.numComp","text":"Ψ = numComp(Ψ, t, fs)\nΨ = numComp(Ψ, t)\nΨ = numComp(Ψ, fs)\nΨ = numComp(Ψ)\n\nCreate a 'numComp' consisting of a complex-valed signal Ψ, and time index t, and sampling frequency fs.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"type"},{"location":"#ISA.AMFMdemod-Tuple{numComp}","page":"Home","title":"ISA.AMFMdemod","text":"𝚿 = AMFMdemod(Ψ)\n\nCreate a demodComp' from a 'numComp'.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"method"},{"location":"#ISA.derivApprox-Tuple{Vector{Float64}}","page":"Home","title":"ISA.derivApprox","text":"f′ = derivApprox(f; fs, method)\n\nNumerically approximate the derivative of a sampled signal.\n\nCalled with a single input 'f', is equivalent to derivApprox(f, fs=1.0, method=\"center11\").\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"method"},{"location":"#ISA.fourierSeries","page":"Home","title":"ISA.fourierSeries","text":"S = fourierSeries(T, aₖ, kInds)\n\nCreate a 'AMFMmodel' by specifiying components drawn from a Fourier Series   where 'T' is the fundemental period, 'aₖ' is a function specifying the Fourier   series coefficients, and 'kInds' is a vector containing values of k to   consider in the partial sum.\n\nExamples\n\njulia>\n\n<EXAMPLE HERE>\n\n\n\n\n\n\n","category":"function"},{"location":"basics/spectra/#Instantaneous-Spectra-1","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"","category":"section"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"A component set Array{Tuple{Function,Function,Real},1} maps to an instantaneous spectrum (IS).","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"The two-dimensional (2-D) IS in the time-frequency coordinates for a signal expressed with set of canonical triplets  mathscrS=mathscrC_0mathscrC_1cdotsmathscrC_K-1 is given by","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"mathcalS(tomegamathscrS)  =  2 pi sumlimits_k=0^K-1 psi_kleft( t  mathscrC_k vphantom0^0right)deltaleft(vphantom0^0omega-omega_k(t)vphantom0^0right)","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"and  three-dimensional (3-D) IS in the time-frequency-real coordinates is given by","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"mathcalS(tomegasmathscrS) = 2 pi sumlimits_k=0^K-1 psi_kleft( t  mathscrC_k vphantom0^0right) ^2deltaleft(omega-omega_k(t)s-s_k(t)vphantom0^0right)","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"Visualization for ISs are provided in the ISA module.","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"using ISA","category":"page"},{"location":"basics/spectra/#Visualizing-an-Instantaneous-Spectrum-1","page":"Instantaneous Spectra","title":"Visualizing an Instantaneous Spectrum","text":"","category":"section"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"We can visualize a 3-D IS as follows. First, define a component set.","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"a₀(t) = exp(-t^2)\nω₀(t) = 2.0\nφ₀ = 0.0\n𝐶₀ = (a₀,ω₀,φ₀)\n\na₁(t) = 1.0\nω₁(t) = 10*t\nφ₁ = 0.1\n𝐶₁ = (a₁,ω₁,φ₁)\n\na₂(t) = 0.8*cos(2t)\nω₂(t) = 10 + 7.5*sin(t)\nφ₂ = π\n𝐶₂ = (a₂,ω₂,φ₂)\n\n𝑆 = [𝐶₀,𝐶₁,𝐶₂]","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"Then, pass the component set Array{Tuple{Function,Function,Real},1} and a time index Array{Float64,1} to the function isaPlot3d().","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"t = 0.0:0.005:2.0\nisaPlot3d(𝑆, t)","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"(Image: )","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"NOTE: isaPlot3d() is still under development.","category":"page"},{"location":"basics/spectra/#","page":"Instantaneous Spectra","title":"Instantaneous Spectra","text":"~!~ MORE/BETTER VISUALIZATION TOOLS ARE CURRENTLY IN DEVELOPMENT ~!~","category":"page"},{"location":"numerical/componentsNumerical/#Numerical-AM–FM-Components-1","page":"Numerical Components","title":"Numerical AM–FM Components","text":"","category":"section"},{"location":"numerical/componentsNumerical/#","page":"Numerical Components","title":"Numerical Components","text":"A Numerical AM–FM component AMFMcompN is a complex vector Vector{ComplexF64} which has be demodulated using the function AMFMdemod().","category":"page"},{"location":"numerical/componentsNumerical/#","page":"Numerical Components","title":"Numerical Components","text":"using ISA\nusing Plots\n\na₀(t) = exp(-t^2)\nω₀(t) = 25\nφ₀ = 0\n𝐶₀ = Tuple([a₀,ω₀,φ₀])\nψ₀ = AMFMcomp(𝐶₀)\na₁(t) = exp(-0.5t^2)\nω₁(t) = 10 + 3*sin(t)\nφ₁ = 0\n𝐶₁ = Tuple([a₁,ω₁,φ₁])\nψ₁ = AMFMcomp(𝐶₁)\n\nt = -1.0:0.01:1.0\n\np1 = isaPlot3d(ψ₀,t)\np2 = isaPlot3d(AMFMmodel([ψ₀,ψ₁]),t)\n\n#COMPONENT OBSERVATION\nΨ₀ = ψ₀(t)\nΨ₁ = ψ₁(t)\n\n#ESTIMATE NUMERICAL COMPONENT\n𝚿₀ = AMFMdemod(Ψ₀,t)\n𝚿₁ = AMFMdemod(Ψ₁,t)\n\np3 = isaPlot3d(𝚿₀)\np4 = isaPlot3d([𝚿₀,𝚿₁])\nplot(p1,p2,p3,p4)","category":"page"}]
}
