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

# エイリアス設定
alias ll='ls -l'           # `ll` で `ls -l` を実行
alias la='ls -la'          # `la` で `ls -la` を実行
alias grep='grep --color=auto' # `grep` の出力をカラー表示

# その他
zstyle ':completion:*' menu select  # 補完候補をメニュー形式で表示
setopt auto_cd             # ディレクトリ名だけで移動
setopt correct             # スペルミス自動修正
setopt extended_glob       # 拡張グロブ有効化
unsetopt case_glob         # 大文字小文字区別しない


# cd した後に ls -la を実行する
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls -la
	fi
}

# ファイルサイズを人間が読みやすい形式で表示
human_readable_size() {
  numfmt --to=iec-i --suffix=B "$1"
}

# クリップボードにコピー
clipcopy() {
  if [ $# -eq 0 ]; then
    pbcopy < /dev/stdin
  else
    command pbcopy < "$1"
  fi
}

# dircolors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
alias ls='gls --color=auto'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
# source "${ZINIT_HOME:-~/.local/share/zinit}/zinit.git/zinit.zsh"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light zdharma-continuum/zinit
zinit ice depth=1
zinit snippet OMZ::lib/completion.zsh

# Zinit Plugins
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-completions
zinit load romkatv/powerlevel10k
zinit load zsh-users/zsh-history-substring-search

### Added by Zinit's installer
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
