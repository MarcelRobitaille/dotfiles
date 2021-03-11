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

cptoct(){
	scp $1 clairitech:~/website/$1
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

	# If nvm function declared and pwd has .nvmrc
	if declare -f nvm > /dev/null && [[ -f ./.nvmrc ]]; then
		nvm use
	fi
}
chpwd


# AUR
# Remove pyenv from PATH during yay
# Otherwise, it can install stuff to ~/.pyenv/...
function yay() {
	PATH="$(echo $PATH | tr ':' '\n' | grep -v 'pyenv' | perl -pe 'chomp if eof' | tr '\n' ':')" command yay "$@"
}
