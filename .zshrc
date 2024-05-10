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

    # Define PROMPT setup:
    setopt prompt_subst
    if [ "$USER" = "tomasurdiales" ]; then
        PROMPT=$'%{\e[1m%}[%{\e[1;32m%}tom@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'
    else
        PROMPT=$'%{\e[1m%}[%{\e[1;32m%}%n@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'
    fi

    # My 'ls' settings using coreutils-gls:
    LS_COLORS=$LS_COLORS:'di=1;34:' ; export LS_COLORS
    alias ls='gls -h --color=auto --group-directories-first'
    export QUOTING_STYLE=literal

    # Set up automatic poetry env activations:
    export POETRY_AUTO_ENV=""
    cd() { builtin cd "$@" &&
    if [ -f $PWD/pyproject.toml ]; then
        if [ -f $PWD/.venv/bin/activate ]; then
            export POETRY_AUTO_ENV=$PWD
            source $PWD/.venv/bin/activate
        fi
    elif [ "$POETRY_AUTO_ENV" ]; then
        if [[ $PWD != *"$POETRY_AUTO_ENV"* ]]; then
            export POETRY_AUTO_ENV=""
            deactivate
        fi
    fi }

    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
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

# Quick aliases for git commands:
alias gs='git status'
alias gf='git fetch'
alias gfs='git fetch && git status'
alias gba='git branch -a'
