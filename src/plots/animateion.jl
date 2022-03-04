using ISA, Plots

include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

path = raw"C:\Users\hemad\Desktop\NMSU Cources\EE590\images"

fs = 5000#16_000
t = 0.0:1/fs:3.0
𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
𝐶₂ = AMFMtriplet(t->𝒩ᵤ(t; μ=1.5, σ=1.0), t->150 + 125sin(5t), π)
𝐶₃ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
𝑆1 = compSet([𝐶₀,𝐶₁])
𝑆2 = compSet([𝐶₀,𝐶₁,𝐶₂,𝐶₃])

default(margins=1Plots.mm,bottom_margin =5Plots.mm,
        left_margin=13Plots.mm,dpi=300,zlims=(-2,2))

# 1_ 3D 𝑆1
# 2_ TF
# 3_ 3D
# 4_ TR
# 5_ 3D
# 6_ TURN ON PROJECTION
# 7_ 𝑆2
# 8_ TR
# 9_ 3D
# 10_ TF
# 11_ 3D


# 1_ 3D 𝑆1
plot(𝑆1,camera=(20,80.0),timeaxis=t)
CNT = 0
for i in 0:25
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 26

# 2_ TF

# if 1==0
#     for i ∈ 0:20
#         θ1 = 20.0 - i
#         rotate = i*90.0/20
#         plot(𝑆1,camera=(θ1,80.0),yrotation=rotate,timeaxis=t)
#         savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
#     end;CNT = CNT + 21
#
#     for i in 0:20
#         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#     end;CNT = CNT + 21
#
#     for i ∈ 0:10
#         θ2 = 80.0 + i
#         plot(𝑆1,camera=(0.0,θ2),yrotation=90.0,timeaxis=t)
#         # (i<5) ? plot(𝑆,camera=(0.0,θ2),yrotation=90.0) : plot(𝑆,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
#         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#     end;CNT = CNT + 11
# end
for i ∈ 0:10
    θ1 = 20.0 - i
    θ2 = 80.0 + i
    rotate = i*45.0/10
    plot(𝑆1,camera=(θ1,θ2),yrotation=rotate,timeaxis=t)
    # (i<5) ? plot(𝑆,camera=(0.0,θ2),yrotation=90.0) : plot(𝑆,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i ∈ 0:10
    θ1 = 10.0 - i
    rotate = 45 + i*45.0/10
    plot(𝑆1,camera=(θ1,90.0),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆1,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],
     showaxis=:xy,z_foreground_color_text=viridis()[1],
     timeaxis=t)

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 3_ 3D
for i ∈ 0:10
    θ1 = i
    θ2 = 90.0 - i
    rotate = 90 - i*45.0/10
    plot(𝑆1,camera=(θ1,θ2),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i ∈ 0:10
    θ1 = 10.0 + i
    rotate = 45 - i*45.0/10
    plot(𝑆1,camera=(θ1,80.0),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆1,camera=(20,80.0),timeaxis=t)
for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 4_ TR
for i in 0:20
    θ1 = 20.0 - i
    θ2 = 80.0 - i
    plot(𝑆1,camera=(θ1,θ2),timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    θ2 = 60.0 - i
    (i<45) ? plot(𝑆1,camera=(0.0,θ2),timeaxis=t) : plot(
    𝑆1,camera=(0.0,θ2),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36

# 5_ 3D
for i in 0:20
    plot(𝑆1,camera=(i,i),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    plot(𝑆1,camera=(20.0,20+i),timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 1:3
    plot(𝑆1,camera=(20,80.0),timeaxis=t)
    for i in 0:25
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 26

    # 6_ TURN ON PROJECTION
    plot(𝑆1,camera=(20,80.0),timeaxis=t,realProj=true)
    for i in 0:25
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 26

    # 7_ 𝑆2
    plot(𝑆2,camera=(20,80.0),timeaxis=t,realProj=true)
    for i in 0:35
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 36
end


# 8_ TR
for i in 0:20
    θ1 = 20.0 - i
    θ2 = 80.0 - i
    plot(𝑆2,camera=(θ1,θ2),timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    θ2 = 60.0 - i
    (i<45) ? plot(𝑆2,camera=(0.0,θ2),timeaxis=t, realProj=true) : plot(
    𝑆2,camera=(0.0,θ2),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1], realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36


# 9_ 3D
for i in 0:20
    plot(𝑆2,camera=(i,i),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1],
    realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    plot(𝑆2,camera=(20.0,20+i),timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36




#-------------------------------------
# 10_ TF
for i ∈ 0:20
    θ1 = 20.0 - i
    rotate = i*90.0/20
    plot(𝑆2,camera=(θ1,80.0),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 21

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

for i ∈ 0:10
    θ2 = 80.0 + i
    plot(𝑆2,camera=(0.0,θ2),yrotation=90.0,timeaxis=t,realProj=true)
    # (i<5) ? plot(𝑆,camera=(0.0,θ2),yrotation=90.0) : plot(𝑆,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆2,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],
     showaxis=:xy,z_foreground_color_text=viridis()[1],
     timeaxis=t,realProj=true)

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 11_ 3D
for i ∈ 0:10
    θ1 = i
    θ2 = 90.0 - i
    rotate = 90 - i*45.0/10
    plot(𝑆2,camera=(θ1,θ2),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i ∈ 0:10
    θ1 = 10.0 + i
    rotate = 45 - i*45.0/10
    plot(𝑆2,camera=(θ1,80.0),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(𝑆2,camera=(20,80.0),timeaxis=t,realProj=true)
for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# if 1==0
#     for i in 0:140 #TR
#         if i in 0:20
#             plot(𝑆,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 21:40
#             plot(𝑆,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 41:60
#             plot(𝑆,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 61:80
#             plot(𝑆,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 81:100
#             plot(𝑆,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 101:120
#             plot(𝑆,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 121:140
#             plot(𝑆,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         end
#     end;CNT = CNT + 141
#
#     for i ∈ 0:90
#         marg = i*7/90
#         default(margins=(marg)Plots.mm)
#         (i<75) ? plot(𝑆,camera=(i,0.0)) : plot(𝑆,
#                     camera=(i,0.0),xguidefont = viridis()[1],
#                     showaxis=:yz,x_foreground_color_text=viridis()[1])
#                     savefig(path*raw"\plot"*lpad((CNT + i),5,"0")*".png")
#                 end; CNT = CNT + 91
#
#                 for i in 0:25 #FR
#                     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 end;CNT = CNT + 26
#
#
#                 for i ∈ 0:70
#                     marg = i*6/70
#                     default(margins=(7-marg)Plots.mm)
#                     plot(𝑆,camera=(90-i,i))
#                     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 end;
#                 CNT = CNT + 71
#
#                 for i ∈ 0:10
#                     plot(𝑆,camera=(20,70+i))
#                     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 end;CNT = CNT + 11
#
#                 # plot(𝑆,camera=(20.0,80))
#                 # for i in 0:25
#                 #     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 # end;CNT = CNT + 25
#
#                 for i in 0:100
#                     if i in 0:20
#                         plot(𝑆,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 21:40
#                         plot(𝑆,camera=(20.0,80),realProj=true)
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 41:60
#                         plot(𝑆,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 61:80
#                         plot(𝑆,camera=(20.0,80),realProj=true)
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 81:100
#                         plot(𝑆,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     end
#                 end;CNT = CNT + 101
#
# end

#ffmpeg -r 30 -f image2 -s 1920x1080 -i plot%05d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

#issue: the following will plot the same plot
# plot(𝑆,camera=(20.0,80))
# plot(𝑆,camera=(20.5,80))

# and the following too:
# plot(𝑆,camera=(20.6,80))
# plot(𝑆,camera=(21.0,80))
