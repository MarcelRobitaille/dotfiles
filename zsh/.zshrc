# Path to your oh-my-zsh installation.
export ZSH=/home/marcel/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_TRUNC=0

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

for file in /home/marcel/.oh-my-zsh/{exports,aliases,functions}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

(hash wal 2>/dev/null && wal -r -t &)

DEFAULT_USER="marcel"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

