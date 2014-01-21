dev
===

This repository is where we can store all of our development scripts, files, bug lists, etc. 

To Make:
--------

```
git clone git@github.com:iNZightVIT/dev
cd dev
make
```

This assumes you have imported ALL of the required repositories. If you don't, then
```
git clone git@github.com:iNZightVIT/name-of-package
```
to get the package.

The suggest structure is to have a single `iNZight` folder, in which you have all of the packages. That is, you should have the following directories in `iNZight`:
```
iNZight, iNZightPlots, iNZightRegression, iNZightModules, iNZightTS, iNZightMR, VIT
```

If you need to make a complete build, you will also need the `gWidgets2` packages from github:
```
git clone git@github.com:jverzani/gWidgets2
git clone git@github.com:jverzani/gWidgets2RGtk2
cd dev
make gWidgets2
```

If you have all of these packages, you can build on your system for testing using:
```
cd dev
make here
```

----------------------------

If you have any issues with these instructions, please email `tell029@auckland.ac.nz`.
