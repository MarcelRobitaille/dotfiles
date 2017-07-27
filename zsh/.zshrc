export ZSH=$HOME/.oh-my-zsh
export FPATH=/usr/share/zsh/site-functions:/usr/share/zsh/functions/Calendar:/usr/share/zsh/functions/Chpwd:/usr/share/zsh/functions/Completion:/usr/share/zsh/functions/Completion/Base:/usr/share/zsh/functions/Completion/Linux:/usr/share/zsh/functions/Completion/Unix:/usr/share/zsh/functions/Completion/X:/usr/share/zsh/functions/Completion/Zsh:/usr/share/zsh/functions/Exceptions:/usr/share/zsh/functions/Math:/usr/share/zsh/functions/MIME:/usr/share/zsh/functions/Misc:/usr/share/zsh/functions/Newuser:/usr/share/zsh/functions/Prompts:/usr/share/zsh/functions/TCP:/usr/share/zsh/functions/VCS_Info:/usr/share/zsh/functions/VCS_Info/Backends:/usr/share/zsh/functions/Zftp:/usr/share/zsh/functions/Zle:$FPATH

ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_NODE_SHOW=false
export RPS1="%{$reset_color%}"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

for file in $HOME/.dotfiles/omzsh/{exports,aliases,functions,secret}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

(hash wal 2>/dev/null && wal -r -t &)

DEFAULT_USER="marcel"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Up/down search for matches of what's already there
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
