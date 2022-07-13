#!/usr/bin/env bash  
# Setup script for setting up a new macos machine
echo "Starting setup"

sudo cd .

# install xcode CLI  
xcode-select --install

# Check for Homebrew to be present, install if it's missing  
if test ! $(which brew); then  
    echo "Installing homebrew..."  
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
fi

# Update homebrew recipes  
brew update
brew upgrade

# list all the packages you want to install
PACKAGES=(  
	bat
	cask
	ctags
	ffmpeg
	flac
	fzf
	ghc
	git
	git-lfs
	glfw
	htop
	lua
	midnight-commander
	neovim
	ninja
	nmap
	nvm
	python
	readline
	tmux
	tree
	vim
	wget
	yarn
	youtube-dl
)

echo "Installing packages..."  
brew install ${PACKAGES[@]}

# link readline  
brew link --force readline

echo "Cleaning up..."  
brew cleanup

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
sudo easy_install pip

echo "Installing Python packages..."  
PYTHON_PACKAGES=(  
    virtualenv  
    virtualenvwrapper 
    speedtest-cli 
    ansible
	ansible-core 
	cffi
	cryptography 
	Jinja2
	MarkupSafe
	packaging
	pip
	pycparser
	pyparsing
	PyYAML
	resolvelib
	setuptools
)  
pip install ${PYTHON_PACKAGES[@]}


echo "Installing essential casks..."
CASKS=(  
	1password
	accord
	adobe-acrobat-reader
	adobe-creative-cloud
	alacritty
	alfred
	alt-tab
	amethyst
	arduino
	astropad
	atom
	authy
	balenaetcher
	bartender
	blender
	cinder
	discord
	dolphin
	dropbox
	duet
	electron
	epic-games
	expressvpn
	firealpaca
	firefox
	github
	godot
	google-chrome
	grandperspective
	jetbrains-toolbox
	kaleidoscope
	kodelife
	leap-motion
	midi-monitor
	notion
	obs
	obsidian
	openframeworks
	parallels
	postman
	setapp
	slack
	sonic-pi
	typora
	unity-hub
	unpkg
	visual-studio-code 
	vlc
)
echo "Installing cask apps..."  
brew install --cask ${CASKS[@]}

OPTIONALCASKS=(
	ableton-live-lite
	anki
	dwarf-fortress-lmp
	freetube
	freeyourmusic
	handbrake
	hyper
	krita
	minecraft
	openscad	
	qbittorrent
	spark
	steam
	tor-browser
)

echo "Would you like to install optional cask apps?"
read -p "Continue (y/n)?" choice
case "$choice" in
  y|Y ) brew install --cask ${OPTIONALCASKS[@]};;
  n|N ) echo "skipping optional casks";;
  * ) echo "invalid";;
esac

#install Tidal Cycles
curl https://raw.githubusercontent.com/tidalcycles/tidal-bootstrap/master/tidal-bootstrap.command -sSf | sh

echo "Configuring OS..."
# Set fast key repeat rate  
# defaults write NSGlobalDomain KeyRepeat -int 0

# Require password as soon as screensaver or sleep mode starts  
defaults write com.apple.screensaver askForPassword -int 1  
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default  
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click  
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true  
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


echo "Macbook setup completed!"