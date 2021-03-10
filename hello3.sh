#!/bin/bash


function install_klotlin() {

    echo "installing kotlin..."
}

function install_java() {

    echo "installing java..."
}

function install_python() {

    echo "installing python..."
}

function install_nodejs() {

    echo "installing nodejs..."
}

function install_font() {

    echo "installing fonts..."
}

function install_all() {

    echo "installing every package..."
}


declare -A apps=(
    #["original_file_path"]="dotfiles_repo_copy"
    [1"Kotlin"]="install_kotlin"
    [2"Java (five & eleven)"]="install_java"
    [3"Python"]="install_python"
    [4"Node.js & NPM"]="install_nodejs"
    [5"Hack Nerd Font"]="install_font"
    [6"All!"]="install_all"
)

declare -A apps2                                 ;   declare -a orders;
apps2[0"Kotlin"]="install_klotlin"               ;   orders+=(0"Kotlin")
apps2[1"Java"]="install_java"                    ;   orders+=(1"Java")
apps2[2"Python"]="install_python"                ;   orders+=(2"Python")
apps2[3"Node.js"]="install_nodejs"               ;   orders+=(3"Node.js")
apps2[4"Font"]="install_font"                    ;   orders+=(4"Font")
apps2[5"All!"]="install_all"                     ;   orders+=(5"All!")


apps_length="${#apps[@]}"
apps2_length="${#apps2[@]}"

echo "lengh = $apps_length"

counter=0

# echo -e "\t----Menu----"
# for key in "${!apps[@]}"; do         # key = app
#     just_nums=$(echo $key | sed 's/[^0-9]*//g')
#     just_txt=$(echo $key | sed 's/[0-9]//g')

#     echo -e "\t$counter;$just_nums) $just_txt" #${apps[$key]}
#     counter=$((counter+1))
# done

# read -p "Type here: " u_input

# echo -e "\t----Menu----"
# for key in "${!apps2[@]}"; do         # key = app
#     # just_nums=$(echo $key | sed 's/[^0-9]*//g')
#     just_txt=$(echo $key | sed 's/[0-9]//g')

#     echo -e "\t$counter;$just_nums) $just_txt" #${apps[$key]}
    # counter=$((counter+1))

    # if [[ $counter = $apps_length ]]; then
    #     read -p "Type here: " u_input

    #     for key in "${!apps2[@]}"; do         # key = app
    #         just_nums=$(echo $key | sed 's/[^0-9]*//g')
    #         if [[ "$u_input" == "$just_nums" ]]

    # else
    #     continue
    # fi
# done

for key in "${!orders[@]}"; do
    just_txt=$(echo ${orders[$key]} | sed 's/[0-9]//g')
    echo -e "\t$key) $just_txt"``

    counter=$((counter+1))
    # echo "counter = $counter"

    if [[ $counter = $apps_length ]]; then
        read -p "Type here: " u_input

        counter0=0
        for key in "${!apps2[@]}"; do         # key = app

            just_nums=$(echo $key | sed 's/[^0-9]*//g')

            if [[ "$u_input" == "$just_nums" ]]; then
                cmd1="${apps2[$key]}"
                # echo -e "\ncmd1 = $cmd1"
                eval "$cmd1"
            else
                counter0=$((counter0+1))
                if [[ $counter0 == $apps2_length ]]; then
                    echo -e "'$u_input' is not an option, try again..."
                else
                    continue
                fi
            fi
        done
    else
        continue
    fi
done





