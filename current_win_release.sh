#!/bin/sh
curl -s https://api.github.com/repos/iNZightVIT/win-installer/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
