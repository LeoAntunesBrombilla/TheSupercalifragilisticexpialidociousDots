#!/bin/bash

temp_dir='/tmp/2sve_tmp'
temp_list='/tmp/2sve_tmp/compiled_files_list.json'
temp_temp_list='/tmp/2sve_tmp/compiled_files_list_temp.json'

if [[ -d "$temp_dir" ]]; then
    if [[ -f "$temp_list" ]]; then
        :
    else
        `touch $temp_list`
    fi
else
    `mkdir $temp_dir`

    if [[ -f "$temp_list" && -f "$temp_temp_list" ]]; then
        :
    else
        `touch $temp_list`
    fi
fi
