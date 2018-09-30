export PATH="/home/marcel/bin/:/usr/bin:/usr/local/bin:/usr/lib/jvm/java-7-openjdk/bin/:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="/usr/sbin/vim"
export VISUAL="/usr/sbin/vim"
export CHEATCOLORS=true
export CHERE_INVOKING=1
export TERM=xterm-256color

# Prevent "Couldn't connect to accessibility bus" warnings
export NO_AT_BRIDGE=1

export NODE_ENV=development

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export FZF_DEFAULT_COMMAND='ag -l \
  --nocolor \
  --hidden \
  --follow \
  --skip-vcs-ignores \
  --ignore .git \
  --ignore node_modules \
  --ignore public \
  --ignore build \
  --ignore vendor \
  --ignore env \
  --ignore __pycache__ \
  -g ""'

export KEYTIMEOUT=1


#
# Less
#

export LESS=-XFr

#
# NPM
#

NPM_PACKAGES="/home/marcel/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"


#
# Ruby
#

export PATH="$PATH:/home/marcel/.gem/ruby/2.4.0/bin"


#
# Weechat
#

export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

