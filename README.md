# DynACof.jl inputs

Templates for DynACof.jl input files.

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

 ## Examples

### From Julia

 Here is an example call to `DynACof.jl` using custom parameter files from the Julia REPL:

 ```julia
 # Install the package if not already present in your library:
 # Pkg.add("DynACof")

 # Load the package
 using DynACof

 # Execute the model using your custom parameter files, located for the example in the folder "DynACof.jl_inputs":
 Sim, Meteo, Parameters= dynacof()
 dynacof(input_path = "DynACof.jl_inputs", file_name= (constants= "constants.jl",site="site.jl",meteo="meteorology.txt",soil="soil.jl", coffee="coffee.jl",tree="tree.jl"))
 ```

### From R
The Julia version of DynACof (`DynACof.jl`) can be used from `R` using the R-version of DynACof. Here is an example usage from the R console.

All steps are made using R for simplicity in this example.

1. The first step is to download (or clone) this repository to get the data. For this example, we will download the repository into a temporary directory created from R.

    * If you have `GIT` installed on your computer:
```r
# install.packages("git2r")
dynacof_data= normalizePath(tempdir(), winslash = "/", mustWork = FALSE)
git2r::clone("https://github.com/VEZY/DynACof.jl_inputs.git",dynacof_data)
```

    * or else, downloading the `ZIP` archive:
```r
dynacof_data= normalizePath(tempdir(), winslash = "/", mustWork = FALSE)
data_dir_zip= normalizePath(file.path(dynacof_data,"master.zip"), winslash = "/", mustWork = FALSE)
download.file("https://github.com/VEZY/DynACof.jl_inputs/archive/master.zip", data_dir_zip)
unzip(data_dir_zip, exdir = dynacof_data)
unlink(data_dir_zip)
dynacof_data= normalizePath(list.dirs(dynacof_data)[2])
```

1. Then you have to download the DynACof package. To do so, you have to install the `remotes` package (or `devtools`):

    * For `remotes`:
    ``` r
    install.packages("remotes")
    remotes::install_github("VEZY/DynACof")
    ```

    * For `devtools`:
    ``` r
    install.packages("remotes")
    remotes::install_github("VEZY/DynACof")
    ```

    The `remotes` package is lighter than `devtools`. But if you already are an R developer you should have `devtools` installed on your system.

1. Then, load the `DynACof` package and instantiate Julia:
``` r
library(DynACof)
DynACof::dynacof.jl_setup()
```

1. And finally, execute the model using your custom parameter files:
``` r
sim= dynacof.jl(Period = as.POSIXct(c("1979-01-01", "1980-12-31")),
                   Inpath = dynacof_data, Simulation_Name = "Test1",
                   FileName = list(Site = "site.jl", Meteo ="meteorology.txt",
                                   Soil = "soil.jl",Coffee = "coffee.jl", Tree = NULL))
```

And `DynACof.jl` should run the simulation from R.
