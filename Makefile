all:	
	cd ../; R CMD INSTALL -l tmp iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT

gWidgets2:
	cd ../; R CMD INSTALL -l tmp gWidgets2 gWidgets2RGtk2

here:
	cd ../; R CMD INSTALL gWidgets2 gWidgets2RGtk2 iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT


pullall:
	cd ../iNZight; git pull origin master
	cd ../iNZightModules; git pull origin master
	cd ../iNZightsPlots; git pull origin master
	cd ../iNZightRegression; git pull origin master
	cd ../iNZightTS; git pull origin master
	cd ../iNZightMR; git pull origin master
	cd ../VIT; git pull origin master

statusall:
	cd ../iNZight; git status
	cd ../iNZightModules; git status
	cd ../iNZightsPlots; git status
	cd ../iNZightRegression; git status
	cd ../iNZightTS; git status
	cd ../iNZightMR; git status
	cd ../VIT; git status
