all:	
	cd ../; R CMD INSTALL -l tmp iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT

gWidgets2:
	cd ../; R CMD INSTALL -l tmp gWidgets2 gWidgets2RGtk2

here:
	cd ../; R CMD INSTALL gWidgets2 gWidgets2RGtk2 iNZightTS iNZightMR iNZightRegression iNZightModules iNZightPlots iNZight VIT


pullall:
	cd ../iNZight; git pull origin master
	cd ../iNZightModules; git pull origin master
	cd ../iNZightPlots; git pull origin master
	cd ../iNZightRegression; git pull origin master
	cd ../iNZightTS; git pull origin master
	cd ../iNZightMR; git pull origin master
	cd ../VIT; git pull origin master

pushall:
	cd ../iNZight; git push origin master
	cd ../iNZightModules; git push origin master
	cd ../iNZightPlots; git push origin master
	cd ../iNZightRegression; git push origin master
	cd ../iNZightTS; git push origin master
	cd ../iNZightMR; git push origin master
	cd ../VIT; git push origin master

statusall:
	cd ../iNZight; git status
	cd ../iNZightModules; git status
	cd ../iNZightPlots; git status
	cd ../iNZightRegression; git status
	cd ../iNZightTS; git status
	cd ../iNZightMR; git status
	cd ../VIT; git status

replace:
	cd ../iNZightVIT-WIN/prog_files/library; rm -rf vit iNZight iNZightPlots iNZightModules iNZightRegression iNZightMR iNZightTS
	mv ../tmp/* ../iNZightVIT-WIN/prog_files/library/

replaceMac:
	cd ../iNZightVIT-MAC/Library/Frameworks/R.framework/Versions/2.15/Resources/library/; rm -rf vit iNZight iNZightPlots iNZightModules iNZightRegression iNZightMR iNZightTS
	mv ../tmp/* ../iNZightVIT-MAC/Library/Frameworks/R.framework/Versions/2.15/Resources/Library/
