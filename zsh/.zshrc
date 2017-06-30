export ZSH=/home/marcel/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(git,vi-mode)

source "$ZSH/oh-my-zsh.sh"

for file in /home/marcel/.dotfiles/zsh/{exports,aliases,functions,secret}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

(hash wal 2>/dev/null && wal -r -t &)

DEFAULT_USER="marcel"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  vi_mode       # Vi-mode indicator
  line_sep      # Line break
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_DIR_TRUNC=0
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_VI_MODE_INSERT="[INSERT]"
SPACESHIP_VI_MODE_NORMAL="[NORMAL]"
SPACESHIP_VI_MODE_COLOR="white"
