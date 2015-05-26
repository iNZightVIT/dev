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



## Now commands for building the releases ...




## Need to update the version numbers here:
DIR = ~/iNZight
DIRO = ~/iNZight/iNZightVIT-WIN
DIRN = ~/iNZight/iNZightVIT
WIN_REP = ~/iNZight/dev/www/R/bin/windows/contrib

winRelease:
	cp -rv $(DIRO) $(DIRN)
	cd $(DIRN); rm -rf .git
	cd $(DIR); zip -r iNZightVIT-v$(INZIGHT_VERSION)-zipfile.zip iNZightVIT
	rm -rf $(DIRN)


toWin215:	
	rm $(WIN_REP)/2.15/*.zip
	for pkg in $(all_packages) ; do \
		mv $(DIR)/$$pkg/$$pkg*.zip $(WIN_REP)/2.15/ ; \
	done
toWin30:	
	rm $(WIN_REP)/3.0/*.zip
	for pkg in $(all_packages) ; do \
		mv $(DIR)/$$pkg/$$pkg*.zip $(WIN_REP)/3.0/ ; \
	done
toWin31:	
	rm $(WIN_REP)/3.1/*.zip
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
	cd $(WIN_REP)/2.15/; ~/R-2.15.3/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	cd $(WIN_REP)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	cd $(WIN_REP)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeWinIndices.R
	-cd $(WIN_REP)/2.15/; rm *.Rout; rm .RData
	-cd $(WIN_REP)/3.0/; rm *.Rout; rm .RData
	-cd $(WIN_REP)/3.1/; rm *.Rout; rm .RData





src_lib = $(DIR)/dev/www/R/src/contrib
source:
	rm $(src_lib)/*.tar.gz
	for pkg in $(all_packages) ; do \
		cd $(src_lib) ; ~/R-3.1.2/bin/R CMD build --no-build-vignettes $(DIR)/$$pkg ; \
	done
srcPackageIndex:
	@cd $(src_lib); ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeIndices.R; 
	-@cd $(src_lib); rm *.Rout; rm .RData

srcAll:
	make source srcPackageIndex


MAC_REP3 = $(DIR)/dev/www/R/bin/macosx/contrib
MAC_REP2 = $(DIR)/dev/www/R/bin/macosx/leopard/contrib
MAC_REPMAV = $(DIR)/dev/www/R/bin/macosx/mavericks/contrib



version = $(shell grep -i ^version $(DIR)/$(PKG)/DESCRIPTION | cut -d : -d \  -f 2)
ACTUALmac31:
	cd $(DIR)/dev; ~/R-3.1.2/bin/R CMD INSTALL -l tmp $(DIR)/$(PKG);
	cd $(DIR)/dev/tmp; tar cvzf $(PKG)_$(version).tgz $(PKG); mv $(PKG)_$(version).tgz $(MAC_REP3)/3.1/

mac31:
	rm $(MAC_REP3)/3.1/*.tgz
	mkdir tmp
	for pkg in $(all_packages) ; do \
		make ACTUALmac31 PKG=$$pkg ; \
	done
	rm -rf tmp



ACTUALmac30:
	cd $(DIR)/dev; ~/R-3.0.2/bin/R CMD INSTALL -l tmp $(DIR)/$(PKG);
	cd $(DIR)/dev/tmp; tar cvzf $(PKG)_$(version).tgz $(PKG); mv $(PKG)_$(version).tgz $(MAC_REP3)/3.0/

mac30:
	rm $(MAC_REP3)/3.0/*.tgz
	mkdir tmp
	for pkg in $(all_packages) ; do \
		make ACTUALmac30 PKG=$$pkg ; \
	done
	rm -rf tmp


ACTUALmac215:
	cd $(DIR)/dev; ~/R-2.15.3/bin/R CMD INSTALL -l tmp $(DIR)/$(PKG);
	cd $(DIR)/dev/tmp; tar cvzf $(PKG)_$(version).tgz $(PKG); mv $(PKG)_$(version).tgz $(MAC_REP2)/2.15/

mac215:
	rm $(MAC_REP2)/2.15/*.tgz
	mkdir tmp
	for pkg in $(all_packages) ; do \
		make ACTUALmac215 PKG=$$pkg ; \
	done
	rm -rf tmp


ACTUALmacMAV:
	cd $(DIR)/dev; ~/R-3.1.2/bin/R CMD INSTALL -l tmp $(DIR)/$(PKG);
	cd $(DIR)/dev/tmp; tar cvzf $(PKG)_$(version).tgz $(PKG); mv $(PKG)_$(version).tgz $(MAC_REPMAV)/3.1/

macMAV:
	rm $(MAC_REPMAV)/3.1/*.tgz
	mkdir tmp
	for pkg in $(all_packages) ; do \
		make ACTUALmacMAV PKG=$$pkg ; \
	done
	rm -rf tmp
	cp $(DIR)/dev/macpkg/* $(MAC_REPMAV)/3.1/

ACTUALmacMAV30:
	cd $(DIR)/dev; ~/R-3.0.2/bin/R CMD INSTALL -l tmp $(DIR)/$(PKG);
	cd $(DIR)/dev/tmp; tar cvzf $(PKG)_$(version).tgz $(PKG); mv $(PKG)_$(version).tgz $(MAC_REPMAV)/3.0/

macMAV30:
	rm $(MAC_REPMAV)/3.0/*.tgz
	mkdir tmp
	for pkg in $(all_packages) ; do \
		make ACTUALmacMAV30 PKG=$$pkg ; \
	done
	rm -rf tmp


macPackageIndex:
	-@cd $(MAC_REP2)/2.15/; ~/R-2.15.3/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm *.Rout
	-@cd $(MAC_REP3)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm *.Rout
	-@cd $(MAC_REP3)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm *.Rout
	-@cd $(MAC_REPMAV)/3.1/; ~/R-3.1.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm *.Rout
	-@cd $(MAC_REPMAV)/3.0/; ~/R-3.0.2/bin/R CMD BATCH $(DIR)/dev/writeMacIndices.R; rm *.Rout


macEverything:
	make mac215 mac30 mac31 macMAV macPackageIndex; echo "\n\nSuccessfully created Mac binaries for R 2.15, 3.0.2 and 3.1.1 and moved to dev.repository.\n\n"



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


newsFiles:
	@for pkg in $(inz_packages) ; do \
	  ~/R-3.1.2/bin/R CMD Rdconv --type=html --output=changes/$$pkg.html $(DIR)/$$pkg/inst/NEWS.Rd ; \
	done
	@echo "NEWS files converted to HTML and moved to dev/changes ..."
	@cd changes; Rscript --vanilla addLinks.R;
	@echo "Copying to server ..."
	@scp changes/*.php tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/newSite/iNZight/support/changelog/changes/
	@ echo "Done.\n\n"
