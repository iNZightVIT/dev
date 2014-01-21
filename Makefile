all:	
	cd ../; R CMD INSTALL -l tmp iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT

gWidgets2:
	cd ../; R CMD INSTALL -l tmp gWidgets2 gWidgets2RGtk2

here:
	cd ../; R CMD INSTALL gWidgets2 gWidgets2RGtk2 iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT
