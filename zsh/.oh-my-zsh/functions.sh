# Clones repo, cds into it, and opens it in your text editor
clone(){
  local FOLDER=""
  if [ "$#" -gt "1" ]; then
    FOLDER=$2
  else
    FOLDER=$(echo $1 | grep -o "[^\/]*\.git$" | sed s/\.git//)
  fi;

  git clone $1 $FOLDER
  cd $FOLDER
  atom .
}

# Create a new directory and enter it
mkd() {
  mkdir -p "$@" && cd "$_";
}

cptoct(){
  scp $1 clairitech:~/website/$1
}

