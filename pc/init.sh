#!/usr/bin/bash
mkdir -p ~/.config
rm -f ~/.config/sway
rm -f ~/.config/nvim

ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/sway" ~/.config/sway
