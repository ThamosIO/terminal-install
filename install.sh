#!/bin/zsh

brew update

brew tap homebrew/cask-fonts
brew tap homebrew/dupes

brew install coreutils
brew install gnu-sed gnu-tar gnu-indent gnu-which gnu-grep --with-default-names

pkgs=(
  awscli
  ansible
  bash
  jq
  spaceship
  imagemagick
  nmap
  rust
  tfenv
  tgenv
  thefuck
  tree
  direnv
  kubectl
  minikube
  hyperkit
  helm
)

brew install ${pkgs[@]}

brew tap homebrew/cask-versions

casks=(
  discord
  docker
  firefoxdeveloperedition
  font-fira-code
  iterm2
  microsoft-teams
  slack
  spotify
  steam
  vlc
  visual-studio-code
)

brew install --cask ${casks[@]}

brew cleanup

# Folders

[[ ! -d $HOME/Projects ]] && mkdir $HOME/Projects
[[ ! -d $HOME/Workspace ]] && mkdir $HOME/Workspace

# zshrc

cp -f ./.zshrc ~/.zshrc

source ~/.zshrc

[ -z "$ZSH_CUSTOM" ] && printf "ZSH_CUSTOM is unset, cannot continue"; exit 1

# Spaceship prompt install

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

mkdir -p $ZSH_CUSTOM/colors/

# Custom scripts

mkdir -p $HOME/.scripts

mv samples/.scripts/ $HOME/.scripts
mv samples/.envrc.sample $HOME/.envrc

cd $HOME; direnv allow

# Manual steps

git clone git@github.com:herrbischoff/iterm2-gruvbox.git ./gruvbox

wget https://download.tuxfamily.org/dvorak/macosx/fr-dvorak-bepo-macosx-1.1rc2.dmg -o ./bépo.dmg
