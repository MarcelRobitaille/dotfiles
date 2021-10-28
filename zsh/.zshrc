export ZSH=$HOME/.oh-my-zsh
export FPATH=/usr/share/zsh/site-functions:/usr/share/zsh/functions/Calendar:/usr/share/zsh/functions/Chpwd:/usr/share/zsh/functions/Completion:/usr/share/zsh/functions/Completion/Base:/usr/share/zsh/functions/Completion/Linux:/usr/share/zsh/functions/Completion/Unix:/usr/share/zsh/functions/Completion/X:/usr/share/zsh/functions/Completion/Zsh:/usr/share/zsh/functions/Exceptions:/usr/share/zsh/functions/Math:/usr/share/zsh/functions/MIME:/usr/share/zsh/functions/Misc:/usr/share/zsh/functions/Newuser:/usr/share/zsh/functions/Prompts:/usr/share/zsh/functions/TCP:/usr/share/zsh/functions/VCS_Info:/usr/share/zsh/functions/VCS_Info/Backends:/usr/share/zsh/functions/Zftp:/usr/share/zsh/functions/Zle:$FPATH
fpath+=$HOME/.zsh/pure

ZSH_THEME=""

plugins=(git pass)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.zsh/async/async.zsh"

for file in $ZSH/custom/{exports,aliases,functions,directories,secret}.sh $ZSH/custom/plugins/*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

DEFAULT_USER="marcel"

autoload -U promptinit; promptinit
prompt pure

# Show git stash in prompt
zstyle :prompt:pure:git:stash show yes

# Vi mode
bindkey -v

# Up/down search for matches of what's already there
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Enable FZF stuff in terminal
# Like ctrl-r history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f $HOME/.local/etc/motd ] && command cat $HOME/.local/etc/motd
