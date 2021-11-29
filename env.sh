#!/opt/homebrew/bin/zsh

# For Homebrew path installation:
# eval "$(/opt/homebrew/bin/brew shellenv)"

# Manual PATH definition:
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH # for homebrew (Python, R, etc)
export PATH

# Paths for BIOCOMSC directories:
export DROP_PATH="/Users/tomasurdiales/Dropbox/"
export SCR_PATH="/Users/tomasurdiales/Codes/"
