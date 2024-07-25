## Homebres
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `brew --version`

## Git
- `brew install git`
- `git config --global name "yasainet"`
- `git config --global email "takumi.mizoguchi@gmail.com"`

### 便利設定
- `git config --global push.default current`
- `git config --global color.ui auto`

### Git Credential Manager（GCM）
- `brew tap microsoft/git`
- `brew install --cask git-credential-manager-core`
- `git config --global credential.helper manager-core`

## Terminal.app
- font: MesloLGS NF Regular 14

## .dotfiles
- `git clone https://github.com/yasainet/.dotfiles.git`

### シンボリックリンク
- `ln -s ~/.dotfiles/.vimrc ~/`
- `ln -s ~/.dotfiles/.vim ~/`
- `ln -s ~/.dotfiles/.zshrc ~/`

### vim-plug
1. ダウンロード
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. `:PlugInstall`

### p10k
- `p10k configure`

## .dir_colors
- `cd .dotfiles`
- `git clone https://github.com/nordtheme/dircolors`
- `ln -sr "$PWD/.dotfiles/src/dir_colors" ~/.dir_colors`
- `vim ~/.zshrc`
```
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
```
- `brew install coreutils`

## Nord.js
- `brew install node`

### nvm（Node Version Manager）
- `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
- `source ~/.nvm/nvm.sh`

- `nvm install --lts` (option)

## Google Drive
- `brew install --cask google-drive`

## ~/Downloads
- `sudo rm -rf Downloads`
- `ln -s ~/Google\ Drive/My\ Drive/Downloads ~/`

