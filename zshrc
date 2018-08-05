# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PGDATA=$HOME/pgdata

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbalboni/.oh-my-zsh
fpath=( "$HOME/.config/.zfunctions" $fpath )

#DISABLE_UNTRACKED_FILES_DIRTY="true"

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

plugins=(git nvm zsh-autosuggestions ssh-agent)

zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_adhoc

source $ZSH/oh-my-zsh.sh

export ZSH_THEME=""

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
  GPG_TTY=$(tty)
  export GPG_TTY
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

eval "$(rbenv init -)"

# MODE_INDICATOR="%{$fg_bold[red]%}[N]%{$fg[red]%}%{$reset_color%}"
# INSERT_MODE_INDICATOR="[I]"
# function vi_mode_prompt_info() {
#   echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
# }
#
# PROMPT='$(vi_mode_prompt_info) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)$ '
# RPROMPT=""
#
# ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

alias prof="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias unit="yarn run test:unit"
alias unitd="yarn run test:unit -- --inspect --debug-brk"
alias e2e="yarn run test:e2e"
function schema() {
  yarn remove vets-json-schema
  yarn add https://github.com/department-of-veterans-affairs/vets-json-schema.git\#$1
}
function forms() {
  yarn remove us-forms-system 
  yarn add https://github.com/usds/us-forms-system.git\#$1
}
alias serve="ws -p 3001 -z"

export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
autoload -U promptinit; promptinit
prompt pure
