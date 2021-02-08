typeset -U path
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
path+=($HOME/.local/bin)
path+=($HOME/.cargo/bin)
path+=(/usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin)
# export PATH=$PATH:$HOME/cascode/github.com/xiki/bin:/usr/local/sbin
path+=($HOME/cascode/github.com/xiki/bin /usr/local/sbin)
# export PATH="$PATH:$HOME/.fzf/bin"
path+=($HOME/.fzf/bin)
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
path+=($HOME/perl5/bin)
path+=($HOME/.gem/ruby/2.7.0/bin)

export GOROOT=/usr/local/opt/go/libexec/
export GOPATH=$HOME/.go
export GO111MODULE=auto
export ZDOTDIR=$HOME
export FPATH="$FPATH:$HOME/local/share/zsh/site-functions"
path+=($GOROOT/bin $HOME/.go/bin)
export FZF_TMUX=0
export PYSPARK_DRIVER_PYTHON=ipython

export GREP_COLOR=$'\e[43;30'
export AUTOJUMP_KEEP_SYMLINKS=1
export CLICOLOR=1
export TERM2NARROW=false
export LESS_TERMCAP_mb=$'\E[05;34m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[44;33m'       # begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;33m'       # begin underline
export PAGER='less -R'
export RI='-f ansi'
export LSCOLORS=exfxcxdxcxegedabagacad
export LS_COLORS='di=01;36'
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL5LIB=$HOME/perl5/lib/perl5
export NULLCMD=:
export VISUAL=vim
