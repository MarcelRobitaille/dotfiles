#   ____                      _      _   _
#  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __  ___
# | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \/ __|
# | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | \__ \
#  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|___/
#                      |_|
#
# ZSH completions that don't fit anywhere else
# For example, associated with a file in bin/, thus do not fit in functions.sh

# Overwrite tmuxinator's default completions
# I only ever want to tab-complete a profile. It should not be slow. I don't
# want stupid spec/blah/blah
_tmuxinator_custom() {
	profiles=( ${(uf)"$(find $HOME/.tmuxinator/ -type f -exec basename -s .yml {} ';')"} )

	_describe 'profile' profiles
}
compdef _tmuxinator_custom tmuxinator

zstyle ':completion:*:*:latex_rm:*:*' file-patterns '*.tex:latex-files'
