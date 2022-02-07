using ISA, Plots

path = raw"C:\Users\hemad\Desktop\NMSU Cources\Fall2020\EE590\images"
default(margins=1Plots.mm,bottom_margin =5Plots.mm,left_margin=13Plots.mm,dpi=300)

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^0.5/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])

plot(𝑆,camera=(20,80.0),colorMap="VIRIDIS")

# plot(𝑆,realProj=true,camera=(20,80)) # 2) 3d plane 1
# plot(𝑆,realProj=true,camera=(0,90)) # 1) time-freq plane 2
# plot(𝑆,realProj=true,camera=(0,0)) # 3) time-real plane 3

# plot(𝑆,realProj=true,camera=(0,80),yrotation=90,dpi=300)

plot(𝑆,realProj=true,camera=(20,80.0))
CNT = 0
for i in 0:15
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 16

for i ∈ 0:20
    θ1 = 20.0 - i
    # θ2 = 80.0# + i*10.0/200
    rotate = i*90.0/20
    plot(𝑆,realProj=true,camera=(θ1,80.0),yrotation=rotate)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 21

for i in 0:10
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i ∈ 0:10
    θ2 = 80.0 + i
    plot(𝑆,realProj=true,camera=(0.0,θ2),yrotation=90.0)
    # (i<5) ? plot(𝑆,realProj=true,camera=(0.0,θ2),yrotation=90.0) : plot(𝑆,realProj=true,camera=(0.0,90),yrotation=90.0,zguidefont = cubeYF()[1],showaxis=:xy,z_foreground_color_text=cubeYF()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆,realProj=true,camera=(0.0,90),yrotation=90.0,zguidefont = cubeYF()[1],
     showaxis=:xy,z_foreground_color_text=cubeYF()[1])
# plot!(zlabel="",zticks=[])
for i in 0:15
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 16

# plot(𝑆,realProj=true,camera=(0.0,0.0),yrotation=90.0,ylabel="",yticks=[])
for i ∈ 0:90
    (i<45) ? plot(𝑆,realProj=true,camera=(0,90-i),yrotation=90.0) : plot(𝑆,realProj=true,camera=(0,90-i),yrotation=90.0,yguidefont = cubeYF()[1],
                                                           showaxis=:xz,y_foreground_color_text=cubeYF()[1])
    savefig(path*raw"\plot"*lpad((CNT + i),5,"0")*".png")
end; CNT = CNT + 91

for i in 0:15
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 16


for i ∈ 0:90
    marg = i*7/90
    default(margins=(marg)Plots.mm)
    (i<75) ? plot(𝑆,realProj=true,camera=(i,0.0)) : plot(𝑆,realProj=true,camera=(i,0.0),xguidefont = cubeYF()[1],
                                           showaxis=:yz,x_foreground_color_text=cubeYF()[1])
    savefig(path*raw"\plot"*lpad((CNT + i),5,"0")*".png")
end; CNT = CNT + 91

for i in 0:15
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 16


for i ∈ 0:70
    marg = i*6/70
    default(margins=(7-marg)Plots.mm)
    plot(𝑆,realProj=true,camera=(90-i,i))
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;
CNT = CNT + 71

for i ∈ 0:10
    plot(𝑆,realProj=true,camera=(20,70+i))
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i in 0:15
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 15

#ffmpeg -r 60 -f image2 -s 1920x1080 -i plot%04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
