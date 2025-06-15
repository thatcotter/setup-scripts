#!/bin/bash
echo "Restoring repositories..."
sudo cp -r repos/* /etc/yum.repos.d/
sudo dnf5 update

echo "Installing packages..."
sudo dnf5 install $(cat user-packages.txt | grep -v "^$")
