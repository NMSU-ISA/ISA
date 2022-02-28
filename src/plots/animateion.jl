using ISA, Plots

include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

path = raw"C:\Users\hemad\Desktop\NMSU Cources\EE590\images"
default(margins=1Plots.mm,bottom_margin =5Plots.mm,left_margin=13Plots.mm,dpi=300,zlims=(-3,3))

using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^0.5/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])

plot(𝑆,camera=(20,80.0),colorMap="VIRIDIS")

# plot(𝑆,camera=(20,80)) # 2) 3d plane 1
# plot(𝑆,camera=(0,90)) # 1) time-freq plane 2
# plot(𝑆,camera=(0,0)) # 3) time-real plane 3

# plot(𝑆,camera=(0,80),yrotation=90,dpi=300)

plot(𝑆,camera=(20,80.0))
CNT = 0
for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

for i ∈ 0:20
    θ1 = 20.0 - i
    # θ2 = 80.0# + i*10.0/200
    rotate = i*90.0/20
    plot(𝑆,camera=(θ1,80.0),yrotation=rotate)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 21

for i in 0:20
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i ∈ 0:10
    θ2 = 80.0 + i
    plot(𝑆,camera=(0.0,θ2),yrotation=90.0)
    # (i<5) ? plot(𝑆,camera=(0.0,θ2),yrotation=90.0) : plot(𝑆,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],
     showaxis=:xy,z_foreground_color_text=viridis()[1])

for i in 0:25 #TF
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 26

# plot(𝑆,camera=(0.0,0.0),yrotation=90.0,ylabel="",yticks=[])
for i ∈ 0:90
    (i<45) ? plot(𝑆,camera=(0,90-i),
                  yrotation=90.0) : plot(𝑆,camera=(0,90-i),
                  yrotation=90.0,yguidefont = viridis()[1],
                  showaxis=:xz,y_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((CNT + i),5,"0")*".png")
end; CNT = CNT + 91


for i in 0:140 #TR
    if i in 0:20
        plot(𝑆,camera=(0,0),
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 21:40
        plot(𝑆,camera=(0,0),realProj=true,
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 41:60
        plot(𝑆,camera=(0,0),
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 61:80
        plot(𝑆,camera=(0,0),realProj=true,
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 81:100
        plot(𝑆,camera=(0,0),
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 101:120
        plot(𝑆,camera=(0,0),realProj=true,
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 121:140
        plot(𝑆,camera=(0,0),
        yrotation=90.0,yguidefont = viridis()[1],
        showaxis=:xz,y_foreground_color_text=viridis()[1])
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end
end;CNT = CNT + 141

for i ∈ 0:90
    marg = i*7/90
    default(margins=(marg)Plots.mm)
    (i<75) ? plot(𝑆,camera=(i,0.0)) : plot(𝑆,
                  camera=(i,0.0),xguidefont = viridis()[1],
                  showaxis=:yz,x_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((CNT + i),5,"0")*".png")
end; CNT = CNT + 91

for i in 0:25 #FR
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 26


for i ∈ 0:70
    marg = i*6/70
    default(margins=(7-marg)Plots.mm)
    plot(𝑆,camera=(90-i,i))
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;
CNT = CNT + 71

for i ∈ 0:10
    plot(𝑆,camera=(20,70+i))
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

# plot(𝑆,camera=(20.0,80))
# for i in 0:25
#     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
# end;CNT = CNT + 25

for i in 0:100
    if i in 0:20
        plot(𝑆,camera=(20.0,80))
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 21:40
        plot(𝑆,camera=(20.0,80),realProj=true)
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 41:60
        plot(𝑆,camera=(20.0,80))
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 61:80
        plot(𝑆,camera=(20.0,80),realProj=true)
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    elseif i in 81:100
        plot(𝑆,camera=(20.0,80))
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end
end;CNT = CNT + 101


#ffmpeg -r 30 -f image2 -s 1920x1080 -i plot%05d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

#issue: the following will plot the same plot
# plot(𝑆,camera=(20.0,80))
# plot(𝑆,camera=(20.5,80))

# and the following too:
# plot(𝑆,camera=(20.6,80))
# plot(𝑆,camera=(21.0,80))
