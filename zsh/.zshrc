export ZSH=$HOME/.oh-my-zsh
export FPATH=/usr/share/zsh/site-functions:/usr/share/zsh/functions/Calendar:/usr/share/zsh/functions/Chpwd:/usr/share/zsh/functions/Completion:/usr/share/zsh/functions/Completion/Base:/usr/share/zsh/functions/Completion/Linux:/usr/share/zsh/functions/Completion/Unix:/usr/share/zsh/functions/Completion/X:/usr/share/zsh/functions/Completion/Zsh:/usr/share/zsh/functions/Exceptions:/usr/share/zsh/functions/Math:/usr/share/zsh/functions/MIME:/usr/share/zsh/functions/Misc:/usr/share/zsh/functions/Newuser:/usr/share/zsh/functions/Prompts:/usr/share/zsh/functions/TCP:/usr/share/zsh/functions/VCS_Info:/usr/share/zsh/functions/VCS_Info/Backends:/usr/share/zsh/functions/Zftp:/usr/share/zsh/functions/Zle:$FPATH

ZSH_THEME=""

plugins=(git pass django)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.zsh/async/async.zsh"

for file in $ZSH/custom/{exports,aliases,functions,secret}.sh $ZSH/custom/plugins/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

DEFAULT_USER="marcel"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#
# Load nvm
#

export NVM_DIR="$HOME/.nvm"

# Async function
function load_nvm() {
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

if [[ -f ./.nvmrc ]]; then
	load_nvm
	nvm use
else
	# Call `load_nvm` in async worker
	async_start_worker nvm_worker -n
	async_register_callback nvm_worker load_nvm
	async_job nvm_worker sleep 0.1
fi

fpath+=$HOME/.zsh/pure
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

# Enable FZF stuff in terminal
# Like ctrl-r history search
source $HOME/.fzf.zsh
