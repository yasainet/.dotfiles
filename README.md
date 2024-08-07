# Setup
## Homebres
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `brew --version`

## Git
- `brew install git`
- `git config --global user.name "yasainet"`
- `git config --global user.email "takumi.mizoguchi@gmail.com"`

### 便利設定
- `git config --global push.default current`
- `git config --global color.ui auto`

### Git Credential Manager（GCM）
- `brew tap microsoft/git`
- `brew install --cask git-credential-manager-core`
- `git config --global credential.helper manager-core`

確認（option）:
- `git config --global -l`

## .dotfiles
- `git clone https://github.com/yasainet/.dotfiles.git`

### シンボリックリンク
- `ln -s ~/.dotfiles/.vimrc ~/`
- `ln -s ~/.dotfiles/.vim ~/`
- `ln -s ~/.dotfiles/.zshrc ~/`

## Terminal.app
- font: MesloLGS NF Regular 14

### vim-plug
1. ダウンロード
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. `:PlugInstall`

### p10k
- `p10k configure`

## dircolors
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

# Tools
## Google Cloud SDK
- `brew install --cask google-cloud-sdk`
- `vim ~/.zshrc`
```
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
```

## Github CLI
- `brew install gh`
- `gh auth login`

## Miniconda
- `brew install --cask miniconda`

## clasp
- `npm i @google/clasp -g`

## ffmpeg
- `brew install ffmpeg`

## tree
- `brew install tree`

## code2prompt
Rust:
- `brew install rustup-init`
- `rustup-init`
再起動:
- `exec $SHELL -l`
Install:
- `cargo install code2prompt`

## OpenCommit
- `npm install -g opencommit`
- `oco config set OCO_OPENAI_API_KEY=<your_api_key>`
- `vim ~/.opencommit`
```
OCO_OPENAI_API_KEY=sk-<your_api_key>
OCO_ANTHROPIC_API_KEY=undefined
OCO_AZURE_API_KEY=undefined
OCO_GEMINI_API_KEY=undefined
OCO_TOKENS_MAX_INPUT=undefined
OCO_TOKENS_MAX_OUTPUT=undefined
OCO_OPENAI_BASE_PATH=undefined
OCO_GEMINI_BASE_PATH=undefined
OCO_DESCRIPTION=false
OCO_EMOJI=true
OCO_MODEL=gpt-4o-mini
OCO_LANGUAGE=ja
OCO_MESSAGE_TEMPLATE_PLACEHOLDER=$msg
OCO_PROMPT_MODULE=conventional-commit
OCO_AI_PROVIDER=openai
OCO_GITPUSH=true
OCO_ONE_LINE_COMMIT=false
OCO_TEST_MOCK_TYPE=commit-message
```

# Application
## Githu Desktop
- `brew install --cask github`

## Google Chrome
- `brew install --cask google-chrome`

## Google 日本語
- `brew install google-japanese-ime`

## Google Drive
- `brew install --cask google-drive`

## Rectangle
- `brew install --cask rectangle`

## appcleaner
- `brew install --cask appcleaner`

## cleanshot
- `brew install --cask cleanshot`

## zed
- `brew install --cask zed`

## slack
- `brew install --cask slack`

## Discord
- `brew install --cask discord`

## TG Pro
- `brew install --cask tg-pro`

## UTM
- `brew install --cask utm`

## Tor
- `brew install --cask tor-browser`

## Bisq
- `brew install --cask bisq`

# その他
## ~/Downloads
- `sudo rm -rf Downloads`
- `ln -s ~/Google\ Drive/My\ Drive/Downloads ~/`
