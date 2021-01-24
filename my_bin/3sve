#!/bin/bash

#`kotlinc $1 -d .`

files_array=$(find . -type f -name "*.kt") #find all files with the .kt (kotlin) extension
test_array=()

for j in "${files_array[@]}"; do #this is because files on $files_array can't be accessed one by one
    test_array+=($j)
done

echo -e "\n\t--------Files--------\n"
#note: the emoji is for orientating the user in case the error output is huge
for file in "${test_array[@]}"; do
    echo -e "🍉 compiling:\t$file"; `kotlinc $file`
done

