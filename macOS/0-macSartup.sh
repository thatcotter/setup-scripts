#!/usr/bin/env bash  

# Setup script for setting up a new macos machine
echo "Starting setup..."

echo "Getting sudo Permissions..."
sudo cd .

# install xcode CLI  
xcode-select --install

#------------------------------------------------------------

# install homebrew and packages
bash ./1-brew.sh

#------------------------------------------------------------

# install pip and packages
bash ./2-pip.sh

#------------------------------------------------------------

# install homebrew casks
bash ./3-casks.sh

#------------------------------------------------------------

# install Tidal and Deps
bash ./4-tidal.sh

#------------------------------------------------------------

# apply custom system settings
bash ./5-settings.sh

#------------------------------------------------------------

# install zsh and powerline with p10k
bash ./6-zsh.sh

#------------------------------------------------------------

# install zsh and powerline with p10k
bash ./7-vim.sh

#------------------------------------------------------------

echo "Macbook setup completed! 🎉"
echo "Restart to let the changes/installations take full effect"
