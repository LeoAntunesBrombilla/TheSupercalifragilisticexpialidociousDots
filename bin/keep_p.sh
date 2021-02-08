#!/bin/bash

#-------constants----------#
#this vars are for the options_checker()
arg_1=$1
arg_2=$2
ammount_args=$#
total=1
csv_args=$@

#file to be tested
test_file=.keep
#test_file=${test_file_1// /"\ "}

#for recursive_mode()
main_dict=`pwd`
dicts_array=()
#-------constants----------#

usage() {
cat << EOF

usage #1: $0 [option]
Options:
    -h, --help              Show this message.
    -n, --normal-mode       For every directory in pwd=`pwd` check if a .keep exists,
                            if not create it, else go to the next directory in the pwd
    -r, --recursive-mode    Do the same as -n (--normal-mode) but recursively
    -i, --info              Show information about the script and its implementations.

    Note: this script should take onle one argument (-n || -r)

EOF
}

normal_mode() {
for file in *; do
    original_file=$file
    modified_file=${file// /"\ "}
    test_keep_empty $original_file $modified_file
done
}

recursive_mode() {
for file in *; do
    original_file=$file
    modified_file=${file// /"\ "}

    echo "pwd: `pwd`"
    substr='\'
    if [[ "$modified_file" == *"$substr"* ]]; then              #$1 = original_file     $2 = modified_file
        if [ -d "`pwd`/$original_file" ]; then
            dicts_array+=($original_file)
            eval cd $modified_file
            echo "pwd: `pwd`"
            echo "method #1"
            echo "→→→"
            if [[ `ls -1 | wc -l` -ne 0 ]]; then #not empty
                j_current_dict="${PWD##*/}"     #just current working directory
                test_keep_not_empty $j_current_dict
                recursive_mode
            else #empty
                test_keep_not_empty $original_file $modified_file
                cd ..
            fi
        else
            echo -e "Name:\t→\t$modified_file"
            echo "is not a directory"
            echo "-------------------------------"
            echo ""
            sleep 0.1
        fi
    else
        if [ -d "$original_file" ]; then
            dicts_array+=($original_file)
            eval cd $original_file
            echo "pwd: `pwd`"
            echo "method #2"
            echo "→→→"
            if [[ `ls -1 | wc -l` -ne 0 ]]; then #not empty
                j_current_dict="${PWD##*/}"     #just current working directory
                test_keep_not_empty $j_current_dict
                recursive_mode
            else #empty
                cd ..
                test_keep_empty $original_file
            fi
        else
            echo -e "Name:\t→\t$original_file"
            echo "is not a directory"
            echo "-------------------------------"
            echo ""
            sleep 0.1
        fi
    fi
done
}

test_keep_empty() {
echo "original_file = $original_file"
echo "modified_file = $modified_file"
echo ""

substr='\'
if [[ "$modified_file" == *"$substr"* ]]; then              #$1 = original_file     $2 = modified_file
    if [ -d "`pwd`/$original_file" ]; then
        dicts_array+=($original_file)
        eval cd $modified_file
        if [ -f "$test_file" ]; then
            echo -e "Name:\t→\t$original_file"
            echo "file $modified_file/.keep already exists"
            echo "-------------------------------"
            echo ""
            cd ..
            sleep 0.1
        else
            `touch $test_file`
            echo -e "Name:\t→\t$original_file"
            echo "file $modified_file/.keep created"
            echo "-------------------------------"
            echo ""
            cd ..
            sleep 0.1
        fi
    else
        echo -e "Name:\t→\t$original_file"
        echo "is not a directory"
        echo "-------------------------------"
        echo ""
        cd ..
        sleep 0.1
    fi
else
    if [ -d "$original_file" ]; then
        dicts_array+=($original_file)
        if [ -f "$original_file/$test_file" ]; then
            echo -e "Name:\t→\t$1"
            echo "file $original_file/.keep already exists"
            echo "-------------------------------"
            echo ""
            sleep 0.1
        else
            `touch $original_file/$test_file`
            echo -e "Name:\t→\t$original_file"
            echo "file $original_file/.keep created"
            echo "-------------------------------"
            echo ""
            sleep 0.1
        fi
    else
        echo -e "Name:\t→\t$original_file"
        echo "is not a directory"
        echo "-------------------------------"
        echo ""
        sleep 0.1
    fi
fi
}

test_keep_not_empty() {
if [ -f ".$test_file" ]; then
    echo -e "Name:\t→\t$1"
    echo "file $1/.keep already exists"
    echo "-------------------------------"
    echo ""
    sleep 0.1
else
    `touch $test_file`
    echo -e "Name:\t→\t$1"
    echo "file $1/.keep created"
    echo "-------------------------------"
    echo ""
    sleep 0.1
fi
}


#okay sebas from the future, your current solution was: create vars for $@, $#, arg1 & arg2
#afterwards you where able to use = for value comparison, and then [[ "arg_1" == "-n" ]] for lexical comparison

options_checker() {
echo "options sent= $ammount_args"
echo ""
if [[ $ammount_args = 1 ]]; then
    if [[ "$arg_1" == "-n" ]] || [[ "$arg_1" == "--normal-mode" ]]; then
        echo "option: $arg_1"
        echo ""
        normal_mode
        echo ""
        for dict in "${dicts_array[*]}"; do
            echo "Directories reviewed: $dict"; done
        exit
    elif [[ "$arg_1" == "-r" ]] || [[ "$arg_1" == "--recursive-mode" ]]; then
        echo "option: $arg_1"
        echo ""
        recursive_mode
        echo ""
        for dict in "${dicts_array[*]}"; do
            echo "Directories reviewed: $dict"; done
        exit
    else
        echo "option: $arg_1"
        echo "not recognized, type $0 -h for help"
        echo ""
        exit
    fi
else
    echo "ERROR: there was more than one option sent"
    echo "program will only run with one argument"
    echo ""
    exit
fi
}

#main() {
while [ -n "$1" ]; do
    case "$1" in
        -n|"--normal-mode")
            normal_=true
            echo -e "mode:\t→\t'normal'"
            sleep 1s
            echo ""
            options_checker
            ;;
        -r|"--recursive-mode")
            recursive_=true
            echo -e "mode:\t→\t'recursive'"
            sleep 1s
            echo ""
            options_checker
            ;;
        -h|--help)
            usage
            exit
            ;;
        *)
            echo "Command $1 not recognized"
            echo "Type $0 for help"
            echo ""
            exit
            ;;
    esac
    shift
done
#}


