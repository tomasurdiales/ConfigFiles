#!/bin/bash

# Homebrew installation:
echo "Installing Homebrew:"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (will ask for sudo authorization)
echo

# Oh My Zsh installation:
echo "Installing Oh My Zsh:"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# (will ask for sudo authorization)
echo


# Rename GitHub folder:
echo "Renaming config folder to ~/TomsConfig..."
mv ~/ConfigFiles-master ~/.TomsConfig
echo

# Symlink all dotfiles:
echo "Symlinking dotfiles to home directory..."
mv ~/.zshrc ~/zshrc_old
ln -s ~/.TomsConfig/.zshrc ~
ln -s ~/.TomsConfig/.zprofile ~
ln -s ~/.TomsConfig/.vimrc ~
ln -s ~/.TomsConfig/.pylintrc ~
ln -s ~/.TomsConfig/.gitconfig ~ # (these are my personal settings!)
ln -s ~/.TomsConfig/.gitignore ~
echo

# Symlink Executable programs:
echo "Symlinking personal scripts to /usr/local/bin..."
ln -s ~/.TomsConfig/Executables/runmatlab /usr/local/bin
ln -s ~/.TomsConfig/Executables/cwhich /usr/local/bin
ln -s ~/.TomsConfig/Executables/userlogout /usr/local/bin
ln -s ~/.TomsConfig/Executables/opensocials /usr/local/bin
ln -s ~/.TomsConfig/Executables/jupyterpdf /usr/local/bin
ln -s ~/.TomsConfig/Executables/jupyterpython /usr/local/bin
# And give permissions to execute:
chmod +x /usr/local/bin/runmatlab
chmod +x /usr/local/bin/cwhich
chmod +x /usr/local/bin/userlogout
chmod +x /usr/local/bin/opensocials
chmod +x /usr/local/bin/jupyterpdf
chmod +x /usr/local/bin/jupyterpython
echo


# Update zsh shell and install on Homebrew path: /opt/homebrew/bin
echo "Installing and updating zsh..."
/opt/homebrew/bin/brew install zsh
# (this is required to run the programs under Executables)
echo

# # Run Brewfile to install all Homebrew casks and formulae:
# # (will take some time to go through everything)
# echo "Initialising installation of all Homebrew packages"
# cd ~/TomsConfig
# brew bundle
# # echo
# # (requires that Brewfile be decrypted)

# Load Terminal colour coding for quick save (turn into default):
open ~/.TomsConfig/TomTerminal.terminal

echo "Setup completed."
echo ":|"
echo
