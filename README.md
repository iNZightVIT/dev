# iNZight Development Repository

This repository is where we can store all of our development scripts, files, bug lists, etc.

||iNZight|iNZightPlots|iNZightModules|iNZightTS|iNZightMR|iNZightRegression|iNZightMaps|iNZightTools|vit|
|--:|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|master||[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightPlots.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightPlots)||[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightTS.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightTS)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightMR.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightMR)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightRegression.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightRegression)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightMaps.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightMaps)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightTools.svg?branch=master)](https://travis-ci.org/iNZightVIT/iNZightTools)||
|dev||[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightPlots.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightPlots)||[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightTS.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightTS)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightMR.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightMR)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightRegression.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightRegression)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightMaps.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightMaps)|[![Travis-CI Build Status](https://travis-ci.org/iNZightVIT/iNZightTools.svg?branch=dev)](https://travis-ci.org/iNZightVIT/iNZightTools)||

***
## To start developing iNZightVIT (assumes Linux):

1) Create a new directory: `~/iNZight`
   (This must be in your home directory)
```
mkdir ~/iNZight
cd ~/iNZight
```

2) Inside `iNZight`, clone the `dev` repository (assumes git is set up):
```
git clone git@github.com:iNZightVIT/dev
cd dev
```

3) From inside the `dev` directory, build the full iNZight development directories:
```
make build
cd ..
```

4) Now, inside `~/iNZight/`, you will have all of the required directories for
   developing iNZight.

***
## Dependency Structure

This graph shows the interaction between various iNZight R packages.
![Diagram](https://raw.githubusercontent.com/iNZightVIT/dev/master/iNZight_dependencies.png)

* __Imports__ = solid line
* __Suggests__ = dashed line
* __Enhances__ = dotted line
* Lines in BLACK are OK as is
* Lines in RED are dependencies that are marked for removal
* Lines in GREEN are dependencies that are marked for addition
* Lines in ORANGE are dependencies that are marked for adjustment


***


If you have any issues with these instructions, please email `tom.elliott@auckland.ac.nz`.
