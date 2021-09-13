# st (suckless terminal)

Just my personal st build.

> **NOTE**: I'm using st v0.8.4

## Default settings

- `Font size`: 14px
- `Font family`: `JetBrainsMono` and `FiraCode Nerd Font Mono`
- `Colorscheme`: `doom-one`

## Patches

- Alpha (transparency)
- anygeometry
- appsync (Improve draw time, animation smoothness and reduce flickering/tearing)
- blinking cursor
- dynamic cursor color
- hide cursor
- boxdraw
- newterm
- clipboard
- delkey
- desktopentry
- scrollback (+ mouse)
- undercurl
- OSC 10 11 12 (2)
- font2
- vertcenter
- ligatures
- fix-glyphs
- w3m

> **NOTE**: ligatures needs `libharfbuzz-dev` to work!

## Keybinds

### Keyboard

| Action             | Key combo                                                  |
| ------------------ | ---------------------------------------------------------- |
| Copy               | `Control` + `Shift` + `C`                                  |
| Paste              | `Control` + `Shift` + `V`                                  |
| Zoom in            | `Control` + `+` / `Super` + `Shift` + (`k` / `Arrow Up`)   |
| Zoom out           | `Control` + `-` / `Super` + `Shift` + (`j` / `Arrow Down`) |
| Zoom reset         | `Super` + `Shift` + `Backspace`                            |
| Scroll up          | `Alt` + (`k` / `Arrow Up` / `Page Up`)                     |
| Scroll down        | `Alt` + (`j` / `Arrow Down` / `Page Down`)                 |
| Inc. transparency  | `Alt` + `a`                                                |
| Dec. transparency  | `Alt` + `s`                                                |
| Reset transparency | `Alt` + `d`                                                |
| Open new terminal  | `Super` + `Shift` + `Return`                               |

### Mouse

| Action      | Modifier          |
| ----------- | ----------------- |
| Slow scroll | `Alt` + `wheel`   |
| Fast scroll | `Shift` + `wheel` |
| Select      | `Right click`     |
| Paste       | `Middle button`   |

> **NOTE**: You can also scroll by just using the `wheel` without using
> the `Alt` key.

## Dynamic colorscheme

Because of the `OSC 10 11 12 (2)` patch, it's possible to use a tool like
[theme.sh](https://github.com/lemnos/theme.sh) for changing the colorscheme on the fly.

### Known issues

- When using `theme.sh` the background will not be transparent.
- If you use the keybinds for the transparency, the theme will be replaced with
  the default one (`doom-one`).

## Installation

```sh
sudo make clean install
```

### Required packages

- `GNU Make`
- `fontconfig`
- `harfbuzz`
- `libX11`
- `libXft`
