export NVM_DIR="$HOME/.nvm" 
export PATH="$PATH:/path/to/elixir/bin"
. "$(brew --prefix nvm)/nvm.sh"
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

alias prof="vim ~/.bash_profile"
alias vimrc="vim ~/.vimrc"
alias submod="rm -rf ~/adhoc/vets-website/schema; git submodule init; git submodule update"
alias gprune="git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done"
alias unit="npm run test:unit"
alias e2e="npm run test:e2e"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
