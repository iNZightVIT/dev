# This file allows quick building/updating of packages in the iNZight directory.

# If you haven't got any of the packages (i.e., only this one) then
# first place this dev/ directory in a folder (perhaps iNZight/?) and:
# make build

INZIGHT_VERSION = $(shell grep -i ^version ../iNZight/DESCRIPTION | cut -d : -d \  -f 2)
inz_packages =  iNZightTS iNZightRegression iNZightMR iNZightPlots iNZightTools iNZightMaps iNZightModules iNZight vit FutureLearnData
extra := gWidgets2RGtk2 countrycode
all_packages = $(inz_packages)

CD_INZ := cd ~/iNZight;

# R versions
R31 := ~/R-3.1.2/bin/R
R32 := ~/R-3.2.2/bin/R
R33 := ~/R-3.3.1/bin/R
R34 := ~/R-3.4.0/bin/R

period := .
empty :=
V  := 3.4
VS = $(subst $(period),$(empty),$(V))
RV = ${R${VS}}

WINV := 3.2
WINVS := $(subst $(period),$(empty),$(WINV))
RWIN = ${R${WINVS}}

build:
	for pkg in $(inz_packages) ; do \
		cd ~/iNZight; git clone git@github.com:iNZightVIT/$$pkg ; \
	done
	cd ~/iNZight; mkdir tmp; mv VIT vit

# Now you can install them into a temporary directory: make all
all:
	cd ../; $(RWIN) CMD INSTALL -l tmp $(inz_packages)

extra:
	cd ../; $(RWIN) CMD INSTALL -l tmp $(extra)


# If you want to install to your local R library, then make here:
here:
	$(CD_INZ) $(RV) CMD INSTALL $(inz_packages)

extrahere:
	$(CD_INZ) $(RV) CMD INSTALL $(extra)

# do the following to move into the Windows all-in-one directory:
replace:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf $(inz_packages)
	for pkg in $(inz_packages) ; do \
		mv ../tmp/$$pkg ../iNZightVIT-WIN/prog_files/library/ ; \
	done

extrareplace:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf $(extra)
	for pkg in $(extra) ; do \
		mv ../tmp/$$pkg ../iNZightVIT-WIN/prog_files/library/ ; \
	done

# If on mac, make sure you get the iNZightVIT-MAC repository first
getMac:
	cd ../; git clone git@github.com:iNZightVIT/iNZightVIT-osx-installer.git

# and then this should update the packages.
MACINSTLIB = ~/iNZight/iNZightVIT-osx-installer/Files/iNZightVIT/.library
macinstaller:
	cd $(MACINSTLIB); rm -rf $(inz_packages);
	cd ../; ~/R-3.2.2/bin/R CMD INSTALL -l tmp $(inz_packages); mv tmp/* $(MACINSTLIB)

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


winRelease:
	cp updateProfile-windows.R $(DIRO)/prog_files/.Rprofile
	cd $(DIRO); rm -rf prog_files/library/iNZightMaps; makensis INSTALL_SCRIPT.nsi

winReleaseZIP:
	cp -rv $(DIRO) $(DIRN)
	cd $(DIRN); rm -rf .git
	cd $(DIR); zip -r iNZightVIT-v$(INZIGHT_VERSION)-zipfile.zip iNZightVIT
	rm -rf $(DIRN)

PATCH_PKGS ?= $(inz_packages)
winPatch:
	-@cd $(DIRO); rm *.zip
	@cd $(DIRO)/prog_files; zip -r iNZightVIT_v$(INZIGHT_VERSION)-patch.zip library/iNZight library/iNZightPlots library/iNZightMR library/iNZightModules library/iNZightTS library/iNZightRegression library/iNZightTools library/vit; mv *.zip ../
	@scp $(DIRO)/iNZightVIT_v$(INZIGHT_VERSION)-patch.zip tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/downloads/Windows

winPatchAll:
	-@cd $(DIRO); rm *.zip
	@cd $(DIRO)/prog_files; zip -r iNZightVIT_v$(INZIGHT_VERSION)-patch.zip library; mv *.zip ../
	@scp $(DIRO)/iNZightVIT_v$(INZIGHT_VERSION)-patch.zip tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/downloads/Windows

## User will define wpkg=iNZightPlots, eg
pkg_v ?= $(shell grep -i ^version $(DIR)/$(wpkg)/DESCRIPTION | cut -d : -d \  -f 2)
RVs = 3.2 3.3 3.4
repositoryFiles:
	@echo "==== Building $(wpkg) v$(pkg_v)"
	@for rv in $(RVs); do \
		echo " *** R version $$rv" ;\
		$(MAKE) -C www PKG=$$wpkg V=$$rv ;\
	done
	@echo "  ** Setting file permissions ..."
	@find www/R -type f -exec chmod 664 {} +
	@find www/R -type d -exec chmod 775 {} +
	@echo "  ** Finished updating repository with $(wpkg) v$(pkg_v)"


inzightRepository:
	@for pkg in $(inz_packages) ; do \
	  make repositoryFiles wpkg=$$pkg ; \
	done


version ?= $(shell grep -i ^version $(DIR)/$(PKG)/DESCRIPTION | cut -d : -d \  -f 2)
addr = scienceit@docker.stat.auckland.ac.nz
repodir ?= /srv/www/R
repourl = $(addr):$(repodir)

# sync www/R/bin and www/R/src directories
dry := true
ifeq ($(dry), false)
flags := -alv
else
flags := -alvn
endif
sync:
	@rsync $(flags) --delete www/R/bin/ $(repourl)/bin
	@echo
	@rsync $(flags) --delete www/R/src/ $(repourl)/src
ifeq ($(dry), true)
	@echo "\n *** Run \`sync dry=false\` to perform sync"
endif


winUpload:
	@echo Uploading installer and creating symlink ...
	@scp $(DIRO)/iNZightVIT-installer.exe tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/downloads/Windows/iNZightVIT-installer-$(INZIGHT_VERSION).exe

ssh:
	ssh -t tell029@login02.fos.auckland.ac.nz "cd /mnt/tell029/web/homepages.stat/inzight-www/iNZight; bash --login"



newsFiles:
	@for pkg in $(inz_packages) ; do \
	  ~/R-3.2.2/R CMD Rdconv --type=html --output=changes/$$pkg.html $(DIR)/$$pkg/inst/NEWS.Rd ; \
	done
	@echo "NEWS files converted to HTML and moved to dev/changes ..."
	@cd changes; Rscript --vanilla addLinks.R;
	@echo "Copying to server ..."
	@scp changes/*.php tell029@login02.fos.auckland.ac.nz:/mnt/tell029/web/homepages.stat/inzight-www/iNZight/support/changelog/changes/
	@echo "Done.\n\n"

changeLog:
	@echo Copying NEWS files to www repository ...
	@for pkg in $(inz_packages) ; do \
	  cp $(DIR)/$$pkg/NEWS.Md $(DIR)/inzight-www/iNZight/support/changelog/changes/$$pkg.Md ; \
	done
	@echo Done
	@echo


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
