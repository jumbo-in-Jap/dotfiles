# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

OK="^_^ "
NG="X_X "

PROMPT="%{$fg_bold[blue]%}${HOST} "
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+="%F{blue}%~%f"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="%% "

RPROMPT="[%*]"

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='entries' --exclude='*/cache/*'"

# ls
# alias ls="ls -ls" # color for darwin
# alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

export PATH=$PATH:/usr/local/bin:
alias mvi="mvim --remote-tab-silent"

#alias ls='ls -G'

alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim '

#bash
alias bashv='vim ~/.bashrc'
alias bashc='cat ~/.bashrc'
alias bashs='source ~/.bashrc'
#key command
alias keyoff='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
alias keyon='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'

# for git
alias gst='git status -s -b'
alias gci='git commit'
alias gdi='git diff'
alias gdc='git diff --cached'
alias gad='git add'
alias gcom='git commit -m "'
alias gcm='git checkout master'
alias gcb='git checkout -b'
alias gcd='git branch -d'
alias gbr='git branch'
alias glg='git log'
alias gdif='git diff'
# checkout 
alias gch="git checkout"
alias gcm="git checkout master"

# pull,push
alias gplm="git pull origin master"
alias gps="git push origin"

#clone 
alias gcl='git clone '

# for shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
#alias ls='ls -GwF'
alias la='ls -alh'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
alias vi='vim'
alias v='vim'
alias sr='screen -d -R'

alias cot='open -g -a CotEditor' # ターミナルからCotEditorを開く
alias mamp='cd /Applications/MAMP/htdocs'
alias rettyw='cd /Users/hanedakentarou/Documents/000-retty/retty/'
alias rettyi_web=' cd /Users/hanedakentarou/Documents/000-retty/retty_iPhone_src/retty_iPhone/Retty/Retty/www/html/' 
alias rettyi=' cd /Users/hanedakentarou/Documents/000-retty/retty_iPhone_src/retty_iPhone/Retty/Retty/' 
alias rettya=' cd /Users/hanedakentarou/Documents/000-retty/retty_android'
alias rettya_web='cd /Users/hanedakentarou/Documents/000-retty/retty_android/RettyTest/assets/www'
alias rettya_change='cd util/change_connect_server/
php change_connect_server.php '

alias nmd='cd /Applications/MAMP/htdocs/nomadoma/Android/nomadomaProject/nomadoma/'
alias nmd_web='cd /Users/hanedakentarou/Documents/nomadoma/nomadoma2/nomadoma/iOS/nomadoma/Classes'


alias weinre='
source ~/.nvm/nvm.sh
weinre --boundHost -all-'

alias aptana='cd /Users/hanedakentarou/Documents/Aptana\ Studio\ 3\ Workspace'

alias db8ec2='ssh retty_ec2_dev8'
alias db8ken='ssh retty_haneda_dev8'
alias db2ken='ssh retty_ec2_dev2'
alias db2ken='ssh retty_haneda_dev2'

alias new_tech='cd ~/Desktop/xcode/new_techPro'


alias hug_a='cd /Users/hanedakentarou/Documents/Hugg/Hugg-source/hugg-album-android'

alias sak='ssh s_haneda'
alias pandra='cd /Users/hanedakentarou/Documents/xcode/pandra'

alias oz='cd /Users/hanedakentarou/Documents/phonegap/dev_oz'

alias usbchk='system_profiler SPUSBDataType'

alias xcd='cd /Users/hanedakentarou/Documents/xcode'

alias pbins='pebble install --phone '
alias traning='cd /Users/hanedakentarou/Documents/xcode/ios_fighter'

alias tm='tmux'
alias tms='tmux attach'

alias cpan_p='sudo perl -MCPAN -e shell'


# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

PERL_MB_OPT="--install_base \"/Users/hanedakentarou/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/hanedakentarou/perl5"; export PERL_MM_OPT;
