if { uname | grep -q Linux; } && [ -e $HOME/.autojump ] ; then
    [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
fi
