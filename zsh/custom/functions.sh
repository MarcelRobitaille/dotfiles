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
		return 1
	fi

	filename=$(basename -- "$1")
	extension="${filename##*.}"
	mkdir -p "$(dirname $1)"

	case "${(L)extension}" in
		"png")
			mime="image/png"
			;;
		"jpg" | "jpeg")
			mime="image/jpeg"
			;;
		*)
			echo "Filetype '$extension' is not supoorted"
			return 1
	esac

	xclip -selection clipboard -target $mime -out > "$1"
}

crop_clipboard_image() {
	if [ -z "$1" ]; then
		echo "No file name specified"
		return 1
	fi

	mkdir -p "$(dirname $1)"
	tmpfile="/tmp/$(pwgen 16 1)$(basename $1)"
	save_clipboard_image "$tmpfile" || return 1
	convert -trim "$tmpfile" "$1"
	rm "$tmpfile"
	echo -n "$1" | clip
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

# Copy one folder to another, renaming all files inside to match
# Useful for weekly reports, where the folder and the files inside
# (all the many latex files) include the date
function plagiarise() {

	src=$(basename $1)
	dst=$(basename $2)

	if [ -z $dst ]; then
		echo "No destination"
		return 1
	fi
	if [ -e $dst ]; then
		echo "Destination already exists"
		return 1
	fi
	cp -r $src $dst
	cd $dst
	rename $src $dst *
}
function poster() {
	ffmpeg -i $1 -r 1 -f image2 $2
}

function yay() {
	if [ $(which python) != "/usr/bin/python" ]; then
		echo "Refusing to run in a venv!"
		return 1
	fi
	command yay "$@"
}
