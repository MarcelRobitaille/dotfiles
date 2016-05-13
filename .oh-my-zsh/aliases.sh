# Basic functions
alias rm="rm -i"

# Places
alias d="cd ~/Desktop"

# Git
alias g="git "
alias s="git status -s"
alias a="git add "
alias aa="git add -A"
alias ac="git commit -am "
alias c="git commit "
alias cm="git commit -m "
alias p="git push"
alias new="clone git@github.com:Marcel-Robitaille/template.git "

# Misc
alias scan="sudo chmod 666 /dev/bus/usb/$(lsusb | grep Brother | sed s/Bus\ // | sed s:\ Device\ :/: | cut -d':' -f 1 ) && xsane"
alias sql="mysql -u lan -p personal --host 192.168.0.120"
alias starwars="telnet towel.blinkenlights.nl"
alias fonts="fc-cache -fv"
