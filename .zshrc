# Path to your oh-my-zsh installation.
export ZSH=/home/marcel/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_TRUNC=0

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

for file in /home/marcel/.dotfiles/oh-my-zsh/{exports,aliases,functions}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

DEFAULT_USER="marcel"
