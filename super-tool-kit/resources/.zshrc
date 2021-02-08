ulimit -u 2128

setopt +o nomatch

ZSH=$HOME/.oh-my-zsh
export CONFIGDIR=$HOME/.config

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="liuxiang"
# ZSH_THEME="spaceship"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# plugins=(git autojump battery colorize colored-man command-not-found compleat cp
#          cpanm encode64 gem github gnu-utils go golang history jruby macports
#          mvn mysql-macports node npm osx perl pip python rails rake rsync ruby
#          rvm safe-paste scala screen svn terminalapp terminitor textmate themes
#          bundler httpie ack2 funcfind gemcd alibas vagrant tmux)

UNBUNDLED_COMMANDS=(rubocop)

plugins=(autopair bd bundler colorize compleat cp common-aliases copybuffer encode64 funcfind
         gem gemcd git history httpie mvn perl pip python pyenv rails rake rsync ruby rvm systemadmin systemd
         terminitor themes tmux tmux-pane-words virtualenv project-root kubectl rust rustup cargo
         zsh-autosuggestions zsh_reload zsh-completions)

source $ZSH/oh-my-zsh.sh

autoload -U compinit; compinit
autoload -U zmv

# Customize to your needs...

[ -e $CONFIGDIR/.zsh-aliases.zsh ] && source $CONFIGDIR/.zsh-aliases.zsh || source $HOME/.zsh-aliases.zsh
unalias ping
# unalias fd
unalias rb

# Linux Specific Config
if uname | grep -q Linux; then
    alias ta='tmux attach -t'
    alias tad='tmux attach -d -t'
    alias ts='tmux new-session -s'
    alias tl='tmux list-sessions'
    alias tksv='tmux kill-server'
    alias tkss='tmux kill-session -t'
    alias e='emacsclient -t'
    alias gls=ls
    alias gsed=sed
fi

bindkey '^Xk' autosuggest-clear
bindkey '^X^k' autosuggest-clear
bindkey "^X^X" vi-cmd-mode

# install_powerline_precmd

stty -ixon -ixoff


function omz_termsupport_preexec () {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}


function jj() {
  cd "$({dirs -pl; j -s | sed -n '/^_______/!p; /^_______/q'  | cut -d$'\t' -f2; } | fzf)"
}

set -o interactivecomments

autoload -U perl-subs
zle -N perl-subs
bindkey '^xs' perl-subs

source $HOME/.space.zsh

source $ZSH/functions/zce.zsh

export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%
export FZF_DEFAULT_OPTS="-x -m --history=$HOME/.fzf_history --history-size=10000 --bind 'ctrl-n:down,ctrl-p:up,alt-n:next-history,alt-p:previous-history,ctrl-l:jump,alt-a:select-all,ctrl-alt-j:half-page-down,ctrl-alt-k:half-page-up,alt-j:page-down,alt-k:page-up',ctrl-t:top"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

precmd() {
  pwd > /tmp/iterm2_pwd
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
export ZSH_THEME_TERM_TAB_TITLE_IDLE="%20<..<%~%<<" #20 char left truncated PWD

eval "$(starship init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit
