#!/bin/bash


#welcome to the source code of banner maker!
#This is the code for $0, originally name 'banner_m.sh', that stands for 'banner maker'

#----permissions----#

if [ -d "/usr/local/bin" ]; then
    BIN_PATH=/usr/local/bin
elif [ -d "/usr/bin" ]; then
    BIN_PATH=/usr/bin
else
    echo "Sorry, $0 was not able to be moved to the following directories for easy access:"
    echo "/usr/local/bin"
    echo "/usr/bin"
    echo "The script will only be excutable from the current directory: `pwd`"
fi

FILE_PATH=$0

#Please type your password when doing this step

permission_granter() {
file=$1
permission_num="775"

if [ $(stat -c "%a" "$file") == "$permission_num" ]; then
    :
else
    `sudo chmod $permission_num $file`
fi
}

permission_granter $BIN_PATH
permission_granter $0

#----rename----#
#this file will rename it self if needed to 'banner_m.sh' for standard reasons

STANDARD_NAME="banner_m.sh"
STANDARD_LOCATION=$BIN_PATH

if [ "$0" != "$STANDARD_NAME" ]; then
    if [ "$0" != "$BIN_PATH/$STANDARD_NAME" ]; then
        `mv $0 $BIN_PATH/$STANDARD_NAME`
    fi
else
    :
fi
#----personal info----#

u_name="#Name: Sebastian"
personal_i1=$(cat << EOF
#----------↓↓----------#
$u_name
#Nickname: $USER
#Gmail: sebastiancadavid5758@gmail.com
#GitHub: @$USER
#----------↓↓----------#
EOF
)

#functions

function main {

echo "The header is going to be the following:"
echo ""
echo "$personal_i1"
echo ""

if [ $u_dir == "current" ]; then
    dir="`pwd`/*$u_type"
else
    dir="$u_dir/*$u_type"
fi

for file in $dir; do
    if [ -s "$file" ]; then
        if grep -Fxq "$u_name" $file; then
            :
        else
            add_info
        fi
    else
        `echo "line 1..." > $file`
        add_info
    fi
done

echo ""
echo "The banners are on the files"
echo "Status: done"
echo ""
exit
}

function add_info {
echo "Adding banner info to: $file"
`cat $file > swp_file.txt`
`echo "$personal_i1" > $file`
`echo " " >> $file`
`cat swp_file.txt >> $file`
rm swp_file.txt
sleep 1s
}

function usage {
cat << EOF

Banner maker can be used the following ways:

usage #1: $0 [option] [parameter] [option] [parameter]
usage #2: $0
Options:
    -h, --help              Show this message.
    -d, --directory         Indicate the directory where this is gonna be executed, ex: -d $HOME
    (note: if you want this script to be executed in the current dir, just type 'current' after -d).
    -e, --extension         Specify the type of text-based file (ex: .txt .doc .py .sh .js .html). For
    easy access if -e doesn't has a parameter it will automatically choose .sh files (bash scripts).
    -a, --about             Shows information about this script.
    -p, --package-finder    Tells if the given package is installed or not in the users system

    note: if you want to change the header open this script with the text editor of your preference
    and change the information on the top of the code, under “#-----personal info-----#”. Furthermore,
    if you want to edit this script you can find it on $BIN_PATH

EOF
}

function type_error_message {
    echo ""
echo "The format: $u_type, is not a valid one!"
echo -e "Must be a text-based extension, like programming languages or docs \n(note: remember to put the '.' in front)."
echo "ex: .txt .doc .py .sh .js"
    echo ""
}

function manual_mode {
#regex (regular expressions)
type_regex='^([.]{1})([a-z]*)$'

#user interaction
# this is executed if -d [param] && -a [param] are not given
read -p "Type the directory (note: if you wanna execute this scipt within the current directorg juat type 'current': " u_dir
while [[ ! $u_type =~ $type_regex ]]; do
    read -p "Specify file type (ex: .jpg): " u_type
    if [[ $u_type =~ $type_regex ]]; then
        if [[ $u_type == ".jpg" ]] || [[ $u_type == ".mp4" ]] || [[ $u_type == ".png" ]] || [[ $u_type == ".mp3" ]]; then
            type_error_message
        else
            break
        fi
    else
        type_error_message
    fi
done

echo "processing..."
sleep 1s
main
}

function options_approver {
if [[ $directory = true && $extension = true ]]; then
    main
else
    echo "for the script to be executed with options you must:"
    echo ""
    echo "use both -d [param] and -e [param]"
    echo "ex: $0 -d $HOME -e .txt"
    exit
fi
}

function about {
cat << EOF
#----------about---------#

This is script is meant to be used for changing the header of text-based files. It
has two modes, "manual mode" and "parameter mode". Manual mode is shown after executing
$0
it asks the user for the desired folder to execute the change of the files on and
the type of file that is gonna be affected.

The second one, "Parameter mode", is used when the script it's executed with the options
-d and -e; ex:
$0 -d $HOME -e .txt
it will then procede to do the changes on the headers
of the files

EOF
}



while [ -n "$1" ]; do
    case "$1" in
        -h|--help)
            usage
            exit
            ;;
        -d|--directory)
            directory=true
            u_dir="$2"

            if [[ $# = 2 ]] || [[ $# = 1 ]]; then
                echo "for the script to be executed with options you must:"
                echo ""
                echo "use both -d [param] and -e [param]"
                echo "ex: $0 -d $HOME -e .txt"
                exit
            else
                :
            fi
            shift
            ;;
        -e|--extension)
            extension=true
            u_type="$2"

            options_approver
            shift
            ;;
        -p|--package-finder)
            pkg_1=$2

            if [ $# = 1 ]; then
                echo "To be able to use the package finder option you must include the"
                echo "name of the package after the “-x” option. ex: $0 -x vim"
            else
                `dpkg -s $pkg_1 &> /dev/null`
                if [ $? -eq 0 ]; then
                    echo ""
                    echo "package $pkg_1 is installed on your machine"
                    echo ""
                else
                    echo ""
                    echo "package $pkg_1 is not insatalled in your machine"
                    echo ""
                fi
            fi
            shift
            exit
            ;;
        -a|--about) about
            exit
            ;;
        *) echo "Parameter $1 not recognized"
            echo "Type ./$0 -h for help"
            exit
            ;;
    esac
    shift #iterate to the next parameter
done
echo ""




echo "executing script..."
sleep 1s

manual_mode


