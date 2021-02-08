#!/bin/bash

for file in *; do
    if [[ "$file" == "$0" ]]; then
        echo -e "\nfound!!\n"
    else
        continue
    fi
done
