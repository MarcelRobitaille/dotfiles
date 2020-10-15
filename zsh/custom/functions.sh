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
			deactivate
		fi
	fi

	# If nvm function declared and pwd has .nvmrc
	if declare -f nvm > /dev/null && [[ -f ./.nvmrc ]]; then
		nvm use
	fi
}
chpwd
