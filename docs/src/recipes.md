# Plotting Recipes

ISA.jl includes several plotting [Recipes](https://docs.juliaplots.org/latest/recipes/). Recipes are a way of defining visualizations in packages and code, without having to depend on [Plots](http://docs.juliaplots.org/latest/). The functionality relies on [RecipesBase](http://juliaplots.org/RecipesBase.jl/stable/), a super lightweight but powerful package which allows users to create advanced plotting logic without Plots.

Two basic visualization type are included in ISA.jl.
    1) An [Argand Diagram](https://mathworld.wolfram.com/ArgandDiagram.html) is a geometric representation of a complex number. We provided a way that allows users to visualize AM-FM components using the pre-defined plotting recipes to plot an Argand diagram as follows. First, define a canonical triplet, then call `plot()` from [`Plots.jl`](http://docs.juliaplots.org/latest/)  along with a time range.
    2) An [Instantaneous Spectrum](https://web.nmsu.edu/~spsandov/ISA/literature.html#openModal1) allows visualization of multiple aspects of the signal model simultaneously, including both magnitude and phase of each signal component. While it may take some time to become comfortable with the 3D visualization, we believe it has significant advantages in terms of interpretability over other time-frequency visualizations.


## Setup
After including the Plots.jl package (i.e. `using Plots`), data types defined in ISA.jl can be plotted by simply calling `plot(type)` and the corresponding plot recipe will generate the appropriate plot with the default parameters.

Users need to install the Plots.jl package into their system before calling it for the first time. Plots.jl can be installed by typing `]add Plots`.


## Parameter Options
Below illustrates the use a plotting recipe using default parameters.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t)+50,0.0)
ψ₀ = AMFMcomp(𝐶₀)
plot(ψ₀)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/default1.png)

Plot recipes include default plotting parameters that should be suitable for most cases. However, users can change these parameters as needed.

The following is a list of some of the default parameters used in ISA plot recipes.

| Parameter        | Default Value |
| ------           | ------        |
| xguide           | "time(s)"     |
| yguide           | "imag"        |
| zguide           | "real"        |
| ymirror          | true          |
| background_color | first element of colormap   |
| foreground_color | :white        |
| ymirror          | true          |
| legend           | false         |
| framestyle       | :origin       |

### Time-Axis
Below gives an example of setting a custom time-axis range.
```julia
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/costum0.png)

### Camera Position
Below gives an example of setting a custom camera position.
```julia
plot(ψ₀, camera=(20,50))
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/costum1.png)

### Labels
Below is an example of modifying the axis label and location.
```julia
plot(ψ₀, yguide="imaginary", ymirror=false)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/costum2.png)


## Predefined Views
By default, the `plot()` function will show a 3D plot. However, the parameter `view` can be used to 2D plot orthogonal projections of the 3D plot.

### Argand Diagram Views

| View         | Description          |
| ------       | ------               |
| default      | 3D Argand Diagram    |
| TR           | time-real plane      |
| TI           | time-imaginary plane |
| RI           | real-imaginary plane |

An example of displaying the default 3D view associated with an `AMFMcomp` is given below.
```julia
using ISA, Plots
ψ₀ = AMFMcomp(t->10t,t->25cos(t)+50,0.0)
plot(ψ₀)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/default3d.png)

An example of displaying the time-real plane associated with an `AMFMcomp` is given below.
```julia
plot(ψ₀,view="TR")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TRview3d.png)

An example of displaying the time-imaginary plane associated with an `AMFMcomp` is given below.
```julia
plot(ψ₀,view="TI")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TIview3d.png)

An example of displaying the real-imaginary plane associated with an `AMFMcomp` is given below.
```julia
plot(ψ₀, view="RI")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/RIview3d.png)


### Instantaneous Spectrum Views

| View         | Description               |
| ------       | ------                    |
| default      | 3D Instantaneous Spectrum |
| TF           | time-frequency plane      |
| TR           | time-real plane           |
| FR           | frequency-real plane      |

An example of displaying the default 3D view associated with an `compSet` is given below.
```julia
𝐶₀ = AMFMtriplet(t->0.2+0.8cos(11t), t->200.0, 0.0)
𝐶₁ = AMFMtriplet(t->exp(-abs(t/3)), t->100t, 0.1)
𝐶₂ = AMFMtriplet(t->𝒩ᵤ(t; μ=1.5, σ=1.0), t->150 + 125sin(5t), π)
𝐶₃ = AMFMtriplet(t->u(t-1.725)-u(t-2.475), t->50, 0.0)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂,𝐶₃])
plot(𝑆; timeaxis=0.0:0.001:3.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/defaultIS.png)

An example of displaying the time-frequency plane associated with an `compSet` is given below.
```julia
plot(𝑆,view="TF")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TFviewIS.png)

An example of displaying the time-real plane associated with an `compSet` is given below.
```julia
plot(𝑆,view="TR")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TRviewIS.png)

An example of displaying the frequency-real plane associated with an `compSet` is given below.
```julia
plot(𝑆,view="FR")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/FRviewIS.png)

#### Real Projection
Optionally, the real part of $z(t)$, the real superposition of the components
```math
x(t)=\mathrm{Re}\left\{\sum_k\psi_k(t)\right\}
```
can be orthogonally projected along the time-axis.

Below is an example of enabling the real projection
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2),t->100.0,0.0)
𝐶₁ = AMFMtriplet(t->0.8*cos(2t),t->25 + 10.5*sin(t),π)
𝑆 = compSet([𝐶₀,𝐶₁])
plot(𝑆,realProj=true)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/realProject.png)



## Colormaps
To avoid the perceptual problems associated with many colormaps ([Borland and Taylor, 2007](https://ieeexplore.ieee.org/document/4118486); [Liu and Heer, 2018](https://dl.acm.org/doi/10.1145/3173574.3174172)), we have utilized two perceptually motivated colormaps in our visualizations. Namely, [cubeyf](https://mycarta.wordpress.com/2013/02/21/perceptual-rainbow-palette-the-method/) and [viridis](https://www.youtube.com/watch?v=xAoljeRJ3lU) [default].

An example of using the default colormap (`viridis`).
```julia
using ISA, Plots
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₀)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/defaultColor.png)

An example of changing the colormap to `cubeYF`.
```julia
plot(ψ₀, colorMap="cubeYF")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/cubeYFcolor.png)

## Margins
Depending on the view, you may want to adjust margin sizes.
```julia
using ISA, Plots
𝐶₀ = AMFMtriplet(t->exp(-t^2/5),t->200.0,0.0)
𝐶₁ = AMFMtriplet(t->1.0,t->100*t,0.1)
𝐶₂ = AMFMtriplet(t->0.8*cos(11t),t->100 + 70.5*sin(5t),π)
𝑆 = compSet([𝐶₀,𝐶₁,𝐶₂])
plot(𝑆,timeaxis=0.0:0.001:3.0,view="TF",
     left_margin=15Plots.mm, margin=5Plots.mm)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/IS_ex2.png)
