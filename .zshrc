# 言語設定
export LANG=ja_JP.UTF-8

# 補完機能強化
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# ヒストリ設定
HISTSIZE=10000             # 履歴を10,000行まで保存
SAVEHIST=10000             # 履歴を10,000行まで保存
setopt hist_ignore_dups    # 重複するコマンドを履歴に記録しない
setopt share_history       # 複数のシェル間で履歴を共有
setopt extended_history    # タイムスタンプ付きで記録
setopt hist_reduce_blanks  # 余分な空白を削除

# dircolors
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
alias ls='gls --color=auto'

# エイリアス設定
alias ll='ls -la'           # `ll` で `ls -l` を実行
alias grep='grep --color=auto' # `grep` の出力をカラー表示

# その他設定
zstyle ':completion:*' menu select  # 補完候補をメニュー形式で表示
setopt auto_cd             # ディレクトリ名だけで移動
setopt correct             # スペルミス自動修正
setopt extended_glob       # 拡張グロブ有効化
unsetopt case_glob         # 大文字小文字区別しない

# Git エイリアス
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'

# Docker エイリアス
alias dc='docker-compose'
alias dps='docker ps'

# Zed エイリアス
alias code='zed' # code で zed 開く

# cd した後に ls -la を実行する
chpwd() {
  if [[ $(pwd) != $HOME ]]; then
    ls -la
  fi
}

# クリップボードにコピー
clipcopy() {
  if [ $# -eq 0 ]; then
    pbcopy < /dev/stdin
  else
    command pbcopy < "$1"
  fi
}

# Alias for cat command to copy output to clipboard
alias cat='cat_with_clipboard'

cat_with_clipboard() {
  if [ $# -eq 0 ]; then
    /bin/cat
  else
    /bin/cat "$@"

    # Copy the content to the clipboard
    if command -v pbcopy &> /dev/null; then
      # macOS
      /bin/cat "$@" | pbcopy
      echo "Content copied to clipboard."
    elif command -v xclip &> /dev/null; then
      # Linux with xclip
      /bin/cat "$@" | xclip -selection clipboard
      echo "Content copied to clipboard."
    elif command -v xsel &> /dev/null; then
      # Linux with xsel
      /bin/cat "$@" | xsel --clipboard --input
      echo "Content copied to clipboard."
    else
      echo "No clipboard utility found. Please install pbcopy, xclip, or xsel."
    fi
  fi
}

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light zdharma-continuum/zinit
zinit ice depth=1
zinit snippet OMZ::lib/completion.zsh

# Zinit Plugins
zinit load zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-completions
zinit load romkatv/powerlevel10k
zinit load zsh-users/zsh-history-substring-search

### Zinit's installer chunk
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
      print -P "%F{33} %F{34}Installation successful.%f%b" || \
      print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load important annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Powerlevel10k configuration
[[ ! -f ~/.dotfiles/.zsh/.p10k.zsh ]] || source ~/.dotfiles/.zsh/.p10k.zsh

# Brew設定
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
