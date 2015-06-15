#!/bin/bash
~/R-3.0.2/bin/R CMD INSTALL -l ~/iNZight/tmp ~/iNZight/vit
tar czvf ~/iNZight/tmp/vit.tgz ~/iNZight/tmp/vit
scp ~/iNZight/tmp/vit.tgz inzight@docker.stat.auckland.ac.nz:www/R/test/
rm -rf ~/iNZight/tmp/vit*
