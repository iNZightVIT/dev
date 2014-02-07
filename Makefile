# This file allows quick building/updating of packages in the iNZight directory.

# If you haven't got any of the packages (i.e., only this one) then 
# first place this dev/ directory in a folder (perhaps iNZight/?) and:
# make build

build:
	cd ../; git clone git@github.com:iNZightVIT/VIT
	cd ../; git clone git@github.com:iNZightVIT/iNZight
	cd ../; git clone git@github.com:iNZightVIT/iNZightPlots
	cd ../; git clone git@github.com:iNZightVIT/iNZightModules
	cd ../; git clone git@github.com:iNZightVIT/iNZightRegression
	cd ../; git clone git@github.com:iNZightVIT/iNZightMR
	cd ../; git clone git@github.com:iNZightVIT/iNZightTS
	cd ../; git clone git@github.com:iNZightVIT/iNZightTools
	cd ../; git clone git@github.com:iNZightVIT/iNZightVIT-WIN
	cd ../; git clone git@github.com:jverzani/gWidgets2
	cd ../; git clone git@github.com:jverzani/gWidgets2RGtk2
	cd ../; mkdir tmp

# Now you can install them into a temporary directory: make all
all:	
	cd ../; R CMD INSTALL -l tmp iNZightTS iNZightMR iNZightTools iNZightRegression iNZightModules iNZightPlots iNZight VIT

# You will need to install these once, and any time John updates the development version (unless it gets
# uploaded to cran, then just forget this bit)
gWidgets2:
	cd ../; R CMD INSTALL -l tmp gWidgets2 gWidgets2RGtk2

# If you want to install to your local R library, then make here:
here:
	cd ../; R CMD INSTALL iNZightTS iNZightMR iNZightTools iNZightRegression iNZightModules iNZightPlots iNZight VIT

# And the gWidgets2 libraries:
ghere:
	cd ../; R CMD INSTALL gWidgets2 gWidgets2RGtk2

# Now depending on your system, you will need to use either of the following 
replace:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf vit iNZight iNZightPlots iNZightModules iNZightRegression iNZightTools iNZightMR iNZightTS
	mv ../tmp/* ../iNZightVIT-WIN/prog_files/library/

replaceG:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf gWidgets2 gWidgets2RGtk2
	mv ../tmp/gWidgets* ../iNZightVIT-WIN/prog_files/library/

# If on mac, make sure you get the iNZightVIT-MAC repository first
getMac:
	cd ../; git clone git@github.com:iNZightVIT/iNZightVIT-MAC

# and then this should update the packages.
replaceMac:
	cd ../iNZightVIT-MAC/Library/Frameworks/R.framework/Versions/2.15/Resources/library/; rm -rf vit iNZight iNZightPlots iNZightModules iNZightRegression iNZightTools iNZightMR iNZightTS
	mv ../tmp/* ../iNZightVIT-MAC/Library/Frameworks/R.framework/Versions/2.15/Resources/Library/


# At the beginning/end of a session, it is a good idea to check the status of all of your repositories.
statusall:
	cd ../iNZight; git status
	cd ../iNZightModules; git status
	cd ../iNZightPlots; git status
	cd ../iNZightRegression; git status
	cd ../iNZightTools; git status
	cd ../iNZightTS; git status
	cd ../iNZightMR; git status
	cd ../VIT; git status

# Once you have committed all changes, you need to pull any updates from github:
pullall:
	cd ../iNZight; git pull origin master
	cd ../iNZightModules; git pull origin master
	cd ../iNZightPlots; git pull origin master
	cd ../iNZightRegression; git pull origin master
	cd ../iNZightTools; git pull origin master
	cd ../iNZightTS; git pull origin master
	cd ../iNZightMR; git pull origin master
	cd ../VIT; git pull origin master

# and when you're done, push all of your work to github so it's kept up to date.
pushall:
	cd ../iNZight; git push origin master
	cd ../iNZightModules; git push origin master
	cd ../iNZightPlots; git push origin master
	cd ../iNZightRegression; git push origin master
	cd ../iNZightTools; git push origin master
	cd ../iNZightTS; git push origin master
	cd ../iNZightMR; git push origin master
	cd ../VIT; git push origin master


# How iNZighting! 
