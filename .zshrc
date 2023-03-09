# ##### Tom's .zshrc configuration ######

if [ "$USER" = "root" ]; then
    echo '\nLogged in as root.'
    setopt prompt_subst
    PROMPT=$'%{\e[1m%}[%{\e[1;32m%}%n@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[1m%}] %{\e[0m%}'

else # Only enable full customization when using guest login.
    echo 'Welcome to shell (zsh)'

    # Path to your oh-my-zsh installation.
    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
    export ZSH=$HOME/.oh-my-zsh
    # Theme:
    # ZSH_THEME="eastwood" # set by `omz`
    # Uncomment the following lines to change the auto-update behavior
    # zstyle ':omz:update' mode disabled  # disable automatic updates
    # zstyle ':omz:update' mode auto      # update automatically without asking
    zstyle ':omz:update' mode reminder # just remind me to update when it's time
    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"
    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"
    # Add wisely, as too many plugins slow down shell startup.
    # plugins=(git)
    source $ZSH/oh-my-zsh.sh

    # Modify oh-my-zsh aliases:
    unalias ls && unalias l && unalias la && unalias ll && unalias lsa && unalias _

    # HOMEBREW Settings:
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_ANALYTICS=1

    # To enable GIT information on command prompt:
    autoload -Uz vcs_info
    precmd() {
        # # To leave a black row before new every command and call the GIT info variable:
        precmd() {vcs_info && echo}
    }
    # Format GIT info on prompt:
    zstyle ':vcs_info:git:*' formats ' (git)-%b'

    # Define PROMPT setup:
    setopt prompt_subst
    if [ "$USER" = "tomasurdiales" ]; then
        PROMPT=$'%{\e[1m%}[%{\e[1;32m%}tom@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'
        if [ "$ENABLE_CONDA" = true ]; then
            PROMPT=$'%{\e[1m%}[%{\e[1;32m%}tom-conda@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'
        fi
    else
        PROMPT=$'%{\e[1m%}[%{\e[1;32m%}%n@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'
    fi

    # My 'ls' settings using coreutils-gls:
    LS_COLORS=$LS_COLORS:'di=1;34:' ; export LS_COLORS
    alias ls='gls -h --color=auto --group-directories-first'
    export QUOTING_STYLE=literal

    # >>> conda initialize >>>
    # ENABLE_CONDA=false
    if [ "$ENABLE_CONDA" = true ]; then
        export CONDA_AUTO_ACTIVATE_BASE=false
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/Users/tomasurdiales/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/tomasurdiales/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/tomasurdiales/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/tomasurdiales/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        echo '*Conda is on path.'
    fi
    # <<< conda initialize <<<
fi

# To make path output more readable:
function path(){
    old=$IFS
    IFS=:
    printf ${PATH//:/$'\n'}
    IFS=$old
}

# Copy pwd to the clipboard:
alias cpwd='printf "%q\n" "$(pwd)" | pbcopy && echo "Current directory copied to clipboard:" $(pbpaste)'
