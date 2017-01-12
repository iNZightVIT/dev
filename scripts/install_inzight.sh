#!/bin/bash


echo -n "Where do you want to install iNZightVIT? (default ~): "
read dir
dir=${dir:=~}
dir=${dir/#\~/$HOME}

echo Installing to $dir/iNZightVIT

inst_dir=$dir/iNZightVIT

mkdir -p $inst_dir/library

echo "Setting paths ..."
cat << EOF > $inst_dir/.Rprofile
.libPaths("$inst_dir/library")
options(repos = c("http://r.docker.stat.auckland.ac.nz/R",
                  "http://cran.stat.auckland.ac.nz"))

EOF

cpu_count=$(getconf _NPROCESSORS_ONLN)

echo "Installing iNZight packages ..."
cd $inst_dir && R --slave -e \
  "install.packages(c('iNZightRegression', 'iNZightPlots', \
                      'iNZightTS', 'iNZightMR', 'vit', 'iNZightTools', \
                      'FutureLearnData', 'iNZightModules', 'iNZight'), \
                    dependencies = TRUE, Ncpus=$cpu_count)"

echo "Creating additional files ..."
cat << EOF >> $inst_dir/.Rprofile
cat("Starting iNZight ...\n")
suppressMessages({
  library(iNZight)
  iNZight(disposeR = TRUE)
})
EOF

cat << EOF > $inst_dir/start_inzight
cd $inst_dir && R --silent
EOF
chmod +x $inst_dir/start_inzight

TAB="$(printf '\t')"
cat << EOF > $inst_dir/Makefile
INSTDIR=$inst_dir
install:
${TAB}@ln -is \$(INSTDIR)/start_inzight /usr/local/bin/inzight
${TAB}@chmod +x /usr/local/bin/inzight

uninstall:
${TAB}
${TAB}@if [ -L /usr/local/bin/inzight ]; then rm -i /usr/local/bin/inzight; fi
${TAB}@rm -rf $inst_dir
EOF

echo -n "Do you want to create a global 'inzight' command? [y/N] "
read global
global=${global:='N'}

if [ $global = "y" ]; then
  cd $inst_dir && sudo make install
  echo
  echo "Done. Run iNZight with the command 'inzight'"
  exit 0
fi

echo
echo "Done. Run iNZight from this directory with ./start_inzight"
