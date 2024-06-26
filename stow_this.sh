#!/bin/bash

# Create an array of folder names
folders=("nvim" "fish" "starship")

# Loop through each folder in the array
for folder in "${folders[@]}"; do
  echo "stowing $folder"
  stow -D $folder
  stow $folder
done
