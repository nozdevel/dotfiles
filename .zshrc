## zshの基本的な設定
## 環境変数
export LC_ALL=ja_JP.UTF-8

## ディレクトリ名だけでcdする
setopt AUTO_CD

## cd したら自動的にpushdする
setopt AUTO_PUSHD

## 重複したディレクトリを追加しない
setopt PUSHD_IGNORE_DUPS

# 単語の区切り設定
autoload -Uz select-word-style
select-word-style default
# # ここで指定した文字は単語区切りとみなされる
# # / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# # プロンプトに関する設定
#PROMPT="%F{green}[%n@%m]%f(%*%) %~ %# "
PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%}
[%n]$"
#PROMPT="[%n@%m %c]%# "
PROMPT2='[%n]> '
RPROMPT="(%*%)"

# ^Dでzshを終了しない
setopt IGNORE_EOF

# # ^Q/^Sのフローコントロールを無効にする
setopt NO_FLOW_CONTROL

# # beep音を鳴らさない
setopt NO_BEEP

# # 日本語ファイル名を表示可能にする
setopt PRINT_EIGHT_BIT

# # '#' 以降をコメントとして扱う
setopt INTERACTIVE_COMMENTS

# # 高機能なワイルドカード展開を使用する
setopt EXTENDED_GLOB

## 補完機能に関する設定
# zsh-completions を設定
fpath=(~/.zsh-completions/src $fpath)

## 補完機能を有効にする
autoload -Uz compinit; compinit -u

#history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_save_no_dups

## メニュー選択モード
zstyle ':completion:*:default' menu select=2

## 大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

## sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

## ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# include files
#[ -f ~/.zshrc.include ] && source ~/.zshrc.include
#[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias

# zplug
source ~/.zplug/init.zsh

zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

#zplug "peco/peco"
zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

zplug load --verbose

