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
𝐶₀ = AMFMtriplet(t->10t,t->25cos(t),0.0)
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
| background_color | cubeYF()[1]   |
| foreground_color | :white        |
| ymirror          | true          |
| legend           | false         |
| framestyle       | :origin       |

### Time-Axis
Below gives an example of setting a custom time-axis range.
```julia
# change the time axis
plot(ψ₀; timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/costum0.png)
[NEED TO FIX IMAGE ABOVE]

### Camera Position
Below gives an example of setting a custom camera position.
```julia
# change the time axis and camera angle
plot(ψ₀; timeaxis=0.0:0.001:10.0, camera=(20,50))
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/costum1.png)

### Labels
Below is an example of modifying the axis label and location.
```julia
plot(ψ₀; timeaxis=0.0:0.001:10.0, yguide="imaginary", ymirror=true)
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
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₂, timeaxis=0.0:0.001:10.0)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TRview.png)
An example of displaying the time-real plane associated with an `AMFMcomp` is given below.
```julia
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₂, timeaxis=0.0:0.001:10.0,view="TR")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TRview.png)

An example of displaying the time-imaginary plane associated with an `AMFMcomp` is given below.
```julia
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₂, timeaxis=0.0:0.001:10.0,view="TI")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TIview.png)

An example of displaying the real-imaginary plane associated with an `AMFMcomp` is given below.
```julia
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₂, timeaxis=0.0:0.001:10.0,view="RI")
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/TIview.png)


### Instantaneous Spectrum Views

| View         | Description               |
| ------       | ------                    |
| default      | 3D Instantaneous Spectrum |
| TF           | time-frequency plane      |
| TR           | time-real plane           |
| FR           | frequency-real plane      |

An example of displaying the default 3D view associated with an `compSet` is given below.
```julia
code
```

An example of displaying the time-frequency plane associated with an `compSet` is given below.
```julia
code
```

An example of displaying the time-real plane associated with an `compSet` is given below.
```julia
code
```

An example of displaying the frequency-real plane associated with an `compSet` is given below.
```julia
code
```


## Colormaps
To avoid the perceptual problems associated with many colormaps ([Borland and Taylor, 2007](https://ieeexplore.ieee.org/document/4118486); [Liu and Heer, 2018](https://dl.acm.org/doi/10.1145/3173574.3174172)), we have utilized two perceptually motivated colormaps in our visualizations. Namely, [cubeyf](https://mycarta.wordpress.com/2013/02/21/perceptual-rainbow-palette-the-method/) [default] and [viridis](https://www.youtube.com/watch?v=xAoljeRJ3lU).

An example of changing the default colormap is given below.
```julia
ψ₀ = AMFMcomp(t->t,t->25cos(t),0.0)
plot(ψ₂, ??????????)
```
![](https://raw.githubusercontent.com/NMSU-ISA/ISA/master/docs/src/assets/????w.png)
[NEED TO FIX IMAGE ABOVE]
