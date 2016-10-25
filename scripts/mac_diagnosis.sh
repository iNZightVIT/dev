#!/bin/bash
ls -al /Library/Frameworks /Library/Frameworks/R.framework/Versions /Applications/iNZightVIT /Applications/iNZightVIT/.library /Applications/R* > ~/Desktop/iNZight.log
echo "\nInstalled packages:" >> ~/Desktop/iNZight.log
pkgutil --packages >> ~/Desktop/iNZight.log

echo Log file created on the desktop. Please attach to email.
