# Add homebrew to path:
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH 
# Add poetry to path:
PATH="/Users/tomasurdiales/.local/bin:$PATH"
export PATH

# Pyenv start-up:
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
