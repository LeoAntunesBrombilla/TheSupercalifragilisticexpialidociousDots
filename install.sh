#!/bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
HOME_DOTS="$PARENT_PATH/home_dots/"
DOT_CONFIG="$PARENT_PATH/.config/"
USER_CONFIG="$HOME/.config/"
RESOURCES="$PARENT_PATH/resources/"
PKGS="$PARENT_PATH/pkgs/"
THIS=$(basename "$0")
PFX="~~~~~~~~~~~~ "
BANNER="----------------------------↓↓--------------------------------"
__default_verbosity=0


SCRIPT_HELP=$(
    cat <<EOF

This script helps the user to install NeoVim-Delightful, my personal configuration for
NeoVim.

Usages:
	#0: ${THIS} [arg(s)]
Arguments:
	-h,--help,-?,?				See this help message.
EOF
)

declare -A programs=(
    ["nvim"]="install_nvim"
    ["kitty"]="install_kitty"				# ready
    ["neofetch"]="install_neofetch"			# ready
    ["rofi"]="install_rofi"
    ["awesome"]="install_awesome"
    ["alacritty"]="install_alacritty"
    ["cava"]="install_cava"
)

declare -A dots=(

	# origin = destinantion
    ["${HOME_DOTS}.gitconfig"]="${HOME}/.gitconfig"
    ["${HOME_DOTS}.inputrc"]="${HOME}/.inputrc"
    ["${HOME_DOTS}.profile"]="${HOME}/.profile"
    ["${HOME_DOTS}.ideavimrc"]="${HOME}/.ideavimrc"
	["${HOME_DOTS}.vimrc"]="${HOME}/.vimrc"
	["${HOME_DOTS}.shell_aliases"]="${HOME}/.shell_aliases"
	["$HOME_DOTS.bashrc"]="$HOME/.bashrc"
	["${HOME_DOTS}.zshrc"]="${HOME}/.zshrc"
	["${HOME_DOTS}xresources"]="${HOME}/xresources"
	["${HOME_DOTS}.tmux.conf"]="${HOME}/.tmux.conf"
)

# supported_distros=("arch" "fedora" "ubuntu")

declare -A supported_distros=(
    ["arch"]="install_arch"
    ["fedora"]="install_fedora"
    ["ubuntu"]="install_ubuntu"
    ["all"]="install_all"
)



function complex_heading() {
    prompt -w "${BANNER}"
    echo -e "\t$(prompt -i "${1}")"
    prompt -w "${BANNER}"
}

function simple_heading() {
    echo -e "\n\n${PFX} ${1}"
}

function __init_colors() {
    CDEF=" \033[0m"      # default color
    CCIN=" \033[0;36m"   # info color
    CGSC=" \033[0;32m"   # success color
    CRER=" \033[0;31m"   # error color
    CWAR=" \033[0;33m"   # waring color
    b_CDEF=" \033[1;37m" # bold default color
    b_CCIN=" \033[1;36m" # bold info color
    b_CGSC=" \033[1;32m" # bold success color
    b_CRER=" \033[1;31m" # bold error color
    b_CWAR=" \033[1;33m" # bold warning color
}

function __verbose_message() {
    if [[ ! $__default_verbosity = 0 ]]; then
        tput bold
        echo -e "~~> ${1}"
        tput sgr0
    fi
}

function prompt() {
    case ${1} in
    "-s" | "--success")
        echo -e "${b_CGSC}${@/-s/}${CDEF}"
        ;; # print success message
    "-e" | "--error")
        echo -e "${b_CRER}${@/-e/}${CDEF}"
        ;; # print error message
    "-w" | "--warning")
        echo -e "${b_CWAR}${@/-w/}${CDEF}"
        ;; # print warning message
    "-i" | "--info")
        echo -e "${b_CCIN}${@/-i/}${CDEF}"
        ;; # print info message
    *)
        echo -e "$@"
        ;;
    esac
}

function has_command() {
    command -v $1 >/dev/null
}

function crt_symlink() {
	
	origin=$1
	destination=$2

	ln -s ${origin} ${destination}

}

function link_dots() {
    for dot in "${!dots[@]}"; do

		# dot = origin
		# ${dots[$dot]} = destinantion

		prompt -i "INFO: Checking if the file ${dots[$dot]} already exists...."
		if [[ -f "${dots[$dot]}" ]]; then
			prompt -w "WARNING: The file ${dots[$dot]} already exists, removing it to proceed..."
			rm ${dots[$dot]}
		else
			prompt -s "OKAY: The file ${dots[$dot]} does not exist, proceeding..."
		fi

		prompt -i "INFO: Creating symlink..."
		crt_symlink $dot ${dots[$dot]}
		echo
    done
}

function assert_file_existence () {
	if [[ -e "$1" ]]; then
		return 0
	fi

	return 1
}

function install_nvim() {

	complex_heading "Installing NeoVim config..."
	nvim_original_path="${DOT_CONFIG}nvim"
	nvim_destination_path="${USER_CONFIG}nvim"

	prompt -i "INFO: Checking if there is any other nvim config..."

	if (assert_file_existence $nvim_destination_path); then
		prompt -w "WARNING: Another config was found. Creating a backup..."
		# mkdir -p /tmp/nvim_backups
		# mv $nvim_destination_path /tmp/nvim_backups
		prompt -s "OKAY: Previous config was backed up and can be found at '/tmp/nvim_backups'"
	else
		prompt -s "OKAY: No other config was found. Proceeding..."
	fi

	prompt -i "INFO: Creating symlink to config..."
	# crt_symlink $nvim_original_path $nvim_destination_path
	echo

	prompt -i "INFO: Checking for previous efm-langserver configs..."

	if (assert_file_existence "${USER_CONFIG}efm-langserver"); then
		prompt -w "WARNING: Another efm-langserver config was found. Deleting it..."
		# if [[ -L "${USER_CONFIG}efm-langserver" ]]; then
		# 	rm ${USER_CONFIG}efm-langserver
		# fi
		prompt -s "OKAY: Previous config was backed up and can be found at '/tmp/efm_langserver_backup'"
	else
		prompt -s "OKAY: No other config was found. Proceeding..."
	fi

	prompt -i "INFO: Creating symlink to efm-langserver config..."
	# crt_symlink ${nvim_original_path}/external_configs/efm-langserver ${USER_CONFIG}efm-langserver
	echo




	prompt -i "INFO: Checking for previous global prettierrc config..."

	if (assert_file_existence "${HOME}/.prettierrc.json"); then
		prompt -w "WARNING: Another .prettierrc.json config was found. Creating a backup..."
		cp ${HOME}/.prettierrc.json /tmp/
		rm ${HOME}/.prettierrc.json
		prompt -s "OKAY: Previous config was backed up and can be found at '/tmp'"
	else
		prompt -s "OKAY: No other config was found. Proceeding..."
	fi

	prompt -i "INFO: Creating symlink to .prettierrc.json config..."
	crt_symlink ${nvim_original_path}/external_configs/prettier/.prettierrc.json ${HOME}/.prettierrc.json
	echo

	prompt -i "INFO: Checking it packer is already installed..."

	if [[ -d "$HOME/.local/share/nvim/site/pack/packer" ]]; then
		prompt -s "OKAY: Packer is already installed"
	else
		prompt -w "WARNING: Packer is not installed, installing it..."
		git clone https://github.com/wbthomason/packer.nvim\
		 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	fi

	prompt -i "INFO: Installing extra programs (formatters and linters)..."
	# pip3 install --user flake8
	# pip3 install --user yapf
	# npm install -g prettier

}


function install_kitty() {
	
	complex_heading "Installing Kitty config..."
	kitty_original_path="${DOT_CONFIG}kitty"
	kitty_destination_path="${USER_CONFIG}kitty"
	kitty_backup_path="/tmp/kitty_backup"

	prompt -i "INFO: Checking if there is any other Kitty config..."
	if (assert_file_existence $kitty_destination_path); then
		prompt -w "WARNING: Another Kitty config was found. Creating a backup..."
		cp -r $kitty_destination_path $kitty_backup_path
		if [[ -L "${kitty_destination_path}" ]]; then
			# echo "it is a symlink"
			rm $kitty_destination_path
		fi
		prompt -s "OKAY: Previous config was backed up and can be found at '$kitty_backup_path'"
	else
		prompt -s "OKAY: No other config was found. Proceeding..."
	fi

	prompt -i "INFO: Creating symlink to kitty config..."
	crt_symlink $kitty_original_path $kitty_destination_path
}

function install_neofetch() {
	complex_heading "Installing Neofetch config..."
	neofetch_original_path="${DOT_CONFIG}neofetch"
	neofetch_destination_path="${USER_CONFIG}neofetch"
	neofetch_backup_path="/tmp/neofetch_backup"

	prompt -i "INFO: Checking if there is any other Neofetch config..."
	if (assert_file_existence $neofetch_destination_path); then
		prompt -w "WARNING: Another Neofetch config was found. Creating a backup..."
		cp -r $neofetch_destination_path $neofetch_backup_path
		if [[ -L "${neofetch_destination_path}" ]]; then
			rm $neofetch_destination_path
		elif [[ -d "${neofetch_destination_path}" ]]; then
			rm -rf $neofetch_destination_path
		fi
		prompt -s "OKAY: Previous config was backed up and can be found at '$neofetch_backup_path'"
	else
		prompt -s "OKAY: No other config was found. Proceeding..."
	fi

	prompt -i "INFO: Creating symlink to Neofetch config..."
	crt_symlink $neofetch_original_path $neofetch_destination_path
}


function assert_arch_package() {
	package=$1

	if pacman -Qs $package > /dev/null ; then
		return 0
	fi

	return 1
}




function programs_has_progam() {
	user_program=$1

	for program in "${!programs[@]}"; do
		if [[ "$program" == *"$user_program" ]]; then
			return 0
			break
		fi
	done
	return 1

}

function install_all() {

	luaver_path="$HOME/.luaver"

	install_arch

	complex_heading "Installing global packages..."

	prompt -i "INFO: Checking if Luaver is already installed..."
	if [[ -d "$luaver_path" ]]; then
		prompt -s "OKAY: Luaver is already installed"
	else
		prompt -w "WARNING: Luaver is not installed, installing it..."
		# curl -fsSL https://raw.githubusercontent.com/dhavalkapil/luaver/master/install.sh | sh -s - -r v1.1.0
		# source $HOME/.bashrc
	fi

}

function install_arch() {

	arch_aur_packages="${PKGS}arch/aur.txt"
	arch_pacman_packages="${PKGS}arch/official_repo.txt"

	aur_pkgs=()
	official_repo_pkgs=()

	while read pkg; do
		official_repo_pkgs+=($pkg)
	done < $arch_pacman_packages

	while read pkg; do
		aur_pkgs+=($pkg)
	done < $arch_aur_packages


	complex_heading "Installing Arch packages from the AUR..."

	for pkg in "${aur_pkgs[@]}"; do
		prompt -i "~~> Checking if the package $pkg is installed..."
		if (assert_arch_package $pkg); then
			prompt -s "\tOKAY: Package is installed, skipping it..."
		else
			prompt -w "\tWARNING: Package is not installed, installing it..."
			yay -S $pkg
		fi
		echo
	done
	echo

	complex_heading "Installing Arch packages from the official repo..."

	for pkg in "${official_repo_pkgs[@]}"; do
		prompt -i "~~> Checking is the package $pkg is installed..."
		if (assert_arch_package $pkg); then
			prompt -s "\tOKAY: Package is installed, skipping it..."
		else
			prompt -w "\tWARNING: Package is not installed, installing it..."
			sudo pacman -S --noconfirm $pkg
		fi
		echo
	done
	echo
}


function install_fedora() {
	complex_heading "Installing Fedora packages..."
}

function install_ubuntu() {
	complex_heading "Installing Ubuntu packages..."
}

function assert_program() {

	user_programs=("$@")

	complex_heading "Installing configs for the given programs..."

    for user_program in "${!user_programs[@]}"; do
		prompt -i "INFO: Checking if the program ${user_programs[$user_program]} is supported..."


		if [[ "${supported_distros[@]}" =~ "${user_programs[$user_program]}" ]]; then
			prompt -s "OKAY: The distro that you are trying to install the packages for is supported!"
			echo
			eval ${supported_distros[${user_programs[$user_program]}]}
		else
			if (programs_has_progam ${user_programs[$user_program]}); then
				prompt -s "OKAY: The program '${user_programs[$user_program]}' is supported!"
				echo
				eval ${programs[${user_programs[$user_program]}]}
			else
				prompt -e "ERROR: Program ${user_programs[$user_program]} was not recognized"
			fi
		fi
		echo


		# if [[ "${programs[@]}" =~ "${user_programs[$user_program]}" ]]; then
		# 	# eval ${programs[${user_programs[$user_program]}]}
		# else
		# 	prompt -e "ERROR: Program ${user_programs[$user_program]} was not recognized"
		# fi
		# echo
	done
}


function assert_linux() {

	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		# distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
		return 0
	else
		return 1
	fi

}


function copy_resources() {

	prompt -i "INFO: Checking passed parameter..."
	if [[ "$1" == "w" ]]; then
		cp -r "${RESOURCES}wallpapers" "$HOME/Pictures"
		prompt -s "OKAY: Wallpapers successfully copied to $HOME/Pictures!"
	elif [[ "$1" == "i" ]]; then
		cp -r "${RESOURCES}icons" "$HOME/Pictures"
		prompt -s "OKAY: Icons successfully copied to $HOME/Pictures!"
	else
		prompt -e "ERROR: Option not recognized"
	fi

}

__init_colors

if [[ -n "$1" ]]; then
	while :; do
		case $1 in
			-h|-\?|--help)
				echo "$SCRIPT_HELP"
				exit 0
				;;
			-lp|--link-program)
				if [[ "$2" ]]; then
					local_programs=${2//[[:blank:]]/}
					IFS=',' read -ra user_programs <<< "$local_programs"

					assert_program "${user_programs[@]}"
				else
					prompt -e "ERROR: You must provide at least one argument"
				fi
				;;
			-ld|--link-dots)
				complex_heading "Asserting OS..."
				if (assert_linux); then
					prompt -s "OKAY: Current OS is supported!"

				complex_heading "Creating symlinks for the dots"
					link_dots
				else
					prompt -e "ERROR: Unsuported operating system"
				fi
				;;
			-r|--resources)
				if [[ "$2" ]]; then
					copy_resources $2
				else
					prompt -e "ERROR: You must provide at least one argument"
				fi
				;;
			-?*)
				prompt -e "WARNING: Unknown option (ignored): $1"
				;;
			*)               # Default case: No more options, so break out of the loop.
				break
				;;
		esac
		shift
	done
else
    echo -e "This script needs at least one argument to work.\nType '$THIS -h' or '$THIS --help' for help "
fi


