<p align="center">
    <img
        width="360"
        src="https://raw.githubusercontent.com/Pocco81/TheSupercalifragilisticexpialidociousDots/dev/.config/nvim/resources/logo_nvdelightful.png"
        alt="NVDelightful Logo"
    />
</p>

# What's this?

NVDelightful provides solid NeoVim configuration files that take advantage of
tree-sitter and the built-in language server protocol. The configuration is written
in lua.

# About

## Mappings

| Key Binding | Mode   | Action                                               |
|-------------|--------|------------------------------------------------------|
| `Alt+Q`     | Visual | Close current buffer                                 |
| `Alt+W`     | Visual | Show tags                                            |
| `Ctrl+S`    | Insert | Jump to next editable element in a VSnip snippet     |
| `Ctrl+E`    | Insert | Jump to previous editable element in a VSnip snippet |
| `Ctrl+E`    | Normal | Toggle NvimTree (file navigator)                     |
| `F3`        | Visual | Highlight visual selection                           |
| `F4`        | Visual | Remove highlight from visual selection               |

# Install In One Command!

Make sure you have the newest version of Neovim (0.5).

``` bash
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)
```

After installation run `nvim` and then `:PackerInstall`


# Uninstalling

Changed your mind about LunarVim? To remove it entirely:

``` lua
# Delete the configuration files
rm -R ~/.config/nvim

# Delete the plugins
rm -Rf ~/.local/share/nvim

# Delete the logs
rm -R ~/.cache/nvim
```

# TODO

**HIGH PRIORITY**
+ None

**LOW PRIORITY**
+ None
