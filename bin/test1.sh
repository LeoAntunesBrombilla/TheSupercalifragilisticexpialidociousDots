#!/bin/bash


#recurse_dirs() { out_dir=$1; files_array=$(find . -name *".txt") && echo -e "\nout dir is: $out_dir\n"; for i in "${files_array[@]}"; do echo "$i"; done }; recurse_dirs hello

recurse_dirs() {

out_dir=$1

files_array=$(find . -name *".txt")
for file in *; do
    javac $file -d $out_dir
done
}
