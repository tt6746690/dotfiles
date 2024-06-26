# If not running interactively, don't do anything 
# This is to avoid issues with rsync to server that runs zsh that hangs.
[[ "$-" != *i* ]] && return

# source .profile
if [ -f ~/.profile ]; then
	. ~/.profile
fi

if [[ $(hostname) == ccc* ]] && [[ $(uname) == Linux ]]; then
    # Source global definitions
    if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

    # User specific environment
    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
    then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    fi
    export PATH

    # setting shell to zsh in .profile does not work (cannot see stdout)
    if [ "${zsh_version:-unset}" = "unset" ] && [ -z "$ZSH_VERSION"  ] ; then
        export SHELL=/usr/bin/zsh
        exec /usr/bin/zsh -l
    fi
fi


if [[ "$(hostname)" == satori* || "$(hostname -f)" =~ node[0-9]{4}\.inband$ ]] && [[ $(uname) == Linux  ]]; then
    # Source global definitions
    if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

    # User specific environment
    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
    then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    fi
    export PATH

    # setting shell to zsh in .profile does not work (cannot see stdout)
    if [ "${zsh_version:-unset}" = "unset" ] && [ -z "$ZSH_VERSION"  ] ; then
        export SHELL=/usr/bin/zsh
        exec /usr/bin/zsh -l
    fi
fi



if [[ $(hostname) == submit-0 || $(hostname) =~ ^a100-st2-p4de24xlarge-([0-9]|[1-9][0-9])$ ]] && [[ $(uname) == Linux ]]; then
    # setting shell to zsh in .profile does not work (cannot see stdout)
    if [ "${zsh_version:-unset}" = "unset" ] && [ -z "$ZSH_VERSION"  ] ; then
        export SHELL=/usr/bin/zsh
        exec /usr/bin/zsh -l
    fi
fi
