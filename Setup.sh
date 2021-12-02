#!/bin/bash

# Homebrew installation:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (will ask for sudo authorization)

# Update zsh shell and install on Homebrew path: /opt/homebrew/bin
brew install zsh
# (this is required to run the programs under Executables)

# Oh My Zsh installation:
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# (will ask for sudo authorization)


# Rename GitHub folder:
mv -r ~/ConfigFiles ~/TomsConfig

# Symlink all dotfiles:
ln -s ~/TomsConfig/.zshrc ~
ln -s ~/TomsConfig/.zprofile ~
ln -s ~/TomsConfig/.vimrc ~
ln -s ~/TomsConfig/.pylintrc ~
ln -s ~/TomsConfig/.gitconfig ~ # (these are my personal settings!)
ln -s ~/TomsConfig/.gitignore ~

ln -s ~/TomsConfig/env.sh ~

# Symlink Executable programs:
ln -s ~/TomsConfig/Executables/runmatlab /usr/local/bin
ln -s ~/TomsConfig/Executables/cwhich /usr/local/bin
ln -s ~/TomsConfig/Executables/userlogout /usr/local/bin
ln -s ~/TomsConfig/Executables/opensocials /usr/local/bin
ln -s ~/TomsConfig/Executables/jupyterpdf /usr/local/bin
ln -s ~/TomsConfig/Executables/jupyterpython /usr/local/bin
# And give permissions to execute:
chmod +x /usr/local/bin/runmatlab
chmod +x /usr/local/bin/cwhich
chmod +x /usr/local/bin/userlogout
chmod +x /usr/local/bin/opensocials
chmod +x /usr/local/bin/jupyterpdf
chmod +x /usr/local/bin/jupyterpython


# Run Brewfile to install all Homebrew casks and formulae:
# (will take some time to go through everything)
cd ~/TomsConfig
brew bundle
# (requires that Brewfile be decrypted)

echo("Setup completed")
echo(":|")
