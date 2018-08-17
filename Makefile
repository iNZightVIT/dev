# This file allows quick building/updating of packages in the iNZight directory.

# If you haven't got any of the packages (i.e., only this one) then
# first place this dev/ directory in a folder (perhaps iNZight/?) and:
# make build

INZIGHT_VERSION = $(shell grep -i ^version ../iNZight/DESCRIPTION | cut -d : -d \  -f 2)
inzight_packages = iNZightTS iNZightRegression iNZightMR iNZightPlots iNZightTools iNZightModules iNZight vit FutureLearnData
inz_packages =  $(inzight_packages) iNZightMaps
extra := gWidgets2RGtk2 countrycode ggplot2 ggsfextra
all_packages = $(inz_packages)

s3rep = s3/www
DLDIR = $(s3rep)/downloads
BINDIR = $(s3rep)/bin
SRCDIR = $(s3rep)/src

CD_INZ := cd ~/iNZight;

# R versions
R32 := ~/R-3.2/bin/R
R33 := ~/R-3.3/bin/R
R34 := ~/R-3.4/bin/R
R35 := ~/R-3.5/bin/R

period := .
empty :=
V  := 3.5
VS = $(subst $(period),$(empty),$(V))
RV = ${R${VS}}

WINV := 3.5
WINVS := $(subst $(period),$(empty),$(WINV))
RWIN = ${R${WINVS}}

keepMaps:=false

build:
	@for pkg in $(inz_packages) ; do \
		cd ~/iNZight; git clone git@github.com:iNZightVIT/$$pkg ; \
	done
	cd ~/iNZight; mkdir tmp; mv VIT vit
	@echo "Now run make addhooks"

addhooks:
	@for pkg in $(inz_packages); do \
		cp githooks/* ../$$pkg/.git/hooks/ ;\
		sed -i '/mergeoptions/d' ../$$pkg/.git/config ;\
		sed -i '/^\[branch "master"\]$$/a \\tmergeoptions = --no-commit --no-ff' ../$$pkg/.git/config ;\
 	done
	@echo "Git Hooks copied into iNZight repositories"

RGTK := CRAN
ifeq ("$(V)", "3.2")
	RGTK := OLD
endif
ifeq ("$(V)", "3.3")
	RGTK := OLD
endif

installDep:
ifeq ("$(RGTK)", "OLD")
	@echo " * Installing Archives version of RGtk2 2.20.31 for pre-3.4 version of R"
	@$(RV) --slave -e "install.packages('https://cran.stat.auckland.ac.nz/src/contrib/Archive/RGtk2/RGtk2_2.20.31.tar.gz', type = 'source', repos = NULL)"
endif
	@echo " * Installing iNZight packages and dependencies"
	@$(RV) --slave -e "install.packages(c('devtools'), repos='https://cran.stat.auckland.ac.nz')"
	@for pkg in $(inz_packages); do \
		echo "\n *** "$$pkg" ...\n" && \
			cd ../$$pkg && \
			$(RV) --slave -e "devtools::install_deps(); devtools::install()" ;\
	done

# Now you can install them into a temporary directory: make all
all:
	@cd ../; $(RWIN) CMD INSTALL -l tmp $(inzight_packages)
ifeq ($(keepMaps),true)
	@cd ../; $(RWIN) CMD INSTALL -l tmp iNZightMaps
endif

extra:
	@cd ../; $(RWIN) CMD INSTALL -l tmp $(extra)


# If you want to install to your local R library, then make here:
here:
	@$(CD_INZ) $(RV) CMD INSTALL $(inz_packages)

extrahere:
	@$(CD_INZ) $(RV) CMD INSTALL $(extra)

# do the following to move into the Windows all-in-one directory:
replace:
	@cd ../iNZightVIT-WIN/prog_files/library; rm -rf $(inz_packages)
	@for pkg in $(inzight_packages) ; do \
		mv ../tmp/$$pkg ../iNZightVIT-WIN/prog_files/library/ ; \
	done
ifeq ($(keepMaps),true)
	@mv ../tmp/iNZightMaps ../iNZightVIT-WIN/prog_files/library/
endif

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
devall:
	@for pkg in $(inz_packages) ; do \
		echo "\n\n ==================================== "$$pkg"\n" ; \
		cd ../$$pkg; git checkout dev ; \
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

INZREPO=https://r.docker.stat.auckland.ac.nz
ppkgs=$(inz_packages) ggsfextra RgoogleMaps
pkginfo:
	@echo ""
	@for pkg in $(ppkgs) ; do \
		echo " - \033[32m$$pkg\033[0m@\033[35m`cd ../$$pkg && git rev-parse --abbrev-ref HEAD`\033[0m" ;\
		echo " - local version:  \033[33m`grep -i ^version ../$$pkg/DESCRIPTION | cut -d : -d \  -f 2`\033[0m" ;\
		echo " - server version: \033[33m`pkg=$$pkg R --slave -e 'cat(available.packages(repos="$(INZREPO)")[Sys.getenv("pkg"), \"Version\"])'`\033[0m" ;\
		echo ;\
	done



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
	# @cd $(DIRO); makensis INSTALL_SCRIPT.nsi
	@mv $(DIRO)/iNZightVIT-installer.exe $(DLDIR)/Windows/iNZightVIT-installer-$(INZIGHT_VERSION).exe
	@cd $(DLDIR); ln -sf Windows/iNZightVIT-installer-$(INZIGHT_VERSION).exe iNZightVIT-installer.exe

WININST=iNZightVIT-installer-$(INZIGHT_VERSION).zip

winReleaseZIP:
	cp -rv $(DIRO) $(DIRN)
	cd $(DIRN); rm -rf .git
	cd $(DIR); zip -r $(WININST) iNZightVIT
	mv $(WININST) $(DLDIR)/Windows/
	cd $(DLDIR) && ln -s Windows/$(WININST) iNZightVIT-installer.zip
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
RVs = 3.2 3.3 3.4 3.5
repositoryFiles:
	@echo "==== Building $(wpkg) v$(pkg_v)"
	@for rv in $(RVs); do \
		echo " *** R version $$rv" ;\
		$(MAKE) -C s3 PKG=$$wpkg V=$$rv ;\
	done
	@echo "  ** Setting file permissions ..."
	@find $(s3dir) -type f -exec chmod 664 {} +
	@find $(s3dir) -type d -exec chmod 775 {} +
	@echo "  ** Finished updating repository with $(wpkg) v$(pkg_v)"


inzightRepository:
	@for pkg in $(inz_packages) ; do \
	  make repositoryFiles wpkg=$$pkg ; \
	done

version ?= $(shell grep -i ^version $(DIR)/$(PKG)/DESCRIPTION | cut -d : -d \  -f 2)
liveVersions:
	@R --slave -e "available.packages(repos='https://r.docker.stat.auckland.ac.nz')[, 'Version']"

repostructure:
	@for i in  2 3 4 5; do mkdir -p $(s3rep)/bin/windows/contrib/3.$$i ; done
	@mkdir -p $(s3rep)/bin/macosx/contrib/3.2
	@for i in 4 5; do mkdir -p $(s3rep)/bin/macosx/el-capitan/contrib/3.$$i; done
	@for i in 2 3; do mkdir -p $(s3rep)/bin/macosx/mavericks/contrib/3.$$i; done
	@mkdir -p $(s3rep)/src/contrib
	@mkdir -p $(s3rep)/downloads/Windows
	@mkdir -p $(s3rep)/downloads/macOS

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


