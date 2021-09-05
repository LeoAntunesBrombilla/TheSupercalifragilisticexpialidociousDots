<p align="center">
  <img
    src="resources/imgs/repo_logo.png"
    alt="My Profile picture"
	width="220"
    />
</p>

<p align="center">
  <b>🐧 Pocco81's configuration files 🐧</b>
</p>

### Thanks for dropping by!

<img src="https://raw.githubusercontent.com/Pocco81/TheSupercalifragilisticexpialidociousDots/dev/resources/imgs/gnome_nvim.png" alt="img" align="right" width="300px">

This is my personal collection of configuration files.

Here are some details about my setup:

+ **OS**: [Arch Linux](https://archlinux.org/)
+ **DE**: [Gnome](https://www.gnome.org)
+ **WM**: [Mutter](https://gitlab.gnome.org/GNOME/mutter)
+ **Shell**: [bash](https://github.com/bminor/bash)
+ **Editor**: [Neovim](https://github.com/neovim/neovim/)
+ **Browser**: [Brave Nightly](https://brave.com/)
+ **Terminal**: [Kitty](https://github.com/kovidgoyal/kitty)
+ **Term Prompt**: [MiniPrompt](https://github.com/Pocco81/MiniPrompt)
+ **Terminal Multiplexer**: [Tmux](https://github.com/tmux/tmux)

# Dope Configs

## NvDope

NvDope is an extensible NeoVim config aiming to be eye-candy, user friendly and powerful:

<img src ="https://raw.githubusercontent.com/Pocco81/TheSupercalifragilisticexpialidociousDots/dev/resources/readme/nvim_1.png">
<img src ="https://raw.githubusercontent.com/Pocco81/TheSupercalifragilisticexpialidociousDots/dev/resources/readme/nvim_2.png">

### Features

+ Easily configurable
+ No need to know Lua to be able to use it
+ Eye-candy
	+ Themes provided by [Catppuccino.nvim](https://github.com/Pocco81/Catppuccino.nvim)
	+ UI (tabline, nav tree, statusline, ...)
+ Full-featured
	+ Native LSP
	+ Debugging interface
	+ Syntax highlight
	+ Completion
	+ Snippets
	+ Formatting
+ Extensible (rust, lua, go, js dev)
+ Fast
+ Miscelanious stuff
	+ Zen mode
	+ Auto save
	+ Comments
	+ Icons
	+ Rightclick Macros
	+ Git integration
	+ Indentation lines
	+ etc...

### Installation

1. Install NeoVim 0.5+
2. Prepare your system and clone the config

```bash
$ rm -rf $HOME/.config/nvim/ $HOME/.local/share/nvim/
$ git clone https://github.com/Pocco81/TheSupercalifragilisticexpialidociousDots.git
$ mv TheSupercalifragilisticexpialidociousDots/.config/nvim/ /home/sebas5758/.config/nvim/
```

3. Start NeoVim and install the plugins
```bash
$ nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
```
4. After it finished installing the plugins and parsers run `:q!`

# Legacy

I tend to change my software from time to time, that's why there are some "legacy" configs for some apps that I've used in the past but still keep in case I ever need them again:

+ Alacritty
+ ST

# TODO
+ Add screenshots for Tmux
+ And functionality for generating symlinks
