#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew update

brew install --ignore-already-installed aws-cli ansible jq spaceship tfenv tgenv thefuck tree direnv
brew tap homebrew/cask-fonts
brew install --cask --ignore-already-installed discord docker firefox-developer-edition font-fira-code iterm2 slack spotify steam vlc

cp -f ./.zshrc ~/.zshrc

source ~/.zshrc

PATH=$ZSH_CUSTOM

[ -z "$ZSH_CUSTOM" ] && exit 1

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

cp -f ./.zshrc ~/.zshrc

mkdir -p $ZSH_CUSTOM/colors/
git clone git@github.com:herrbischoff/iterm2-gruvbox.git $ZSH_CUSTOM/colors/gruvbox
