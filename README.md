# iNZight Development Repository

This repository is where we can store all of our development scripts, files, bug lists, etc. 

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
![Diagram](https://raw.githubusercontent.com/iNZightVIT/dev/master/iNZight_dependencies.svg)
* __Imports__ = solid line
* __Suggests__ = dashed line
* __Enhances__ = dotted line
* Lines in BLACK are OK as is
* Lines in RED are dependencies that are marked for removal
* Lines in GREEN are dependencies that are marked for addition
* Lines in ORANGE are dependencies that are marked for adjustment


***


If you have any issues with these instructions, please email `tom.elliott@auckland.ac.nz`.
