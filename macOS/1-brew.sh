#!/usr/bin/env bash  

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
	cmake
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
    zsh
    zsh-completions
    zsh-syntax-highlighting
)

echo "Installing packages..."  
brew install ${PACKAGES[@]}

# link readline  
brew link --force readline

echo "Cleaning up..."  
brew cleanup