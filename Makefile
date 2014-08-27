# This file allows quick building/updating of packages in the iNZight directory.

# If you haven't got any of the packages (i.e., only this one) then 
# first place this dev/ directory in a folder (perhaps iNZight/?) and:
# make build

INZIGHT_VERSION = $(shell grep -i ^version ../iNZight/DESCRIPTION | cut -d : -d \  -f 2)
inz_packages = iNZightTS iNZightRegression iNZightMR iNZightTools iNZightModules iNZightPlots iNZight vit
g_packages = gWidgets2 gWidgets2RGtk2
all_packages = $(g_packages) $(inz_packages)

build:
	for pkg in $(inz_packages) iNZightVIT-WIN ; do \
		cd ../; git clone git@github.com:iNZightVIT/$$pkg ; \
	done
	for pkg in $(g_packages) ; do \
		cd ../; git clone git@github.com:jverzani/$$pkg ; \
	done
	cd ../; mkdir tmp; mv VIT vit

# Now you can install them into a temporary directory: make all
all:	
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL -l tmp $(inz_packages)

# You will need to install these once, and any time John updates the development version (unless it gets
# uploaded to cran, then just forget this bit)
gWidgets2:
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL -l tmp $(g_packages)

# If you want to install to your local R library, then make here:
here30:
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL $(inz_packages)

here:
	cd ../; R CMD INSTALL $(inz_packages)

# And the gWidgets2 libraries:
ghere30:
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL $(g_packages)

ghere:
	cd ../; R CMD INSTALL $(g_packages)

# do the following to move into the Windows all-in-one directory:
replace:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf $(inz_packages)
	for pkg in $(inz_packages) ; do \
		mv ../tmp/$$pkg ../iNZightVIT-WIN/prog_files/library/ ; \
	done

replaceG:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf $(g_packages)
	mv ../tmp/gWidgets* ../iNZightVIT-WIN/prog_files/library/

# If on mac, make sure you get the iNZightVIT-MAC repository first
getMac:
	cd ../; git clone git@github.com:iNZightVIT/iNZightVIT-MAC

# and then this should update the packages.
replaceMac:
	cd ../iNZightVIT-MAC/Library/Frameworks/R.framework/Resources/library/; rm -rf vit iNZight iNZightPlots iNZightModules iNZightRegression iNZightTools iNZightMR iNZightTS
	mv ../tmp/* ../iNZightVIT-MAC/Library/Frameworks/R.framework/Resources/library/

rmMacG:
	cd ../iNZightVIT-MAC/Library/Frameworks/R.framework/Resources/library/; rm -rf gWidgets2 gWidgets2RGtk2

# At the beginning/end of a session, it is a good idea to check the status of all of your repositories.
statusall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git status ; \
	done

# Once you have committed all changes, you need to pull any updates from github:
pullall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git pull ; \
	done

fetchall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git fetch -p ; \
	done

masterall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git checkout master ; \
	done

branchall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git branch -a ; \
	done


# and when you're done, push all of your work to github so it's kept up to date.
pushall:
	for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git push ; \
	done

pullG:
	for pkg in $(g_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git pull ; \
	done

# How iNZighting! 



## Now commands for building the releases ...




## Need to update the version numbers here:
DIR = ~/iNZight
DIRO = ~/iNZight/iNZightVIT-WIN
DIRN = ~/iNZight/iNZightVIT_$(INZIGHT_VERSION)
WIN_REP = ~/iNZight/dev/www/R/bin/windows/contrib

winRelease:
	cp -rv $(DIRO) $(DIRN)
	cd $(DIRN); rm -rf .git
	cd $(DIR); zip -r iNZightVIT_$(INZIGHT_VERSION)-zipfile.zip iNZightVIT_$(INZIGHT_VERSION)
	rm -rf $(DIRN)


toWin215:	
	for pkg in $(all_packages) ; do \
		mv $(DIR)/$$pkg/$$pkg*.zip $(WIN_REP)/2.15/ ; \
	done
toWin30:	
	for pkg in $(all_packages) ; do \
		mv $(DIR)/$$pkg/$$pkg*.zip $(WIN_REP)/3.0/ ; \
	done
toWin31:	
	for pkg in $(all_packages) ; do \
		mv $(DIR)/$$pkg/$$pkg*.zip $(WIN_REP)/3.1/ ; \
	done

win215:
	for pkg in $(all_packages) ; do \
		cd $(DIR)/$$pkg ; \
		rm -rf tmp/ ; \
		cp ../dev/makes/Make_2153 ./Makefile ; \
		make win ; \
		rm *.tar.gz ; \
		rm Make* ; \
		cd .. ; \
	done
	make toWin215

win30:
	for pkg in $(all_packages) ; do \
		cd $(DIR)/$$pkg ; \
		rm -rf tmp/ ; \
		cp ../dev/makes/Make_302 ./Makefile ; \
		make win ; \
		rm *.tar.gz ; \
		rm Make* ; \
		cd .. ; \
	done
	make toWin30

win31:
	for pkg in $(all_packages) ; do \
		cd $(DIR)/$$pkg ; \
		rm -rf tmp/ ; \
		cp ../dev/makes/Make_311 ./Makefile ; \
		make win ; \
		rm *.tar.gz ; \
		rm Make* ; \
		cd .. ; \
	done
	make toWin31


winEverything:
	make win215 win30 win31 winPackageIndex; echo "\n\nSuccessfully created windows binaries for R 2.15, 3.0.2 and 3.1.1 and moved to dev.repository.\n\n"



winPackageIndex:
	cd $(WIN_REP)/2.15/; ~/R-2.15.3/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R; rm *.Rout
	cd $(WIN_REP)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R; rm *.Rout
	cd $(WIN_REP)/3.1/; R CMD BATCH $(DIR)/dev/writeWinIndices.R; rm *.Rout

src_lib = $(DIR)/dev/www/R/src/contrib
source:
	for pkg in $(all_packages) ; do \
		cd $(src_lib) ; R CMD build --no-build-vignettes $(DIR)/$$pkg ; \
	done
srcPackageIndex:
	cd $(src_lib); R CMD BATCH $(DIR)/dev/writeIndices.R; rm *.Rout
