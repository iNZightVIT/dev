#!/bin/bash
~/R-2.15.3/bin/R CMD INSTALL -l ~/iNZight/tmp ~/iNZight/vit
tar czvf ~/iNZight/tmp/vit215.tgz ~/iNZight/tmp/vit
scp ~/iNZight/tmp/vit215.tgz inzight@docker.stat.auckland.ac.nz:www/R/test/
rm -rf ~/iNZight/tmp/vit*
