export ZSH=/home/marcel/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC=0

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

for file in /home/marcel/.dotfiles/omzsh/{exports,aliases,functions,secret}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

(hash wal 2>/dev/null && wal -r -t &)

DEFAULT_USER="marcel"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi mode
bindkey -v

# Up/down search for matches of what's already there
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

