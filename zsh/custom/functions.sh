# Clones repo, cds into it, and opens it in your text editor
clone(){
	local FOLDER=""
	if [ "$#" -gt "1" ]; then
	FOLDER=$2
	else
	FOLDER=$(echo $1 | sed 's/\.git$//' | grep -o "[^\/]*$")
	fi

	git clone $1 $FOLDER && cd $FOLDER
}

save_clipboard_image() {
	if [ -z "$1" ]; then
		echo "No file name specified"
	else

		xclip -selection clipboard -target image/png -out > "$1"
	fi
}

crop_clipboard_image() {
	if [ -z "$1" ]; then
		echo "No file name specified"
	else

		tmpfile="/tmp/$(pwgen 16 1)$(basename $1)"
		save_clipboard_image "$tmpfile"
		convert -trim "$tmpfile" "$1"
		rm "$tmpfile"
	fi
}

# Create a new directory and enter it
mkd() {
	mkdir -p "$@" && cd "$_";
}

# https://stackoverflow.com/questions/45216663/how-to-automatically-activate-virtualenvs-when-cding-into-a-directory
function chpwd() {
	if [[ -z "$VIRTUAL_ENV" ]] ; then
		# If venv folder is found then activate the vitualenv
		if [[ -d ./venv ]] ; then
			source ./venv/bin/activate
		fi
	else
	# Check the current folder belong to earlier VIRTUAL_ENV folder
	# if yes then do nothing, else deactivate
		parentdir="$(dirname "$VIRTUAL_ENV")"
		if [[ "$PWD"/ != "$parentdir"/* ]]; then
			source "$VIRTUAL_ENV/bin/activate"
			deactivate
		fi
	fi
}
chpwd


# AUR
# Remove pyenv from PATH during yay
# Otherwise, it can install stuff to ~/.pyenv/...
function yay() {
	ORIG_PATH=$PATH

	function cleanup() {
		export PATH=$ORIG_PATH
	}

	trap cleanup EXIT

	export PATH="$(echo $PATH | tr ':' '\n' | \
		grep --invert-match 'pyenv' | \
		grep --invert-match 'venv' | \
		([[ -n $VIRTUAL_ENV ]] && grep --invert-match $VIRTUAL_ENV || cat) | \
		perl -pe 'chomp if eof' | tr '\n' ':')"
	command yay "$@"
}
