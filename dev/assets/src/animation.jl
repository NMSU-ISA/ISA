path = "docs/src/assets/"

using ISA, Plots
t = 0.0:6.25e-5:3.0
𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
𝐶₂ = AMFMtriplet(t->𝒩ᵤ(t; μ=1.5, σ=1.0), t->150 + 125sin(5t), π)
𝐶₃ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂,𝐶₃])

# --------------

function getFrames(cameraStart,cameraEnd,nSteps)
    a = cameraStart[1]:(cameraEnd[1].-cameraStart[1])./(nSteps-1):cameraEnd[1]
    b = cameraStart[2]:(cameraEnd[2].-cameraStart[2])./(nSteps-1):cameraEnd[2]
    viewAngles = [(a[i],b[i]) for i∈1:nSteps]
    return [plot(𝑆, timeaxis=t, camera=cam) for cam∈viewAngles]
end

function holdFrame(camera,nTimes)
    return [plot(𝑆, timeaxis=t, camera=camera) for i∈1:nTimes]
end

view3D = (20,80)
viewTF = (0,90)
viewRT = (0,0)
viewRF = (90,0)

# --------------

nTimes = 30
camera = view3D
frames = holdFrame(camera,nTimes)

nSteps = 20
cameraStart = view3D
cameraEnd = viewTF
frames = cat(frames,getFrames(cameraStart,cameraEnd,nSteps),dims=1)

nTimes = 30
camera = viewTF
frames = cat(frames,holdFrame(camera,nTimes),dims=1)

nSteps = 20
cameraStart = viewTF
cameraEnd = view3D
frames = cat(frames,getFrames(cameraStart,cameraEnd,nSteps),dims=1)

nTimes = 30
camera = view3D
frames = cat(frames,holdFrame(camera,nTimes),dims=1)

nSteps = 80
cameraStart = view3D
cameraEnd = viewRT
frames = cat(frames,getFrames(cameraStart,cameraEnd,nSteps),dims=1)

nTimes = 30
camera = viewRT
frames = cat(frames,holdFrame(camera,nTimes),dims=1)

# --------------

anim = Animation()
for i∈1:length(frames)
    plot(frames[i])
    frame(anim) #frame pngs are saved in temp directory anim.dir
end
mp4(anim, path*"movieTest.mp4", fps=30)
