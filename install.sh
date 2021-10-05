#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -f ./.zshrc ~/.zshrc

source ~/.zshrc

brew install --ignore-already-installed spaceship thefuck direnv

brew tap homebrew/cask-fonts

brew install --cask --ignore-already-installed font-fira-code iterm2

PATH=$ZSH_CUSTOM

[ -z "$ZSH_CUSTOM" ] && exit 1

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

cp -f ./.zshrc ~/.zshrc

mkdir -p $ZSH_CUSTOM/colors/
git clone git@github.com:herrbischoff/iterm2-gruvbox.git $ZSH_CUSTOM/colors/gruvbox
