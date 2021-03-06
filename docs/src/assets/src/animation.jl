path = "docs/src/assets/"

using ISA, Plots
t = 0.0:6.25e-5:3.0
๐ถโ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
๐ถโ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
๐ถโ = AMFMtriplet(t->๐ฉแตค(t; ฮผ=1.5, ฯ=1.0), t->150 + 125sin(5t), ฯ)
๐ถโ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
๐ = compSet([๐ถโ,๐ถโ,๐ถโ,๐ถโ])

# --------------

function getFrames(cameraStart,cameraEnd,nSteps)
    a = cameraStart[1]:(cameraEnd[1].-cameraStart[1])./(nSteps-1):cameraEnd[1]
    b = cameraStart[2]:(cameraEnd[2].-cameraStart[2])./(nSteps-1):cameraEnd[2]
    viewAngles = [(a[i],b[i]) for iโ1:nSteps]
    return [plot(๐, timeaxis=t, camera=cam) for camโviewAngles]
end

function holdFrame(camera,nTimes)
    return [plot(๐, timeaxis=t, camera=camera) for iโ1:nTimes]
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
for iโ1:length(frames)
    plot(frames[i])
    frame(anim) #frame pngs are saved in temp directory anim.dir
end
mp4(anim, path*"movieTest.mp4", fps=30)
