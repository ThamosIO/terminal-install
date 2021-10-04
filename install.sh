#!/bin/bash

git clone git@github.com:herrbischoff/iterm2-gruvbox.git /tmp/gruvbox

mv ./.zshrc ~/.zshrc

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

brew install spaceship thefuck direnv

brew tap homebrew/cask-fonts

brew install --cask font-fira-code iterm2


ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

mv ./.zshrc ~/.zshrc
