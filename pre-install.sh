#!/bin/bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
sh -c "$(curl -o- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
