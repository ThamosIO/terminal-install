#!/bin/zsh

brew update

pkgs=(
  awscli
  aws-iam-authenticator
  ansible
  bash
  coreutils
  gnu-sed
  gnu-tar
  gnu-indent
  gnu-which
  gnu-grep
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
  wget
)

brew install ${pkgs[@]}

brew tap homebrew/cask-versions

casks=(
  discord
  docker
  firefox-developer-edition
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

# Spaceship prompt install

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# zshrc

cp -f ./.zshrc ~/.zshrc

source ~/.zshrc

[ -z "$ZSH_CUSTOM" ] && printf "ZSH_CUSTOM is unset, cannot continue"; exit 1

mkdir -p $ZSH_CUSTOM/colors/

# Custom scripts

mkdir -p $HOME/.scripts

mv samples/.scripts/ $HOME/
mv samples/.envrc.sample $HOME/.envrc

cd $HOME; direnv allow

# Manual steps

git clone git@github.com:herrbischoff/iterm2-gruvbox.git ./gruvbox

wget https://download.tuxfamily.org/dvorak/macosx/fr-dvorak-bepo-macosx-1.1rc2.dmg

# VSCODE plugins

plugins=(
  4ops.terraform
  alefragnani.Bookmarks
  auchenberg.vscode-browser-preview
  bradymholt.pgformatter
  ckolkman.vscode-postgres
  dbaeumer.vscode-eslint
  eamodio.gitlens
  esbenp.prettier-vscode
  GraphQL.vscode-graphql
  hashicorp.terraform
  humao.rest-client
  igordvlpr.open-in-browser
  ionceflorin.copy-current-file-path
  jakeboone02.pgn
  jdinhlife.gruvbox
  kamikillerto.vscode-colorize
  LaurentTreguier.vscode-simple-icons
  mohsen1.prettify-json
  monokai.theme-monokai-pro-vscode
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ricard.postcss
  shyykoserhiy.vscode-spotify
  sodatea.velocity
  sourcepirate.hclfmt
  vscode-icons-team.vscode-icons
  wholroyd.HCL
  yzhang.markdown-all-in-one
  zhuangtongfa.material-theme
)

code --install-extension ${plugins[@]}
