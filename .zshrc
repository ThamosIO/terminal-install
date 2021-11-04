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

# Custom git aliases

alias gcpf="gcn! && gp --force-with-lease"
alias gagp="ga -p && gcn! && gp --force-with-lease"
alias gdc="gd --cached"
alias gcdd="gco dev"
alias grbdd="grb dev"
alias gaddu="git ls-files --deleted | xargs git add"
alias gfix="git commit --fixup"
alias grbas="git rebase -i --autosquash"
alias gptopidqkc="git push --all --no-verify origin"

# Spaceship prompt

export SPACESHIP_CHAR_SYMBOL="⚡ "
export SPACESHIP_TIME_SHOW=true

# Terraform

alias tfinit="terraform init"
alias tfplan="terraform plan"
alias tfapply="terraform apply"
alias tfdeploy="terraform apply -auto-approve"
alias tfoutput="terraform output"
alias tfdestroy="terraform destroy"

# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# Set Spaceship ZSH as a prompt
autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt spaceship
