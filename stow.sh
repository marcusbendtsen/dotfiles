#!/bin/bash

##
## Define packages
##
packages=(".")


##
## Delete and activating all packages
## 
for pac in ${packages[@]}; do
    echo "Deleting: $pac"
    stow -d files/ -t ~/ -D $pac
    echo "Activating: $pac"
    stow -v -d files/ -t ~/ .
done



