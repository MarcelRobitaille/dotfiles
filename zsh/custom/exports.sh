export PATH="/usr/lib/jvm/java-7-openjdk/bin/:$PATH"
export PATH="/usr/local/bin:"
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="/usr/bin/env nvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export CHEATCOLORS=true
export CHERE_INVOKING=1
export TERM=tmux-256color

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
  {%@@ for folder in standard_ignored_folders @@%}
  --ignore {{@@ folder @@}} \
  {%@@ endfor @@%}
  {%@@ for file in standard_ignored_files @@%}
  --ignore "{{@@ file @@}}" \
  {%@@ endfor @@%}
  -g ""'

export GTK_THEME={{@@ gtk_theme @@}}
export GTK_ICON_THEME={{@@ gtk_theme @@}}

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

export PATH="/home/marcel/.gem/ruby/2.7.0/bin:$PATH"


#
# Weechat
#

export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

export PASSWORD_STORE_ENABLE_EXTENSIONS=true


#
# Ripgrep
#

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"


#
# Man
#

export MANPAGER="nvim -c 'set ft=man' -"


#
# Fast Node Manager
#

(command -v fnm &> /dev/null) && eval "$(fnm env)"


#
# Android studio
#

export ANDROID_HOME=~/.android-sdk
