#!/usr/bin/env bash

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
	gearboy
	handbrake
	hyper
	krita
	minecraft
	openscad	
	qbittorrent
	spark
	steam
	tor-browser
	transmission
)

echo "Would you like to install optional cask apps?"
read -p "Continue (y/n)?" choice
case "$choice" in
  y|Y ) brew install --cask ${OPTIONALCASKS[@]};;
  n|N ) echo "skipping optional casks";;
  * ) echo "invalid";;
esac