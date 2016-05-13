# Path to your oh-my-zsh installation.
export ZSH=/home/marcel/.config/oh-my-zsh

ZSH_THEME="agnoster_custom"

plugins=(git)

for file in $ZSH/{oh-my-zsh,exports,aliases,functions}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

DEFAULT_USER="marcel"
