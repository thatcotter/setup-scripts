#!/usr/bin/env bash  

#install Tidal Cycles
echo "Would you like to install Tidal Cycles and its dependencies?"
read -p "Continue (y/n)?" choice
case "$choice" in
  y|Y ) curl https://raw.githubusercontent.com/tidalcycles/tidal-bootstrap/master/tidal-bootstrap.command -sSf | sh;;
  n|N ) echo "skipping Tidal Cycles";;
  * ) echo "invalid";;
esac