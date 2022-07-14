#!/usr/bin/env bash

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

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Expanded Save Menus by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Remove default apps from the dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
killall Dock