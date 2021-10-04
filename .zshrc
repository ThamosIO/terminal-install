export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_THEME="spaceship"

plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# thefuck
eval $(thefuck --alias)

# direnv
eval "$(direnv hook zsh)"

# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# Set Spaceship ZSH as a prompt
autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt spaceship

