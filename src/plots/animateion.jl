using ISA, Plots

include(raw"colorMaps/cubeYF.jl")
include(raw"colorMaps/viridis.jl")

path = raw"C:\Users\hemad\Desktop\NMSU Cources\EE590\images"

fs = 5000#16_000
t = 0.0:1/fs:3.0
πΆβ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
πΆβ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
πΆβ = AMFMtriplet(t->π©α΅€(t; ΞΌ=1.5, Ο=1.0), t->150 + 125sin(5t), Ο)
πΆβ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
π1 = compSet([πΆβ,πΆβ])
π2 = compSet([πΆβ,πΆβ,πΆβ,πΆβ])

default(margins=1Plots.mm,bottom_margin =5Plots.mm,
        left_margin=13Plots.mm,dpi=300,zlims=(-2,2))

# 1_ 3D π1
# 2_ TF
# 3_ 3D
# 4_ TR
# 5_ 3D
# 6_ TURN ON PROJECTION
# 7_ π2
# 8_ TR
# 9_ 3D
# 10_ TF
# 11_ 3D


# 1_ 3D π1
plot(π1,camera=(20,80.0),timeaxis=t)
CNT = 0
for i in 0:25
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 26

# 2_ TF

# if 1==0
#     for i β 0:20
#         ΞΈ1 = 20.0 - i
#         rotate = i*90.0/20
#         plot(π1,camera=(ΞΈ1,80.0),yrotation=rotate,timeaxis=t)
#         savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
#     end;CNT = CNT + 21
#
#     for i in 0:20
#         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#     end;CNT = CNT + 21
#
#     for i β 0:10
#         ΞΈ2 = 80.0 + i
#         plot(π1,camera=(0.0,ΞΈ2),yrotation=90.0,timeaxis=t)
#         # (i<5) ? plot(π,camera=(0.0,ΞΈ2),yrotation=90.0) : plot(π,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
#         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#     end;CNT = CNT + 11
# end
for i β 0:10
    ΞΈ1 = 20.0 - i
    ΞΈ2 = 80.0 + i
    rotate = i*45.0/10
    plot(π1,camera=(ΞΈ1,ΞΈ2),yrotation=rotate,timeaxis=t)
    # (i<5) ? plot(π,camera=(0.0,ΞΈ2),yrotation=90.0) : plot(π,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i β 0:10
    ΞΈ1 = 10.0 - i
    rotate = 45 + i*45.0/10
    plot(π1,camera=(ΞΈ1,90.0),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(π1,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],
     showaxis=:xy,z_foreground_color_text=viridis()[1],
     timeaxis=t)

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 3_ 3D
for i β 0:10
    ΞΈ1 = i
    ΞΈ2 = 90.0 - i
    rotate = 90 - i*45.0/10
    plot(π1,camera=(ΞΈ1,ΞΈ2),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i β 0:10
    ΞΈ1 = 10.0 + i
    rotate = 45 - i*45.0/10
    plot(π1,camera=(ΞΈ1,80.0),yrotation=rotate,timeaxis=t)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(π1,camera=(20,80.0),timeaxis=t)
for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 4_ TR
for i in 0:20
    ΞΈ1 = 20.0 - i
    ΞΈ2 = 80.0 - i
    plot(π1,camera=(ΞΈ1,ΞΈ2),timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    ΞΈ2 = 60.0 - i
    (i<45) ? plot(π1,camera=(0.0,ΞΈ2),timeaxis=t) : plot(
    π1,camera=(0.0,ΞΈ2),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36

# 5_ 3D
for i in 0:20
    plot(π1,camera=(i,i),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    plot(π1,camera=(20.0,20+i),timeaxis=t)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 1:3
    plot(π1,camera=(20,80.0),timeaxis=t)
    for i in 0:25
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 26

    # 6_ TURN ON PROJECTION
    plot(π1,camera=(20,80.0),timeaxis=t,realProj=true)
    for i in 0:25
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 26

    # 7_ π2
    plot(π2,camera=(20,80.0),timeaxis=t,realProj=true)
    for i in 0:35
        savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
    end; CNT = CNT + 36
end


# 8_ TR
for i in 0:20
    ΞΈ1 = 20.0 - i
    ΞΈ2 = 80.0 - i
    plot(π2,camera=(ΞΈ1,ΞΈ2),timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    ΞΈ2 = 60.0 - i
    (i<45) ? plot(π2,camera=(0.0,ΞΈ2),timeaxis=t, realProj=true) : plot(
    π2,camera=(0.0,ΞΈ2),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1], realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36


# 9_ 3D
for i in 0:20
    plot(π2,camera=(i,i),timeaxis=t,yguidefont = viridis()[1],
    showaxis=:xz,y_foreground_color_text=viridis()[1],
    realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 21

for i in 0:60
    plot(π2,camera=(20.0,20+i),timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 61

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end; CNT = CNT + 36




#-------------------------------------
# 10_ TF
for i β 0:20
    ΞΈ1 = 20.0 - i
    rotate = i*90.0/20
    plot(π2,camera=(ΞΈ1,80.0),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 21

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

for i β 0:10
    ΞΈ2 = 80.0 + i
    plot(π2,camera=(0.0,ΞΈ2),yrotation=90.0,timeaxis=t,realProj=true)
    # (i<5) ? plot(π,camera=(0.0,ΞΈ2),yrotation=90.0) : plot(π,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],showaxis=:xy,z_foreground_color_text=viridis()[1])
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

plot(π2,camera=(0.0,90),yrotation=90.0,zguidefont = viridis()[1],
     showaxis=:xy,z_foreground_color_text=viridis()[1],
     timeaxis=t,realProj=true)

for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# 11_ 3D
for i β 0:10
    ΞΈ1 = i
    ΞΈ2 = 90.0 - i
    rotate = 90 - i*45.0/10
    plot(π2,camera=(ΞΈ1,ΞΈ2),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 11

for i β 0:10
    ΞΈ1 = 10.0 + i
    rotate = 45 - i*45.0/10
    plot(π2,camera=(ΞΈ1,80.0),yrotation=rotate,timeaxis=t,realProj=true)
    savefig(path*raw"\plot"*lpad(i+CNT,5,"0")*".png")
end;CNT = CNT + 11

plot(π2,camera=(20,80.0),timeaxis=t,realProj=true)
for i in 0:35
    savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
end;CNT = CNT + 36

# if 1==0
#     for i in 0:140 #TR
#         if i in 0:20
#             plot(π,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 21:40
#             plot(π,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 41:60
#             plot(π,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 61:80
#             plot(π,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 81:100
#             plot(π,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 101:120
#             plot(π,camera=(0,0),realProj=true,
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         elseif i in 121:140
#             plot(π,camera=(0,0),
#             yrotation=90.0,yguidefont = viridis()[1],
#             showaxis=:xz,y_foreground_color_text=viridis()[1])
#             savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#         end
#     end;CNT = CNT + 141
#
#     for i β 0:90
#         marg = i*7/90
#         default(margins=(marg)Plots.mm)
#         (i<75) ? plot(π,camera=(i,0.0)) : plot(π,
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
#                 for i β 0:70
#                     marg = i*6/70
#                     default(margins=(7-marg)Plots.mm)
#                     plot(π,camera=(90-i,i))
#                     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 end;
#                 CNT = CNT + 71
#
#                 for i β 0:10
#                     plot(π,camera=(20,70+i))
#                     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 end;CNT = CNT + 11
#
#                 # plot(π,camera=(20.0,80))
#                 # for i in 0:25
#                 #     savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                 # end;CNT = CNT + 25
#
#                 for i in 0:100
#                     if i in 0:20
#                         plot(π,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 21:40
#                         plot(π,camera=(20.0,80),realProj=true)
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 41:60
#                         plot(π,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 61:80
#                         plot(π,camera=(20.0,80),realProj=true)
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     elseif i in 81:100
#                         plot(π,camera=(20.0,80))
#                         savefig(path*raw"\plot"*lpad((i + CNT),5,"0")*".png")
#                     end
#                 end;CNT = CNT + 101
#
# end

#ffmpeg -r 30 -f image2 -s 1920x1080 -i plot%05d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

#issue: the following will plot the same plot
# plot(π,camera=(20.0,80))
# plot(π,camera=(20.5,80))

# and the following too:
# plot(π,camera=(20.6,80))
# plot(π,camera=(21.0,80))
