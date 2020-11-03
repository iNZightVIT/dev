
# iNZight Development Repository

This repository is where we can store all of our development scripts, files, bug lists, etc.

| package           | master                                                                                          | dev                                                                                                        | codecov                                                                                                                                                                        | cran                                                                                                                    |
|:------------------|:------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------|
| iNZight           | ![R-CMD-check](https://github.com/iNZightVIT/iNZight/workflows/R-CMD-check/badge.svg)           | ![R-CMD-check](https://github.com/iNZightVIT/iNZight/workflows/R-CMD-check/badge.svg?branch=dev)           | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZight/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZight?branch=master)                     | [![CRAN](https://www.r-pkg.org/badges/version/iNZight)](https://CRAN.R-project.org/package=iNZight)                     |
| iNZightPlots      | ![R-CMD-check](https://github.com/iNZightVIT/iNZightPlots/workflows/R-CMD-check/badge.svg)      | ![R-CMD-check](https://github.com/iNZightVIT/iNZightPlots/workflows/R-CMD-check/badge.svg?branch=dev)      | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightPlots/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightPlots?branch=master)           | [![CRAN](https://www.r-pkg.org/badges/version/iNZightPlots)](https://CRAN.R-project.org/package=iNZightPlots)           |
| iNZightMR         | ![R-CMD-check](https://github.com/iNZightVIT/iNZightMR/workflows/R-CMD-check/badge.svg)         | ![R-CMD-check](https://github.com/iNZightVIT/iNZightMR/workflows/R-CMD-check/badge.svg?branch=dev)         | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightMR/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightMR?branch=master)                 | [![CRAN](https://www.r-pkg.org/badges/version/iNZightMR)](https://CRAN.R-project.org/package=iNZightMR)                 |
| iNZightTools      | ![R-CMD-check](https://github.com/iNZightVIT/iNZightTools/workflows/R-CMD-check/badge.svg)      | ![R-CMD-check](https://github.com/iNZightVIT/iNZightTools/workflows/R-CMD-check/badge.svg?branch=dev)      | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightTools/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightTools?branch=master)           | [![CRAN](https://www.r-pkg.org/badges/version/iNZightTools)](https://CRAN.R-project.org/package=iNZightTools)           |
| iNZightTS         | ![R-CMD-check](https://github.com/iNZightVIT/iNZightTS/workflows/R-CMD-check/badge.svg)         | ![R-CMD-check](https://github.com/iNZightVIT/iNZightTS/workflows/R-CMD-check/badge.svg?branch=dev)         | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightTS/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightTS?branch=master)                 | [![CRAN](https://www.r-pkg.org/badges/version/iNZightTS)](https://CRAN.R-project.org/package=iNZightTS)                 |
| iNZightRegression | ![R-CMD-check](https://github.com/iNZightVIT/iNZightRegression/workflows/R-CMD-check/badge.svg) | ![R-CMD-check](https://github.com/iNZightVIT/iNZightRegression/workflows/R-CMD-check/badge.svg?branch=dev) | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightRegression/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightRegression?branch=master) | [![CRAN](https://www.r-pkg.org/badges/version/iNZightRegression)](https://CRAN.R-project.org/package=iNZightRegression) |
| iNZightModules    | ![R-CMD-check](https://github.com/iNZightVIT/iNZightModules/workflows/R-CMD-check/badge.svg)    | ![R-CMD-check](https://github.com/iNZightVIT/iNZightModules/workflows/R-CMD-check/badge.svg?branch=dev)    | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightModules/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightModules?branch=master)       | [![CRAN](https://www.r-pkg.org/badges/version/iNZightModules)](https://CRAN.R-project.org/package=iNZightModules)       |
| iNZightMaps       | ![R-CMD-check](https://github.com/iNZightVIT/iNZightMaps/workflows/R-CMD-check/badge.svg)       | ![R-CMD-check](https://github.com/iNZightVIT/iNZightMaps/workflows/R-CMD-check/badge.svg?branch=dev)       | [![Codecov test coverage](https://codecov.io/gh/iNZightVIT/iNZightMaps/branch/master/graph/badge.svg)](https://codecov.io/gh/iNZightVIT/iNZightMaps?branch=master)             | [![CRAN](https://www.r-pkg.org/badges/version/iNZightMaps)](https://CRAN.R-project.org/package=iNZightMaps)             |

------------------------------------------------------------------------

## To start developing iNZightVIT (assumes Linux):

1.  Create a new directory: `~/iNZight` (This must be in your home directory)

``` bash
mkdir ~/iNZight
cd ~/iNZight
```

1.  Inside `iNZight`, clone the `dev` repository (assumes git is set up):

``` bash
git clone git@github.com:iNZightVIT/dev
cd dev
```

1.  From inside the `dev` directory, build the full iNZight development directories:

``` bash
make build
cd ..
```

1.  Now, inside `~/iNZight/`, you will have all of the required directories for developing iNZight.

------------------------------------------------------------------------

## Dependency Structure

This graph shows the interaction between various iNZight R packages.

![](README_files/figure-markdown_github/unnamed-chunk-5-1.png)

------------------------------------------------------------------------

If you have any issues with these instructions, please email `tom.elliott@auckland.ac.nz`.
