##### Tom's .zshrc configuration ######

# Path to your oh-my-zsh installation.
export ZSH="/Users/tomasurdiales/.oh-my-zsh"

# Theme:
# ZSH_THEME="eastwood" # set by `omz`

# Uncomment the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# HOMEBREW Settings:
export HOMEBREW_NO_AUTO_UPDATE=1



# ##### Personal settings #####

echo 'Welcome to shell (zsh)'

# To enable GIT information on command prompt:
autoload -Uz vcs_info

# Pre-command calls:
precmd() {

    # To leave a black row before new every command:
    precmd() {
        echo
    }

    # And call the GIT info variable:
    precmd() { vcs_info }
}

# Format GIT info on prompt:
zstyle ':vcs_info:git:*' formats ' (git)-%b'

# Define PROMPT setup:
setopt prompt_subst
PROMPT=$'%{\e[1m%}[%{\e[1;32m%}%n@Mac%{\e[0m%}|%{\e[1;34m%}%~%{\e[0m%}%{\e[33m%}${vcs_info_msg_0_}%{\e[0m%}%{\e[1m%}] %{\e[0m%}'

# With no GIT information:
# PS1=$'%{\e[1m%}[%{\e[1;32m%}%n@Mac%{\e[0m%}|%{\e[1;34m%}%~ ${vcs_info_msg_0_} %{\e[0m%}%{\e[1m%}] %{\e[0m%}'
# # PS1=$'%{\e[1;32m%}%n@Mac %{\e[1;34m%}%~ %{\e[1;32m%}-> %{\e[0m%} '
# export PS1

# To make path output more readable:
function path(){
    old=$IFS
    IFS=:
    printf ${PATH//:/$'\n'}
    IFS=$old
}

# Copy pwd to the clipboard:
alias cpwd='printf "%q\n" "$(pwd)" | pbcopy && echo "Current directory copied to clipboard."'

# To show system info on startup:
#if [[ $(who | wc -l) -eq 2 ]]; then
#	neofetch
#fi
