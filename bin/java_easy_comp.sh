#!/bin/bash

#
#(Note: this script uses the javac compiler)
#this is an script meant to make life easier when building and executing .java programs.
#this script will do that for you to save you from doing:
#    `javac myProgram.java && java mainClass`
#
#Recomendations:
#    + give 775 permissions
#    + put it into either /usr/local/bin or /usr/bin
#    + give it a short name, like 'jcomp.sh' (Note: if the script is on /usr/local/bin it won't need the .sh extension)
#


script_help=$(cat << EOF

usage #1: $0 [-s] [java_code] [main_class]
usage #2: $0 [java_code] [main_class]
usage #3: $0 [-jc] [java_code]
Options:
	-h, --help	Show this message
	-s, --sudo	Execute the .java program with sudo
	-jc, --just-compile	Just compile .java programs and saves them
	into /out
	+".",						It indicates where the out dict is since the
	script currently does not supports recurssion. The "dot code" is:
		. = pwd
		.. = up a dir
		... = up two dirs
		.... = up three dirs
		..... = up four dirs
Example:
    #1: Compile my program 'myCode.java', save the executable it the /out dir
	that is two a dir up and execute it:
            $0 .. Main.java
	#2: --just-compile some .java files:
		$0 -jc . MyCode.java Main.java
Notes:
    #1: Tf executed with sudo (-s), user will be prompted to type
        its sudo password.
    #2: The '[java_code]' parameter should always have the .java extension
        of the file; this is what it is becuase it's needed for
        compiling.
    #3: The '[main_class]' shall only be the name of the class (ex:
        Main). This will execute the 'Main.class' file after compiling
        with success.

EOF
)

#Global vars
OUT_DICT=out

execute_classes_3() {

#echo -e ".java\t\t\t|\t\t\t.class\n"
cd $OUT_DICT
for key in "${!files_array[@]}"; do
	#echo -e "$key\t\t|\t\t${files_array[$key]}"
	if [[ "$mode" == "normal" ]]; then
		java ${files_array[$key]}
	elif [[ "$mode" == "sudo" ]]; then
		sudo java $final_executable
	fi

	case ${?} in
		0)
			:
			;;
		*)
			echo "Unknown error..."
			echo "Execute $0 --help for information about this script's usage"
			echo ""
			exit 1
			;;
	esac
done
}

arguments_check() {
checking_method=$1
code_name=$2
main_class=$3

substr_1=".java"
substr_2=".class"

if [[ $checking_method = 0 ]]; then
    if [[ "$code_name" == *"$substr_1"* ]] && [[ "$main_class" != *"$substr_2"* ]]; then
        :
        #this is for quick checking, since it's more likely the user will
        #get it right
    elif [[ "$main_class" == *"$substr_2"* ]]; then
        echo "Syntax error..."
        echo "The '[main_class]' argument can't have the .class extension"
        echo "Type $0 -h for a more indeed explanation"
        echo ""
        exit
    elif [[ "$code_name" != *"$substr_1"* ]]; then
        echo "Syntax error..."
        echo "The '[java_code]' argument should have the .java extension"
        echo "Type $0 -h for a more indeed explanation"
        echo ""
        exit
    else
        echo "Syntax error..."
        echo "Neither of the given arguments have/don't have the proper extension"
        echo "Type $0 -h for a more indeed explanation"
        echo ""
        exit
     fi
elif [[ $checking_method = 1 ]]; then
    if [[ "$code_name" == *"$substr_1" ]]; then
        :
    else
        echo "Syntax error..."
        echo "The '[java_code]' argument should have the .java extension"
        echo "Type $0 -h for a more indeed explanation"
        echo ""
        exit
    fi
else
    echo "ERROR: function 'arguments_check()' should recieve x (a number) argument as first argument,"
    echo "and it can only be either 0 or 1"
fi
}

dot_check() {

arg1=$1

case "$arg1" in
	".")
		dict=$origin
		;;
	"..")
		cd ..
		dict=`pwd`
		cd $origin
		;;
	"...")
		cd ../..
		dict=`pwd`
		cd $origin
		;;
	"....")
		cd ../../..
		dict=`pwd`
		cd $origin
		;;
	".....")
		cd ../../../..
		dict=`pwd`
		cd $origin
		;;
	*)
		:
		;;
esac
}

if [ -n "$1" ]; then
    case "$1" in
        -s|--sudo) #mn: $1 = -s
			declare -A files_array #associative array
			origin=`pwd`
			dict=$origin
            for arg in "$@"; do
                if [[ "$arg" == "."* ]]; then
					dot_check $arg
				else
 					generic_file=$arg
					generic_file_2=${generic_file##*.}
					f_class="$generic_file_2.class"
					f_java="$generic_file_2.java"
					f_full=$generic_file
					`sudo javac $f_java -d out/`
					case "${?}" in
						0)
							files_array+=([$f_class]=$f_full)
							;;
						*)
							;;
					esac
                fi
            done
			case "${?}" in
				0)
					#echo -e ".java\t\t\t|\t\t\t.class\n"
					#for key in "${!files_array[@]}"; do
					#	echo -e "$key\t\t|\t\t${files_array[$key]}"
					#done
					mode="sudo"
					execute_classes_3 $mode
					;;
				*)
					: #java displays error message :^)
			esac
            exit 0
			;;
        -jc|--just-compile) #compiles, compares, creates `out` dir and saves it there
			files_array=()
			origin=`pwd`
			dict=$origin
            for arg in "$@"; do
                if [[ "$arg" == "."* ]]; then
					dot_check $arg
                elif [[ "$arg" == "-jc" ]] || [[ "$arg" == "--just-compile" ]]; then
                    :
				else
					generic_file=$arg
					jn_file=${generic_file//".java"/""}
					f_class="$jn_file.class"
					f_java="$jn_file.java"
                    echo "Compiling → $f_java"
                    code_name=$arg
                    arguments_check 1 $f_java
					case "${?}" in
						0)
                    		#class_name=${code_name//".java"/".class"}
							#files_array+=($class_name)
                    		`javac $f_java -d out/`
							;;
						*)
							;;
					esac
                fi
            done
			case "${?}" in
				0)
					#move_class_2
					:
					;;
				*)
					: #java displays error message :^)
			esac
            exit 0
            ;;
        -h|--help)
            echo "$script_help"
			exit 0
            ;;
		*)
			declare -A files_array #associative array
			origin=`pwd`
			dict=$origin
            for arg in "$@"; do
                if [[ "$arg" == "."* ]]; then
					dot_check $arg
				else
 					generic_file=$arg
					generic_file_2=${generic_file##*.}
					f_class="$generic_file_2.class"
					f_java="$generic_file_2.java"
					f_full=$generic_file
					`javac $f_java -d out/`
					case "${?}" in
						0)
							files_array+=([$f_class]=$f_full)
							;;
						*)
							;;
					esac
                fi
            done
			case "${?}" in
				0)
					#echo -e ".java\t\t\t|\t\t\t.class\n"
					#for key in "${!files_array[@]}"; do
					#	echo -e "$key\t\t|\t\t${files_array[$key]}"
					#done
					mode="normal"
					execute_classes_3 $mode
					;;
				*)
					: #java displays error message :^)
			esac
            exit 0
			;;
    esac
    shift
else
    echo "ERROR: you must give at least two argument for this script to work"
    echo "execute $0 --help for a more indeed explanation"
    echo ""
fi

