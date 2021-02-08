#!/bin/bash

to_find=$1
config_file="/tmp/test/current_sessions.txt"
sessions="/tmp/test/sessions/"
lines_file=`wc -l $config_file | awk '{ print $1 }'`
c_line=1
for_jsons=$( cat << EOF
{
  "test_key": "test_val"
}
EOF
)

create_dirs() {

in_dir=$1
compiled_list="${in_dir}compiled_list.json"
compiled_tmp_list="${in_dir}compiled_tmp_list.json"
touch $compiled_list $compiled_tmp_list
echo "$for_jsons" > $compiled_list

}

if [[ $lines_file == 0 ]]; then
    new_file="${sessions}session1/"
    mkdir $new_file

    # append to file
    echo "$to_find" >> $config_file
    create_dirs $new_file
else
    while read -r line; do
        # echo "Line No. $n : $line"
        echo "current line = $c_line\ttotal lines = $lines_file"
        if [[ "$line" == "$to_find" ]]; then
            echo -e "found!; the line number is $c_line"
            compiled_list="${sessions}session$c_line/compiled_list.json"
            compiled_tmp_list="${sessions}session$c_line/compiled_tmp_list.json"
            echo -e "\ncompiled list = $compiled_list\ncompiled list tmp = $compiled_tmp_list"
            break
        else
            if [[ $c_line == $lines_file ]]; then
                # echo "recursion limit reached"; break
                new_file="${sessions}session$((lines_file+1))/"
                mkdir $new_file

                # append to file
                echo "$to_find" >> $config_file
                create_dirs $new_file
                break
            else
                c_line=$((c_line+1))
            fi
        fi
    done < $config_file
fi
