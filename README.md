## .dir_colors
- `cd .dotfiles`
- `git clone https://github.com/nordtheme/dircolors`
- `ln -sr "$PWD/.dotfiles/src/dir_colors" ~/.dir_colors`
- `vim ~/.zshrc`
```
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
```
- `brew install coreutils`


## Google Drive
- `brew install --cask google-drive`

## ~/Downloads

- `sudo rm -rf Downloads`
- `ln -s ~/Google\ Drive/My\ Drive/Downloads ~/`

