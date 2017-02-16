# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbalboni/.oh-my-zsh

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git nvm vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

MODE_INDICATOR="%{$fg_bold[red]%}[N]%{$fg[red]%}%{$reset_color%}"
INSERT_MODE_INDICATOR="[I]"
function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
}

PROMPT='$(vi_mode_prompt_info) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)> '
RPROMPT=""

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

alias prof="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias unit="npm run test:unit"
alias e2e="npm run test:e2e"

export KEYTIMEOUT=1
