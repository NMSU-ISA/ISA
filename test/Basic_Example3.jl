using ISA, Plots
C₀ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
C₁ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
C₂ = AMFMtriplet(t->sin(11t),t->250,0.0)
S = compSet([C₀,C₁,C₂])
z = AMFMmodel(S)
plot(S; timeaxis=-1.0:0.001:1.0)
