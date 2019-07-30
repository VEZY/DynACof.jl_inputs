# DynACof.jl inputs

Templates for DynACof.jl input files

---

 ## Introduction

 This repository contains the templates for the input parameter files needed for a [DynACof.jl](https://vezy.github.io/DynACof.jl/) simulation, and was made to simplify the user experience. Those inputs come from Vezy et al. 2019.

 Please make sure to use these files for the Julia version of DynACof, and not [the ones](https://github.com/VEZY/DynACof_inputs) for the [R version](https://vezy.github.io/DynACof/)

---
 ## Download

 ### Non-coders
 If you don't have a GIT client installed, or if you don't even know what GIT is, you can download all the template files at once using this [link](https://github.com/VEZY/DynACof.jl_inputs/archive/master.zip).

 ### Experienced users
 To clone the repository, use this command:
 ```
 git clone https://github.com/VEZY/DynACof.jl_inputs.git
 ```

 ## Details

 The values of the parameters in these files can be customized to fit new conditions. To do so, you'll have to download this repository, to open the files and identify the parameters you need to adapt, and to use these new input files for your simulation.

 ## Example

 Here is an example call to DynACof using custom parameter files:
 ```julia
 # Install the package if not already present in your library:
 # Pkg.add("DynACof")

 # Load the package
 using DynACof

 # Execute the model using your custom parameter files, located for the example in the folder "DynACof.jl_inputs":
 Sim, Meteo, Parameters= dynacof()
 dynacof(input_path = "DynACof.jl_inputs", file_name= (constants= "constants.jl",site="site.jl",meteo="meteorology.txt",soil="soil.jl", coffee="coffee.jl",tree="tree.jl"))
 ```
