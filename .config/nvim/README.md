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

- Move user config into `config.lua` ts-comment string for react
- From here I will update for bug fixes and implement low priority
  features when I have time
- different key to advance through snippets

**LOW PRIORITY**

- vim vsnips dir should be co-located with config
- list all binaries needed for formatters and linters (one day add in
  wiki)
- Implement what I can from this java config:
  [link](https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations)
  - better ui for code actions - formatting
  - setup junit tests for java
- look into emmet-ls
- vim ult test
- which-key all in lua
- what is `fzy`
- https://github.com/pwntester/octo.nvim
- configure surround
- Implement this for typescript
  https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
- look into tabnine

**PLUGIN BUGS**

REACT COMMENTING IS A NIGHTMARE (the filetype is just not recognized idk
why)
