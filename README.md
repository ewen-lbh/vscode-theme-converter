# VS Code theme converter

Like the colors you see in your vscode's integrated terminal? Use them in

- your terminal (via [_(py)wal_](https://github.com/dylanaraps/pywal) or as a [_kitty_](https://github.com/kovidgoyal/kitty) configuration file)

- your wallpapers (see [abstract-wallpapers-per-color-scheme](https://github.com/ewen-lbh/abstract-wallpapers-per-color-scheme))

## Installation

0. Make sure you have Ruby installed

1. `git clone` this repository

## Usage

run `vscode2THING.rb < INPUT_FILE > OUTPUT_FILE`, replacing:

- `THING` with one of:
  
  - wal
  
  - kitty

- `INPUT_FILE` with the vscode theme file[1](#finding-a-vscode-theme-file)

- `OUTPUT_FILE` with the path to your generated `THING` theme (e.g. `~/.config/wal/<light or dark>/<theme name>.json` for _(py)wal_)

------

Note: for kitty, if you don't want to erase your config file (you probably don't), use `>> ~/.config/kitty/kitty.conf` instead of `> ~/.config/kitty/kitty.conf`

-------

## Finding a vscode theme file

vscode extensions are located under the user data dir, which depends on your OS and your edition of vscode (stable, Insiders, vscodium, etc.)

Once you know where that directory is (e.g. `~/.vscode` on Linux, stable), you can pass it to `find.rb` (e.g. `./find.rb ~/.vscode Theme Name`), and it'll output a path to the JSON file of the theme

Combining both, you can do

```bash
./vscode2THING.rb < $(./find.rb ~/.vscode Theme Name) > OUTPUT_FILE
```

## Roadmap

- Combine `./vscode2*.rb` and `./find.rb` into an interactive CLI that asks questions (which can be avoided by supplying data via CLI flags/args of course)
