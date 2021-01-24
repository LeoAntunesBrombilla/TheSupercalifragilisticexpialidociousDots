#!/bin/bash
echo "###START###"
sleep 1s
for filename in *; do
    if [ $(stat -c "%a" "$filename") == "755" ]; then
        echo "Files with 755 permission: $filename"
    else
        echo "File that does not has 755 permission: $filename"
    fi
done
echo "###DONE###"
