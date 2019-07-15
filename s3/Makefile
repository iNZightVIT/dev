ifeq ($(V), 3.4)
default: source windows mac clean createHTML
else
default: windows mac clean createHTML
endif

PYTHON := python3.6

installPython:
	-sudo add-apt-repository -y ppa:deadsnakes/ppa
	sudo apt update
	sudo apt install python3.6 -y
	sudo easy_install3 pip
	sudo pip3 install -r ./requirements.txt
	
#Assumes that Python 3 64-bit is already installed, as well as PIP
setupPythonWindows:
	#installs dependency Windows takes issue with
	pip install ./lxml-4.2.3-cp37-cp37m-win_amd64.whl
	pip install ./requirements.txt

getAWSCred:
	$(PYTHON) aws_saml_login.py --user $(AWS_USER) --password $(AWS_PASS) --token $(AWS_TOKEN) --idp iam.auckland.ac.nz

	
createHTML:
	$(PYTHON) create_webpages.py --path www

ARGS=--dry --delete
syncChanges:
	aws --profile saml s3 sync $(ARGS) www/src s3://r.docker.stat.auckland.ac.nz/src
	aws --profile saml s3 sync $(ARGS) www/bin s3://r.docker.stat.auckland.ac.nz/bin

syncDownloads:
	aws --profile saml s3 sync www/downloads s3://r.docker.stat.auckland.ac.nz/downloads

clearCache:
	aws --profile 'saml' cloudfront create-invalidation --distribution-id $(AWS_ID) --paths "/*"


R32 := R-3.2
R33 := R-3.3
R34 := R-3.4
R35 := R-3.5
R36 := R-3.6

DIR := ~/iNZight
SRC := www/src
WIN := www/bin/windows
MAC := www/bin/macosx

period := .
empty :=
V  := 3.6
VS = $(subst $(period),$(empty),$(V))
RV = ${R${VS}}

ifneq ($(PKG),)
pkg_v ?= $(shell grep -i ^version $(DIR)/$(PKG)/DESCRIPTION | cut -d : -d \  -f 2)
endif
PACKAGE := $(PKG)_$(pkg_v)


source: $(PACKAGE).tar.gz
	@echo "   - copying source files into place"
	@rm -f $(SRC)/contrib/$(PKG)_*.tar.gz
	@cp $^ $(SRC)/contrib/$^
	@cd $(SRC)/contrib && \
		$(RV) --slave -e "tools::write_PACKAGES( )" && \
		rm -f .RData *.Rout

windows: $(PACKAGE).zip
	@echo "   - copying windows binaries into place"
	@rm -f $(WIN)/contrib/$(V)/$(PKG)_*.zip
	@cp $^ $(WIN)/contrib/$(V)/$^
	@echo "   - writing PACKAGES index"
	@cd $(WIN)/contrib/$(V) && \
		$(RV) --slave -e "tools::write_PACKAGES(type = \"win.binary\")" && \
		rm -f .RData *.Rout

mac: $(PACKAGE).tgz
	@echo "   - copying mac binaries into place"
ifeq ($(V),3.6) # => el-capitan
	@rm -f $(MAC)/el-capitan/contrib/$(V)/$(PKG)_*.tgz
	@cp $^ $(MAC)/el-capitan/contrib/$(V)/$^
	@cd $(MAC)/el-capitan/contrib/$(V) && \
		$(RV) --slave -e "tools::write_PACKAGES(type = \"mac.binary\")" && \
		rm -f .RData *.Rout
endif
ifeq ($(V),3.5) # => el-capitan
	@rm -f $(MAC)/el-capitan/contrib/$(V)/$(PKG)_*.tgz
	@cp $^ $(MAC)/el-capitan/contrib/$(V)/$^
	@cd $(MAC)/el-capitan/contrib/$(V) && \
		$(RV) --slave -e "tools::write_PACKAGES(type = \"mac.binary\")" && \
		rm -f .RData *.Rout
endif
ifeq ($(V),3.4) # => el-capitan
	@rm -f $(MAC)/el-capitan/contrib/$(V)/$(PKG)_*.tgz
	@cp $^ $(MAC)/el-capitan/contrib/$(V)/$^
	@cd $(MAC)/el-capitan/contrib/$(V) && \
		$(RV) --slave -e "tools::write_PACKAGES(type = \"mac.binary\")" && \
		rm -f .RData *.Rout
endif
ifeq ($(V),3.3) # => mavericks
	@rm -f $(MAC)/mavericks/contrib/$(V)/$(PKG)_*.tgz
	@cp $^ $(MAC)/mavericks/contrib/$(V)/$^
	@cd $(MAC)/mavericks/contrib/$(V) && \
		$(RV) --slave -e "tools::write_PACKAGES(type = \"mac.binary\")" && \
		rm -f .RData *.Rout
endif

clean:
	@echo Cleaning up
	-@rm -f *.tar.gz *.tgz *.zip
	-@rm -rf $(PKG)



$(PACKAGE).tar.gz:
	@echo "   - building packages source"
	@$(RV) CMD build --no-build-vignettes $(DIR)/$(PKG)

$(PKG): $(PACKAGE).tar.gz
	@echo "   - building binaries"
	@$(RV) CMD INSTALL -l . $^

$(PACKAGE).zip: $(PKG)
	@echo "   - zipping"
	@zip --quiet -r $@ $(PKG)

$(PACKAGE).tgz: $(PKG)
	@echo "   - creating tarball"
	@tar czf $@ $^
