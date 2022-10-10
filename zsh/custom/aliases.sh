# Basic functions
alias :q=exit
alias mux=tmuxinator
alias clip="xsel -i -b"
# Nerd Font nf-fa-close
alias incognito="fc -p; PURE_PROMPT_SYMBOL=''"

# Places
command -v lsd > /dev/null 2>&1 && alias ls="lsd"
alias ll="lsd -lah"
command -v bat > /dev/null && alias cat="bat"

# Git
alias g="git"
alias s="git status -s"
alias a="git add "
alias aa="git add -A"
alias c="git commit "
alias cm="git commit -m "
alias cam="git commit -am "
alias d="git diff "
alias p="git push"
alias pl="git pull"

alias wget="wget --hsts-file=$XDG_CONFIG_HOME/.wget-hsts"

alias sudo='sudo '

alias rsync='rsync -av'

alias yy='pwd | clip'

alias today='date +%Y-%m-%d'
