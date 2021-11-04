#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew update

brew install --ignore-already-installed aws-cli ansible jq spaceship imagemagick nmap rust tfenv tgenv thefuck tree direnv kubectl minikube hyperkit helm
brew tap homebrew/cask-fonts
brew install --cask --ignore-already-installed discord docker firefox-developer-edition font-fira-code iterm2 microsoft-teams slack spotify steam vlc visual-studio-code

cp -f ./.zshrc ~/.zshrc

source ~/.zshrc

[ -z "$ZSH_CUSTOM" ] && printf "ZSH_CUSTOM is unset, cannot continue"; exit 1

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

mkdir -p $ZSH_CUSTOM/colors/

# Manual steps

git clone git@github.com:herrbischoff/iterm2-gruvbox.git ./gruvbox

wget https://download.tuxfamily.org/dvorak/macosx/fr-dvorak-bepo-macosx-1.1rc2.dmg -o ./bépo.dmg
