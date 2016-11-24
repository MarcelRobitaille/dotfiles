# Path to your oh-my-zsh installation.
export ZSH=/home/marcel/.dotfiles/oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_TRUNC=0

plugins=(git)

for file in $ZSH/{oh-my-zsh,exports,aliases,functions}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

DEFAULT_USER="marcel"

# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && exec tmux
# fi
