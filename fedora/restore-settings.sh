#!/bin/bash
echo "Restoring application configs..."
cp -r alacritty pop-shell tiling-assistant ranger htop gtk-3.0 gtk-4.0 nautilus ~/.config/

echo "Restoring shell configs..."
cp .bashrc .bash_profile .zshrc ~/

echo "Restoring GNOME settings and extensions..."
dconf load / < gnome-settings.dconf

echo "You may need to:"
echo "- Log out and back in"
echo "- Restart GNOME Shell (Alt+F2, type 'r', press Enter)"
echo "- Re-enable extensions in Extensions app"
