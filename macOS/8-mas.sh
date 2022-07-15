#!/usr/bin/env bash

# cli reference:
# https://libraries.io/homebrew/mas

# list all the apps you want to install
APPS=(  
	290986013	# Deliveries
	640199958	# Developer
	1176895641	# Spark
	425424353	# Unarchiver
)

echo "Installing Mac App Store Apps..."  
brew install ${APPS[@]}