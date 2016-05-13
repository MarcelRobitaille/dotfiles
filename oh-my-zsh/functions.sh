# Prints colours. Nuff said.
colourtest(){
    for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; printf "\e[0m\n";
}

# Clones repo, cds into it, and opens it in your text editor
clone(){
	local FOLDER=""
	if [ "$#" -gt "1" ]; then
		FOLDER=$2
	elif; then
		FOLDER=$(echo $1 | grep -o "[^\/]*\.git$" | sed s/\.git//)
	fi;

	git clone $1 $FOLDER
	cd $FOLDER
	$EDITOR_CLI .
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# `git commit -m "<message>"` without the need for ""
cm(){
	git commit -m "$*"
}

# Same as previous but with -a
cam(){
	git commit -am "$*"
}
