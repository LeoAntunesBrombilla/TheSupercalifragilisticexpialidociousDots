#!/bin/bash

#
#   Info: this script can 1. generate (within a range) a series of .txt files
#   and other types of file such as .mp3 .mp4 .jpeg .jpg and afterwards
#   specifying the source link. 2. it can delte all the files of a directory
#   contaning any of the aforementiones types/format on it's name.
#
#   Implementation ideas:
#       + This script can be used for testing the capacity and file transmission
#       speed of drives.
#           Case: Lately there has been in production fake $20 dollars 1T USBs.
#           This script can be used for testing the capacity and file transmission
#           of those devices.
#       + Creating test subjects
#           Case: If you are testing code that interacts with files and does something with
#           them (ex: bash script that copy and paste files), this will be useful for generating 
#           those "test subjects" to execute the program on.
#

#--funcs--#
usage() {
cat << EOF

usage #1: $0 [option] [parameter] [option] [parameter] [parameter]
usage #2: $0 [option] [option] [parameter]
Options:
    -h, --help              Show this message.
    -a, --amount            Specify how many files are gonna be created.
    -d, --delete            Delete all the files of an specific type in the current directory
                            (valid types: .txt .mp4 .mp3 .jpg .jpeg).
    -t, --type              Specify the type/format of the file/s
                            (valid types: .txt .mp4 .mp3 .jpg .jpeg).
    -i, --info              Show information about the script and its implementations.

Examples:
    usage #1 ex:    "this will download the video 10 times in the current directory"
        $0 -a 10 -t .mp4 https://www.youtube.com/watch?v=jNQXAC9IVRw
    usage #2 ex:    "this will delete all the .txt files in the current directory"
        $0 -d -t .txt

    Note: if you wanna execute this script on a external device such as a USB or
    a Hard Drive you should first do "cd /media", there you will find all the
    external devices (since media is located in the root folder you also need
    root permission to go there).

EOF
}

info() {
cat << EOF
#
#   Info: this script can:
#       1. Generate (within a range) a series of .txt files
#       and other types of file such as .mp3 .mp4 .jpeg .jpg and afterwards
#       specifying the source link.
#       2. It can delte all the files of a directory
#       contaning any of the aforementiones types/format on it's name.
#
#   Implementation ideas:
#       + This script can be used for testing the capacity and file transmission
#       speed of drives.
#           Case: Lately there has been in production fake 20 dollars 1T USBs.
#           This script can be used for testing the capacity and file transmission
#           of those devices.
#       + Creating test subjects
#           Case: If you are testing code that interacts with files and does something with
#           them (ex: bash script that copy and paste files), this will be useful for generating 
#           those "test subjects" to execute the program on.
#
EOF
}

txt_creator() {
echo ""
echo "This script will delete every .txt file in the current directory,"
echo "are your sure you want to continue?"
echo ""
read -t 8 -n 1 -s -r -p $'Press any key to continue...\n'
echo ""
echo "creating all the .txt files..."
for i in $(seq 1 $num); do
    echo -e "Execution started: `date`\t   →\tCreating $u_type as t$i.txt..."
    start=`date +%s`
    if [ -f "t$i.txt" ]; then
        `rm "t$i.txt"`
        `echo "$message" > t$i.txt`
    else
        `echo "$message" > t$i.txt`
    fi
    end=`date +%s`
    runtime=$((end-start))
    echo -e "Execution ended: `date`\t   →\tRuntime: $runtime\tSize and file: `du -sh "t$i.txt"`"
    echo "---------------↓↓---------------"
    i=$((i+=1))
    sleep 0.1
done
echo ""
echo "status: done"
echo "summary: files with '$u_type' created successfully"
echo ""
exit
}

url_creator() {
echo ""
read -t 8 -n 1 -s -r -p $'Press any key to continue...\n'
echo ""
echo "downloading $u_type files..."
echo ""

if [ "$u_type" == ".mp4" ]; then
    for i in $(seq 1 $num); do
        echo -e "Execution started: `date`\t   →\tDownloading $u_type as video_$i.mp4..."
        start=`date +%s`
        `wget -O video_$i.mp4 $u_url > /dev/null 2>&1`
        end=`date +%s`
        runtime=$((end-start))
        echo -e "Execution ended: `date`\t   →\tRuntime: $runtime\tSize and file: `du -sh "video_$i.mp4"`"
        echo "---------------↓↓---------------"
        i=$((i+=1))
        sleep 0.1
    done
    echo ""
    echo "status: done"
    echo "summary: files with '$u_type' created successfully"
    echo ""
    exit
elif [ "$u_type" == ".jpg" ] || [ "$u_type" == ".jpeg" ]; then
    for i in $(seq 1 $num); do
        echo -e "Execution started: `date`\t   →\tDownloading $u_type as image_$i.jpeg..."
        start=`date +%s`
        `wget -O image_$i.jpeg $u_url > /dev/null 2>&1`
        end=`date +%s`
        runtime=$((end-start))
        echo -e "Execution ended: `date`\t   →\tRuntime: $runtime\tSize and file: `du -sh "image_$i.jpeg"`"
        i=$((i+=1))
        echo "---------------↓↓---------------"
        sleep 0.1
    done
    echo ""
    echo "status: done"
    echo "summary: files with '$u_type' created successfully"
    echo ""
    exit
elif [ "$u_type" == ".mp3" ]; then
    for i in $(seq 1 $num); do
        echo -e "Execution started: `date`\t   →\tDownloading $u_type as audio_$i.mp3..."
        start=`date +%s`
        echo "downloading $u_type file as audio_$i.mp3..."
        `wget -O audio_$i.mp3 $u_url > /dev/null 2>&1`
        end=`date +%s`
        runtime=$((end-start))
        echo -e "Execution ended: `date`\t   →\tRuntime: $runtime\tSize and file: `du -sh "audio_$i.mp3"`"
        i=$((i+=1))
        echo "---------------↓↓---------------"
        sleep 0.1
    done
    echo ""
    echo "status: done"
    echo "summary: files with '$u_type' created successfully"
    echo ""
    exit
fi
}

file_create_main() {
    if [ "$u_type" == ".txt" ]; then
        txt_creator
    elif [ "$u_type" == ".mp4" ] || [ "$u_type" == ".jpg" ] || [ "$u_type" == ".jpeg" ] || [ "$u_type" == ".mp3" ]; then
        url_creator
    else
        echo "Sorry, the type/format $u_type is not valid."
        echo "The allowed format are the following:"
        echo ".txt .mp4 .mp3 .jpg .jpeg"
        echo "note: after putting the type/format copy and paste the url!"
        echo "(ex: -t .mp4 https://www.youtube.com/watch?v=jNQXAC9IVRw)"
        echo ""
        exit
    fi
}

deleter() {
numbers=$1
extension=$2
echo "deleting all $extension files..."
echo ""

if [ "$(ls -A `pwd`)" ]; then
    for file in *; do
        if [[ ${file: $numbers} == "$extension" ]]; then
            echo -e "Execution started: `date`\t   →\tDeleting $file..."
            start=`date +%s`
            `rm $file`
            end=`date +%s`
            runtime=$((end-start))
            echo -e "Execution ended: `date`\t   →\tRuntime: $runtime"
            echo "---------------↓↓---------------"
            #echo ""
            sleep 0.1
        else
            :
        fi
    done
else
    echo ""
    echo "ERROR: current directory '`pwd`' is empty"
    echo ""
    exit
fi
echo ""
echo "status: done"
echo "files with '$extension' where deleted"
echo ""
exit
}

file_delete_main() {
echo ""
echo "WARNING: the -d option is for deleting all the $u_type files in the current directory"
echo "are you sure you want to delete them all?"
read -t 8 -n 1 -s -r -p $'Press any key to continue...\n'
echo ""
#[ "$(ls -A `pwd`)" ] && echo "Not Empty" || echo "Empty"
if [ "$(ls -A `pwd`)" ]; then
    if [ "$u_type" == ".txt" ]; then
        deleter -4 .txt
    elif [ "$u_type" == ".mp4" ]; then
        deleter -4 .mp4
    elif [ "$u_type" == ".jpg" ]; then
        deleter -4 .jpg
    elif [ "$u_type" == ".jpeg" ]; then
        deleter -5 .jpeg
    elif [ "$u_type" == ".mp3" ]; then
        deleter -4 .mp3
    else
        echo "Sorry, the type/format '$u_type' is not valid."
        echo "The allowed format are the following:"
        echo ".txt .mp4 .mp3 .jpg .jpeg"
        echo ""
        exit
    fi
else
    echo ""
    echo "ERROR: current directory '`pwd`' is empty,"
    echo "therefore there are no files to be deleted"
    echo ""
    exit
fi
}

options_approver_1() {
if [[ $amount_ = true && $type_ = true ]]; then
    file_create_main
else
    echo "For this script to be executed you must"
    echo "use both -a [integer] and -t [type]"
    echo "(ex: bash $0 -a 10 -t .txt)"
    echo ""
    exit
fi
}

options_approver_2() {
if [[ $deleteee_ = true ]] && [[ $type_ = true ]]; then
    file_delete_main
else
    echo "To use the -d option you must use afterwards"
    echo "the option -t [parameter] so to specify which type"
    echo "of files you want to delete"
    echo ""
    exit
fi
}

message=$(cat << EOF
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae pretium lorem, pellentesque pretium lorem. Aliquam erat
volutpat. In sollicitudin eu enim eget euismod. In hac habitasse platea dictumst. Pellentesque laoreet sem eu porta rhoncus.
Vestibulum id iaculis nulla. Sed neque lectus, pulvinar et velit eget, aliquet egestas libero. Morbi turpis leo, blandit vitae
mauris id, egestas placerat tortor.

Morbi sit amet luctus mi. Curabitur hendrerit nibh vitae sapien pulvinar auctor ut a eros. Integer dapibus ultrices bibendum.
Aenean consectetur mi a posuere interdum. Praesent molestie risus dolor, non pretium augue pellentesque in. Phasellus vel
interdum eros. Vivamus cursus nibh nisi, quis volutpat arcu euismod a. Praesent vitae tortor ante. Curabitur sed varius turpis.
In molestie, velit nec congue finibus, enim tellus placerat tortor, id vulputate ante dui nec nibh. Nulla ligula purus,
dignissim nec efficitur vitae, pellentesque at erat. Vestibulum ac nisl vestibulum mauris blandit sollicitudin vitae quis ante.
Aenean dapibus diam non suscipit sagittis. Curabitur sed aliquet diam. Fusce pretium ut nunc non semper. Vivamus a nunc vulputate,
tincidunt libero non, aliquet massa.

Cras porttitor, magna eu tristique tincidunt, felis quam porta magna, non vestibulum sem urna id libero. Maecenas non iaculis
quam, sed faucibus diam. Nunc et fermentum diam. Nulla aliquet elementum faucibus. In quis tincidunt lacus, ac imperdiet elit.
Ut libero lorem, fermentum ac mi nec, condimentum suscipit augue. Nunc eget tincidunt libero.

Integer odio enim, euismod vitae velit sed, auctor bibendum ex. Integer massa neque, tempor non turpis ac, vehicula tristique
quam. Cras eget ornare augue. Pellentesque nec nulla est. Duis in eros ut massa interdum euismod eu eget nisi. Fusce convallis
eros quis ipsum venenatis, vitae molestie ipsum egestas. Aliquam at ultricies justo. Nunc eget ultricies sem, nec convallis dui.
Cras sollicitudin arcu quis magna auctor, ut tincidunt ex blandit. Vestibulum ante ipsum primis in faucibus orci luctus et
ultrices posuere cubilia curae; Ut sagittis orci a congue congue. Nunc dignissim iaculis felis a mollis.

Suspendisse ullamcorper in sem quis sagittis. Nulla facilisi. Donec sit amet lobortis augue. Integer at sagittis felis, ac
placerat risus. Donec auctor, quam sit amet sodales venenatis, tellus massa sagittis purus, vitae sollicitudin leo turpis ac
quam. Vivamus quam lorem, iaculis in ante eget, gravida vulputate lorem. Integer nisl risus, porta id pretium sed, posuere vel
est. In nec accumsan augue. Nunc eu eleifend justo. Aenean non hendrerit dui. Nam eget sem felis. Fusce sit amet lorem ac lectus
feugiat sollicitudin. Suspendisse molestie sagittis nunc. Vestibulum ut interdum orci, eget interdum magna. Fusce at cursus urna.
Mauris bibendum ligula sagittis, dignissim ex a, vehicula eros.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia velit ac purus tempor, eu pharetra elit posuere. In
lobortis tempus elit, quis egestas risus feugiat pharetra. Cras lacinia vehicula nisl non hendrerit. Morbi sollicitudin, nisl non
mollis tincidunt, ex erat fringilla ex, sed posuere tortor arcu non orci. Suspendisse vulputate mi et nibh sagittis suscipit.
Morbi interdum nisl ac massa tristique, eget vestibulum tortor hendrerit. Donec eu sem eget metus vulputate ullamcorper. Donec
congue, neque et consectetur semper, ipsum orci eleifend tortor, a volutpat lorem nisi ac erat. Donec dictum nibh ac velit convall
is aliquet.

Aliquam nulla mi, lacinia et fermentum ut, facilisis sit amet nisi. Nulla sagittis augue in enim placerat, quis gravida metus
auctor. Vestibulum eleifend imperdiet mi vel convallis. Ut ornare sapien massa, non lobortis libero iaculis eu. Nulla semper,
lorem non posuere tincidunt, ex tellus accumsan arcu, eu condimentum erat nisl vitae velit. Integer convallis, arcu eget mollis
malesuada, sapien justo luctus sapien, sed luctus neque lectus et ante. Curabitur maximus, sem eget blandit volutpat, metus
sapien elementum nibh, ac mattis enim justo quis lorem. Nullam nec ligula sollicitudin, interdum turpis sit amet, sollicitudin
orci. Donec quis nunc quis dolor ullamcorper ultricies a id eros. Donec eget leo non odio maximus vehicula pretium id massa.
Sed nec velit vitae est faucibus commodo. Maecenas rutrum ante ut massa tincidunt porttitor. Integer sed commodo sem, vitae
laoreet elit. Maecenas faucibus facilisis orci, quis maximus leo consequat a.

Pellentesque congue ligula ante. Nunc iaculis magna id malesuada tempor. Praesent in ante velit. Aenean odio tortor, placerat
vitae pretium at, finibus vel odio. Etiam facilisis tellus eget tempus vehicula. Donec eget eros condimentum, euismod tortor at,
egestas nibh. Phasellus pulvinar dolor erat. Donec pharetra dui sem, vitae egestas odio ullamcorper vitae. Nullam finibus velit
in quam pellentesque hendrerit. Morbi ut nunc feugiat, porttitor libero sed, elementum dolor. Nunc eleifend libero eu ipsum
sollicitudin, eget efficitur metus vestibulum. Aenean non arcu consectetur, sagittis justo in, imperdiet ante. Duis id feugiat
justo. Donec interdum purus id tellus mollis, semper ullamcorper magna vulputate. Maecenas ac nibh metus. Quisque id magna nec
augue ultrices consequat nec eget nulla.

Nulla erat lorem, sodales vitae volutpat quis, vulputate id purus. Sed tempus feugiat fringilla. Vivamus et bibendum elit.
Suspendisse potenti. Pellentesque sollicitudin aliquam fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Vivamus non tincidunt felis.

Mauris scelerisque porta diam vitae imperdiet. Cras tempor sem quis nibh suscipit sodales. Etiam eget consectetur elit.
Etiam auctor eros quam, sed feugiat diam sagittis et. Praesent at nibh rutrum, venenatis quam ut, posuere massa. Orci varius
natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In hac habitasse platea dictumst. Integer vitae
dapibus erat. Integer interdum nisi eu nunc posuere imperdiet. Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Ut sed consequat ex. Nam pulvinar orci nibh, in scelerisque nisl feugiat vitae. Sed ut magna
lectus. Mauris aliquet, justo ut volutpat commodo, urna est placerat turpis, tempor efficitur metus elit bibendum erat. Ut
ultrices, augue maximus pellentesque posuere, est elit congue enim, ac posuere nisl diam eget mi. Morbi eu nisi congue, bibendum
arcu vel, posuere velit.
EOF
)

type_main() {
type_=true
u_type=$1
u_url=$2
}

total_args=$#
while [ -n "$1" ]; do
    case "$1" in
        -a|--amount)
            amount_=true
            num_regex='^([1-9]|[1-9][0-9])$'
            num=$2

            if [ -n "$2" ]; then
                if [[ $num =~ $num_regex ]]; then
                    if [[ $total_args = 2 ]] || [[ $total_args = 1 ]]; then
                        echo ""
                        echo "For using the -a option you must do:"
                        echo "1. $0 -a [integer] -t [type] [link]"
                        echo "2. $0 -a [Integer] -t [type]"
                        echo "(note: type $0 -h for help)"
                        echo ""
                        exit
                    else
                        :
                    fi
                else
                    echo "The input '$num' is not a valid one"
                    echo "please type an integer after the -a"
                    echo "(ex: $0 -d 10)"
                    echo "Type $0 -h for help"
                    echo ""
                    exit
                fi
            else
                echo ""
                echo "For using the -a option you must do:"
                echo "1. $0 -a [integer] -t [type] [link]"
                echo "2. $0 -a [Integer] -t [type]"
                echo "(note: type $0 -h for help)"
                echo ""
                exit
            fi
            shift
            ;;
        -t|--type)
            type_main $2 $3
            #type_=true
            #u_type=$2
            #u_url=$3

            if [ -z "$1" ]; then
                echo "sorry, you must specify the file format"
                echo "currently the valid formats are:"
                echo ".txt .mp4 .mp3 .jpg .jpeg"
                echo ""
                echo "remember that if you want to specify a file type"
                echo "use -t [format], but if you want to specify a url"
                echo "as well, use -t [format] [url]"
                exit
                :
            elif [ $total_args == 3 ]; then
                for var in "$@"; do
                    if [[ "$var" == "-d" ]]; then
                        deleteee_=true
                        options_approver_2
                        break
                    fi
                done
            elif [ $total_args == 4 ] || [ $total_args == 5 ]; then
                options_approver_1
            else
                echo "Sorry, you can't give use the -t option on it's own."
                echo "Type for help $0 -h"
                echo "or"
                echo "Type $0 --help"
                echo ""
                exit
            fi
            shift
            ;;
        -d|--delete)
            deleteee_=true

            if [ $total_args == 1 ]; then
                echo "You can't use the -d option on its own."
                echo "Type for help $0 -h"
                echo "or"
                echo "Type $0 --help"
                echo ""
                exit
            else
                :
            fi

            for var in "$@"; do
                if [[ "$var" == "-t" ]]; then
                    if [[ $total_args > 3 ]] || [[ $total_args < 3 ]]; then
                        echo ""
                        echo "while using the -d option you can't give"
                        echo "more or less than 3 parameters"
                        echo ""
                        echo "type: $0 --help for help"
                        echo ""
                        exit
                    else
                        type_main $3
                        options_approver_2
                        break
                    fi
                fi
            done
            shift
            ;;
        -h|--help)
            usage
            exit
            ;;
        -i|--info)
            info
            exit
            ;;
        *)
            echo "Command $1 not recognized"
            echo "Type $0 -h for help"
            echo ""
            exit
            ;;
    esac
    shift
done

echo ""
echo "Sorry, this script can't be executed on it's own."
echo "Please type for help:"
echo "$0 -h"
echo "or"
echo "$0 --help"
echo ""

