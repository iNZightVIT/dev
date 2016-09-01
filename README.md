#dev

This repository is where we can store all of our development scripts, files, bug lists, etc. 

----------------------------
###To start developing iNZightVIT (assumes Linux):

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

----------------------------

If you have any issues with these instructions, please email `tom.elliott@auckland.ac.nz`.
