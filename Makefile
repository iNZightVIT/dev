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
here215:
	cd ../; ~/R-2.15.3/bin/R CMD INSTALL $(inz_packages)

here30:
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL $(inz_packages)

here:
	cd ../; ~/R-3.1.2/bin/R CMD INSTALL $(inz_packages)

# And the gWidgets2 libraries:
ghere215:
	cd ../; ~/R-2.15.3/bin/R CMD INSTALL $(g_packages)

ghere30:
	cd ../; ~/R-3.0.2/bin/R CMD INSTALL $(g_packages)

ghere:
	cd ../; ~/R-3.1.2/bin/R CMD INSTALL $(g_packages)

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
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git status ; \
	done

# Once you have committed all changes, you need to pull any updates from github:
pullall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git pull ; \
	done

fetchall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git fetch -p ; \
	done

masterall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git checkout master ; \
	done

branchall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git branch -a ; \
	done


# and when you're done, push all of your work to github so it's kept up to date.
pushall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git push ; \
	done

pullG:
	@for pkg in $(g_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git pull ; \
	done

# How iNZighting! 



## Show versions of all packages:
showVersions:
	@echo '\niNZightTS'; echo $(shell grep -i ^version ../iNZightTS/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightRegression'; echo $(shell grep -i ^version ../iNZightRegression/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightMR'; echo $(shell grep -i ^version ../iNZightMR/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightTools'; echo $(shell grep -i ^version ../iNZightTools/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightModules'; echo $(shell grep -i ^version ../iNZightModules/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightMaps'; echo $(shell grep -i ^version ../iNZightMaps/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZightPlots'; echo $(shell grep -i ^version ../iNZightPlots/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\niNZight'; echo $(shell grep -i ^version ../iNZight/DESCRIPTION | cut -d : -d \  -f 2)
	@echo '\nvit'; echo $(shell grep -i ^version ../vit/DESCRIPTION | cut -d : -d \  -f 2)


## Now commands for building the releases ...




## Need to update the version numbers here:
DIR = ~/iNZight
DIRO = ~/iNZight/iNZightVIT-WIN
DIRN = ~/iNZight/iNZightVIT
src_lib = $(DIR)/dev/www/R/src/contrib
WIN_REP = ~/iNZight/dev/www/R/bin/windows/contrib
MAC_REP3 = $(DIR)/dev/www/R/bin/macosx/contrib
MAC_REP2 = $(DIR)/dev/www/R/bin/macosx/leopard/contrib
MAC_REPMAV = $(DIR)/dev/www/R/bin/macosx/mavericks/contrib

winRelease:
	cp -rv $(DIRO) $(DIRN)
	cd $(DIRN); rm -rf .git
	cd $(DIR); zip -r iNZightVIT-v$(INZIGHT_VERSION)-zipfile.zip iNZightVIT
	rm -rf $(DIRN)

## User will define wpkg=iNZightPlots, eg
pkg_v = $(shell grep -i ^version $(DIR)/$(wpkg)/DESCRIPTION | cut -d : -d \  -f 2)
repositoryFiles:
	@echo === Building repository files for: $(wpkg) v$(pkg_v)
	@echo
	@echo " == SOURCE"
	@echo
	@echo " Building source file ..."
	-@rm -f $(src_lib)/$(wpkg)_*.tar.gz
	@cd $(src_lib) ; \
	  ~/R-3.1.2/bin/R CMD build --no-build-vignettes $(DIR)/$(wpkg)
	@echo " ... done."
	@echo 
	@echo " Building repository package indices for Windows ..."
	@cd $(src_lib); ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeIndices.R; 
	-@cd $(src_lib); rm -f *.Rout; rm -f .RData
	@echo " ... done."
	@echo
	@echo
	@echo " == WINDOWS"
	@echo
	@echo "  = R v2.15.3"
	@echo
	@cd $(DIR)/$(wpkg) ; \
	  rm -rf tmp ; \
	  cp ../dev/makes/Make_2153 ./Makefile ; \
	  echo " Building binaries ... "; echo ; \
	  make win ; \
	  rm $(wpkg)_$(pkg_v).tar.gz ; rm Makefile
	@echo 
	@echo " ... replacing old binaries ..." 
	-@rm -f $(WIN_REP)/2.15/$(wpkg)_*.zip 2>/dev/null
	@mv $(DIR)/$(wpkg)/$(wpkg)_$(pkg_v).zip $(WIN_REP)/2.15/
	@echo " ... done."
	@echo
	@echo "  = R v3.0.2"
	@echo
	@cd $(DIR)/$(wpkg) ; \
	  rm -rf tmp ; \
	  cp ../dev/makes/Make_302 ./Makefile ; \
	  echo " Building binaries ... "; echo ; \
	  make win ; \
	  rm $(wpkg)_$(pkg_v).tar.gz ; rm Makefile
	@echo 
	@echo " ... replacing old binaries ..." 
	-@rm -f $(WIN_REP)/3.0/$(wpkg)_*.zip 2>/dev/null
	@mv $(DIR)/$(wpkg)/$(wpkg)_$(pkg_v).zip $(WIN_REP)/3.0/
	@echo " ... done."
	@echo
	@echo "  = R v3.1.2"
	@echo
	@cd $(DIR)/$(wpkg) ; \
	  rm -rf tmp ; \
	  cp ../dev/makes/Make_312 ./Makefile ; \
	  echo " Building binaries ... "; echo ; \
	  make win ; \
	  rm $(wpkg)_$(pkg_v).tar.gz ; rm Makefile
	@echo 
	@echo " ... replacing old binaries ..." 
	-@rm -f $(WIN_REP)/3.1/$(wpkg)_*.zip 2>/dev/null
	@mv $(DIR)/$(wpkg)/$(wpkg)_$(pkg_v).zip $(WIN_REP)/3.1/
	@echo " ... done."
	@echo 
	@echo " Building repository package indices for Windows ..."
	@cd $(WIN_REP)/2.15/; ~/R-2.15.3/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	@cd $(WIN_REP)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	@cd $(WIN_REP)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	-@cd $(WIN_REP)/2.15/; rm -f *.Rout; rm -f .RData
	-@cd $(WIN_REP)/3.0/; rm -f *.Rout; rm -f .RData
	-@cd $(WIN_REP)/3.1/; rm -f *.Rout; rm -f .RData
	@echo " ... done."
	@echo ; echo
	@mkdir -p $(DIR)/dev/tmp
	@echo " == MAC (leopard)"
	@echo
	@echo "  = R v2.15.3"
	@echo
	@echo " Building binaries ... "
	@echo
	@cd $(DIR)/dev ; \
	  ~/R-2.15.3/bin/R CMD INSTALL -l tmp $(DIR)/$(wpkg)
	@cd $(DIR)/dev/tmp ; \
	  tar czf $(wpkg)_$(pkg_v).tgz $(wpkg)
	@echo
	@echo " ... replaceing old binaries ..."
	-@rm -f $(MAC_REP2)/2.15/$(wpkg)_*.tgz
	@mv $(DIR)/dev/tmp/$(wpkg)_$(pkg_v).tgz $(MAC_REP2)/2.15/
	@echo " ... done."
	@echo
	@echo " == MAC"
	@echo
	@echo "  = R v3.0.2"
	@echo
	@echo " Building binaries ... "
	@echo
	@cd $(DIR)/dev ; \
	  ~/R-3.0.2/bin/R CMD INSTALL -l tmp $(DIR)/$(wpkg)
	@cd $(DIR)/dev/tmp ; \
	  tar czf $(wpkg)_$(pkg_v).tgz $(wpkg)
	@echo
	@echo " ... replaceing old binaries ..."
	-@rm -f $(MAC_REP3)/3.0/$(wpkg)_*.tgz
	@mv $(DIR)/dev/tmp/$(wpkg)_$(pkg_v).tgz $(MAC_REP3)/3.0/
	@echo " ... done."
	@echo
	@echo "  = R v3.1.2"
	@echo
	@echo " Building binaries ... "
	@echo
	@cd $(DIR)/dev ; \
	  ~/R-3.1.2/bin/R CMD INSTALL -l tmp $(DIR)/$(wpkg)
	@cd $(DIR)/dev/tmp ; \
	  tar czf $(wpkg)_$(pkg_v).tgz $(wpkg)
	@echo
	@echo " ... replaceing old binaries ..."
	-@rm -f $(MAC_REP3)/3.1/$(wpkg)_*.tgz
	@mv $(DIR)/dev/tmp/$(wpkg)_$(pkg_v).tgz $(MAC_REP3)/3.1/
	@echo " ... done."
	@echo
	@echo " == MAC (mavericks)"
	@echo
	@echo "  = R v3.1.2"
	@echo
	@echo " Building binaries ... "
	@echo
	@cd $(DIR)/dev ; \
	  ~/R-3.1.2/bin/R CMD INSTALL -l tmp $(DIR)/$(wpkg)
	@cd $(DIR)/dev/tmp ; \
	  tar czf $(wpkg)_$(pkg_v).tgz $(wpkg)
	@echo
	@echo " ... replaceing old binaries ..."
	-@rm -f $(MAC_REPMAV)/3.1/$(wpkg)_*.tgz
	@mv $(DIR)/dev/tmp/$(wpkg)_$(pkg_v).tgz $(MAC_REPMAV)/3.1/
	@echo " ... done."
	@echo
	-@rm -rf $(DIR)/dev/tmp
	@echo " Building repository package indices for Mac ..."
	-@cd $(MAC_REP2)/2.15/; ~/R-2.15.3/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm -f *.Rout
	-@cd $(MAC_REP3)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm -f *.Rout
	-@cd $(MAC_REP3)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm -f *.Rout
	-@cd $(MAC_REPMAV)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm -f *.Rout
	@echo " ... done."
	@echo
	@echo Finished updating repository with $(wpkg) v$(pkg_v).
	@echo Have a nice day.; echo


inzightRepository:
	@for pkg in $(inz_packages) ; do \
	  make repositoryFiles wpkg=$$pkg ; \
	done



version = $(shell grep -i ^version $(DIR)/$(PKG)/DESCRIPTION | cut -d : -d \  -f 2)

pkgToDocker:
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/src/contrib/$(PKG)_*.tar.gz";
	cd $(src_lib); scp PACKAGES PACKAGES.gz $(PKG)_$(version).tar.gz inzight@docker.stat.auckland.ac.nz:www/R/src/contrib/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/2.15/$(PKG)_*.zip";
	cd $(WIN_REP)/2.15/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/2.15/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/3.0/$(PKG)_*.zip";
	cd $(WIN_REP)/3.0/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/3.0/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/3.1/$(PKG)_*.zip";
	cd $(WIN_REP)/3.1/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/3.1/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/contrib/3.0/$(PKG)_*.tgz";
	cd $(MAC_REP3)/3.0/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/contrib/3.0/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/contrib/3.1/$(PKG)_*.tgz";
	cd $(MAC_REP3)/3.1/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/contrib/3.1/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/leopard/contrib/2.15/$(PKG)_*.tgz";
	cd $(MAC_REP2)/2.15/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/leopard/contrib/2.15/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/mavericks/contrib/3.1/$(PKG)_*.tgz";
	cd $(MAC_REPMAV)/3.1/; scp PACKAGES PACKAGES.gz $(PKG)_$(version).tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/mavericks/contrib/3.1/;

inzToDocker:
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/src/contrib/*.tar.gz";
	cd $(src_lib); scp PACKAGES PACKAGES.gz *.tar.gz inzight@docker.stat.auckland.ac.nz:www/R/src/contrib/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/2.15/*.zip";
	cd $(WIN_REP)/2.15/; scp PACKAGES PACKAGES.gz *.zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/2.15/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/3.0/*.zip";
	cd $(WIN_REP)/3.0/; scp PACKAGES PACKAGES.gz *.zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/3.0/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/windows/contrib/3.1/*.zip";
	cd $(WIN_REP)/3.1/; scp PACKAGES PACKAGES.gz *.zip inzight@docker.stat.auckland.ac.nz:www/R/bin/windows/contrib/3.1/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/contrib/3.0/*.tgz";
	cd $(MAC_REP3)/3.0/; scp PACKAGES PACKAGES.gz *.tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/contrib/3.0/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/contrib/3.1/*.tgz";
	cd $(MAC_REP3)/3.1/; scp PACKAGES PACKAGES.gz *.tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/contrib/3.1/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/leopard/contrib/2.15/*.tgz";
	cd $(MAC_REP2)/2.15/; scp PACKAGES PACKAGES.gz *.tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/leopard/contrib/2.15/;
	-ssh inzight@docker.stat.auckland.ac.nz "rm www/R/bin/macosx/mavericks/contrib/3.1/*.tgz";
	cd $(MAC_REPMAV)/3.1/; scp PACKAGES PACKAGES.gz *.tgz inzight@docker.stat.auckland.ac.nz:www/R/bin/macosx/mavericks/contrib/3.1/;


newsFiles:
	@for pkg in $(inz_packages) ; do \
	  ~/R-3.1.2/bin/R CMD Rdconv --type=html --output=changes/$$pkg.html $(DIR)/$$pkg/inst/NEWS.Rd ; \
	done
	@echo "NEWS files converted to HTML and moved to dev/changes ..."
	@cd changes; Rscript --vanilla addLinks.R;
	@echo "Copying to server ..."
	@scp changes/*.php tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/support/changelog/changes/
	@ echo "Done.\n\n"



help:
	@echo
	@echo "To build binaries for packages, run:"
	@echo "   make repositoryFiles wpkg=NAME_OF_PACKAGE"
	@echo
	@echo "To push these to the repository, run:"
	@echo "   make pkgToDocker PKG=NAME_OF_PACKAGE"
	@echo
	@echo "To update the NEWS files on the website, run:"
	@echo "   make newFiles"
	@echo
	@echo "To make a ZIP archive of iNZightVIT for Windows:"
	@echo "   1. make sure the iNZightVIT-WIN repository is up-to-date with git pull,"
	@echo "   2. Run:"
	@echo "      make winRelease"
	@echo
