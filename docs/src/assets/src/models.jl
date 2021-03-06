path = "docs/src/assets/"

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel1.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel2.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
πΆβ = AMFMtriplet(t->1.0,t->100*t,0.1)
πΆβ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),Ο)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFMmodel3.png")

#--------------------------------
using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
πΆβ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
πΆβ = AMFMtriplet(t->sin(11t),t->250,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel4.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
πΆβ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
πΆβ = AMFMtriplet(t->sin(11t),t->250,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel5.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->exp(-t^2),t->100,0.0)
πΆβ = AMFMtriplet(t->1,t->25+20*sin(t),0.0)
πΆβ = AMFMtriplet(t->sin(11t),t->250,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFMmodel6.png")

#---------------------------

using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->10t^2+2t+100,1.0)
πΆβ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
πΆβ = AMFMtriplet(t->10t,t->5cos(50t)+50,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(z; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel7.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->10t^2+2t+100,1.0)
πΆβ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
πΆβ = AMFMtriplet(t->10t,t->5cos(50t)+50,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π; timeaxis=-1.0:0.001:1.0)
png(path*"IS_exAMFMmodel8.png")

using ISA, Plots
πΆβ = AMFMtriplet(t->10,t->10t^2+2t+100,1.0)
πΆβ = AMFMtriplet(t->5exp(0.1t),t->250,0.0)
πΆβ = AMFMtriplet(t->10t,t->5cos(50t)+50,0.0)
π = compSet([πΆβ,πΆβ,πΆβ])
z = AMFMmodel(π)
plot(π, timeaxis=-1.0:0.001:1.0, view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
png(path*"IS_exAMFMmodel9.png")
