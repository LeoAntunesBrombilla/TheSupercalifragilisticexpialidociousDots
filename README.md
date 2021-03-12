# My Dotfiles :coffee:
A collection of my personal dotfiles and scripts to install them in brand new machines that requires configuration!

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

## Table of Contents

* [Screenshots](#screenshots)
  * [Home](#home)
  * [Code Editor](#code-editor)
  * [Floating Windows](#floating-windows)
* [About The Repository](#about-the-repository)
* [Final OS-Specs (configuration)](#final-os-specs-configuration)
* [Prerequisites](#prerequisites)
* [Features (installation)](#features-installation)
  * [Installation Order](#installation-order)
    * [Order-Dependent](#order-dependent)
    * [Non Order-Dependent](#non-order-dependent)
* [Apps](#apps)
* [Gnome Extensions](#gnome-extensions)
  * [Dash to Panel configuration](#dash-to-panel-configuration)
* [Reporting Issues](#reporting-issues)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Screenshots
Here are some screenshots of what it'll end up looking like in the end :)
<!-- All the images can be found here: https://imgur.com/a/xOOsYDQ-->

### Home
<p align="center">
  <img
    src="https://i.imgur.com/NejvmLe.png"
    alt="Home"
    />
</p>

### Code Editor
<p align="center">
  <img
    src="https://i.imgur.com/JntBaUA.png"
    alt="Code Editor"
    />
</p>

### Floating Windows
<p align="center">
  <img
    src="https://i.imgur.com/hmuyjPo.png"
    alt="Floating Windows"
    />
</p>




## About the repository
This .dotfiles go from configuration files for vim/nvim, to even github and input profiles, all the file can be found in the `dotfiles/` directory. Furthermore, this repository is still in development and the installation sripts are yet to be finalized.

## Final OS-Specs (configuration)
```
OS: Ubuntu 20.10 x86_64
Kernel: 5.11.0-051100-generic
Packages: 2411 (dpkg), 7 (snap)
Packages: 2411 (dpkg), 7 (snap)
Shell: bash 5.0.17
DE: GNOME 3.38.2
WM: Mutter
WM Theme: Adwaita
Window System: X11
Menu: ArcMenu - tognee Menu
Code Editor: Neovim (w/ gruvbox theme)
Themes:
    * Applications: WhiteSur-dark [GTK2/3]
    * Cursor: Capitaine-cursor
    * Icons: la-capitaine-icon-theme [GTK2/3]
    * Shell: WhiteSur-dark-solid-alt [GTK2/3]
    * Sound: Yaru (default)
Terminal: Kitty-Terminal
    Theme: Coffee
    Font: Hack Nerd Font
Fonts:
    * Interface Text: Ubuntu Regular        (11)
    * Document Text: Sans Regular           (11)
    * Monospace Text: Ubuntu Mono Regular   (13)
    * Legacy Window Titles: Ubuntu bold     (11)
    * Scaling Factor:                       1,03
```

## Prerequisites
Now we will also have to run this command to install some basic utils we will need (NOTE: these are not dependencies):

```
$ sudo apt-get install -y tree git wget curl vim neovim
```

In order to install everything, you'll first have to clone the repository in a place you will keep it for forever:

```
$ mkdir ~/Downloads/secure_dir/     # example: ~/code/github_p/
$ cd ~/Downloads/secure_dir/
$ git clone https://github.com/kdav5758/.dotfiles.git

```

## Features (installation)
In this repository you'll find an installation script called `install.sh`, which you will use to install all of the programs and dotfiles!

| Features                            | Availability    | Flags                                     |
| :---                                | :---            | :---                                      |
| Install Apps                        | yes             | `-ia`, `--install-apps`                   |
| Install Nvidia GPU drivers (460)    | yes             | `-nd`, `--nvidia-drivers`                 |
| Install Wallpapers                  | yes             | `-iw`, `--install-wallpapers`             |
| Install utils (apt pkgs/programs)   | yes             | `-iu`, `--install-utils`                  |
| Install Theme                       | not ready       | `-it`, `--install-theme`                  |
| Generate apt-manual list            | yes             | `-gl`, `--generate-list`                  |
| Generate bin symlinks               | yes             | `-bs`, `--bin-symlinks`                   |
| Generate dotfiles symlinks          | yes             | `-ds`, `--dotfiles-symlinks`              |
| Add main-stream repos (Ubuntu)      | yes             | `-ar`, `--add-repos`                      |
| Add PPAs                            | yes             | `-ap`, `--add-ppas`                       |
| Update [dot]files                   | yes             | `-uf`, `--update-files`                   |
| Give permissions                    | yes             | `-gp`, `--give-permissions`               |

The script manual can be found in [/docs/install_manual.md](https://github.com/kdav5758/.dotfiles/blob/dev/docs/install_manual.md)

### Installation Order
Because of the nature of Linux itself, sometimes there are some prerequisites you must follow before installing something; for example: before installing `mainline` kernel update util present in the `apt_manual_list.txt` file, you must first add the PPA, which can be done by running `bash install.sh --add-ppas`. That's why if you want install every single thing that you can using the `install.sh` script, I'd recommend you doing so in the order I recommend/the one you consider.

##### Order-Dependent
1. Add main-stream repositories     (`--add-repos`)
2. Add PPAs                         (`--add-ppas`)
3. Nvidia Drivers                   (`--nvidia-drivers`)
4. Give permissions                 (`--give-permissions`)
5. Install utilities                (`--install-utils`)
6. Install Apps                     (`--install-apps`)
7. Generate dotfiles symlinks       (`--dotfiles-symlinks`)

##### Non Order-Dependent
* Wallpapers                        (`--install-wallpapers`)
* Generate apt-manual list          (`--generate-list`)
* Generate bin symlinks             (`--bin-symlinks`)

## Apps
As of March, using the `--install-apps` flag can be used to install the following ones:

| Features                | Availability    |
| :---                    | :---            |
| Kotlin                  | yes             |
| Java                    | yes             |
| Python                  | yes             |
| Lua                     | no              |
| Node.js                 | yes             |
| Google                  | yes             |
| Noti                    | yes             |
| Telegram                | yes             |
| MySql                   | yes             |
| Kdenlive                | yes             |
| Btnx & btnx-config      | yes             |
| TLauncher               | yes             |
| KVM                     | no              |
| Extra: font (Hack)      | yes             |

### Create Icons
Some apps like `MySql Workbench` and `TLauncher` require you to create an icon, since they where installed/built from source! For that, we'll use `alacarte`/`main-menu`, for creating the a "new Item". Open it >> "New Item" >> add the following data for each app:


**TLauncher**

* Name: TLauncher
* Command: java -jar <path_to_jar_executable>
* Comment: Minecraft Launcher
* Icon: <select_icon_from_"~/Pictures/app_icons`">

**MySql Workbench**

(note: this one is already added, just search it up and edit it)

* Name: MySQL Workbench
* Command: env GTK_THEME='Adwaita-dark' mysql-workbench %f
* Comment: MySQL Database Design, Administration and Development Tool
* Icon: <leave_default>


## Gnome Extensions
The following are a list of my personal favorite gnome-extensions

| Extension                             | Links                                                                   |
| :---                                  | :---                                                                    |
| ArcMenu                               | https://extensions.gnome.org/extension/3628/arcmenu/                    |
| Clipboard Indicator                   | https://extensions.gnome.org/extension/779/clipboard-indicator/         |
| Caffeine                              | https://extensions.gnome.org/extension/517/caffeine/                    |
| Dash to Panel                         | https://extensions.gnome.org/extension/1160/dash-to-panel/              |
| Desktop Icons                         | https://extensions.gnome.org/extension/1465/desktop-icons/              |
| Extensions                            | https://extensions.gnome.org/extension/1036/extensions/                 |
| Lock Screen Background                | https://extensions.gnome.org/extension/1476/unlock-dialog-background/   |
| Refresh Wifi Connections              | https://extensions.gnome.org/extension/905/refresh-wifi-connections/    |
| Remove Dropdown Arrows                | https://extensions.gnome.org/extension/800/remove-dropdown-arrows/      |
| Sound Input & Output Device Chooser   | https://extensions.gnome.org/extension/906/sound-output-device-chooser/ |
| Tray Icons                            | https://extensions.gnome.org/extension/1503/tray-icons/                 |
| Users Themes                          | https://extensions.gnome.org/extension/19/user-themes/                  |

Before installing them, you must go to [this page](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep), install the extension for google chrome and then run the following commands:
```
# Install an extra in-house Ubuntu extension
$ sudo apt install gnome-shell-extensions

# before we can install any additional extensions we first need to configure Gnome shell host connecto
$ sudo apt install chrome-gnome-shell
```

Now you have to options to install the extensions:
1. Manually installing them going through the links and clicking on `install`
2. [Install your synced extensions](https://www.omgubuntu.co.uk/2017/04/sync-gnome-shell-extensions-google-chrome). In case you have then synced to your account, you can right click on the GNOME logo located in the toolbar (google-chrome) >> Options >> "Use remote extensions list, overwrite local."

Afterwards, you can check all the gnome extensions you have installed by running:

```
$ ls ~/.local/share/gnome-shell/extensions/
```

### Dash to Panel configuration
<p align="center">
  <img src="https://i.imgur.com/8MCbnRV.png" alt="Sublime's custom image"/>
</p>
<!-- ![Dash-to-Panel Style section](https://i.imgur.com/8MCbnRV.png) -->


## Reporting Issues
Issues are used to track todos, bugs, feature requests, and more, in this case this project has no special way for making issues, thus you can click go to the **Issues section** or click [here](https://github.com/kdav5758/.dotfiles/issues) to see a list of all the open and closed issues and create your own **issues** if needed.


