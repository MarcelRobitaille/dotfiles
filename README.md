```
      ██            ██     ████ ██  ██
     ░██           ░██    ░██░ ░░  ░██
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

```

# My dotfiles, managed with GNU stow

```
alacritty (s) ➔ terminal emulator config
bin       (s) ➔ executable scripts
cava      (s) ➔ Console-based Audio Visualizer for ALSA (MPD and Pulseaudio)
compton   (s) ➔ display compositor
cron          ➔ schedule scripts
ctags     (s) ➔ source code indexer
dunst     (s) ➔ notification config and related icons
git       (s) ➔ source control config and aliases
gtk       (s) ➔ custom css for modifying gtk apps
lead      (s) ➔ hot corners
lemonbar      ➔ lemon scented status bars
linters   (s) ➔ source code style checkers
mpd       (s) ➔ music server config
ncmpcpp   (s) ➔ music player config
neofetch  (s) ➔ system info script config
npm       (s) ➔ node package manager config
omzsh         ➔ zsh configuration that shouldn't be symlinked
openbox   (s) ➔ window manager configuration
ranger    (s) ➔ file manager config
redshift  (s) ➔ eye-saving colour temperature adjuster
refind        ➔ backup of my rEFInd config
rofi-pass (s) ➔ rofi frontend for pass by carnager
rofi      (s) ➔ fuzzy launcher
stylish       ➔ custom css for websites
sxhkd     (s) ➔ keybindings
tern      (s) ➔ javascript autocomplete
tint2     (s) ➔ panel
tmux      (s) ➔ terminal multiplexer
vim       (s) ➔ terminal text editor
wpgtk     (s) ➔ wpgtk templates
X         (s) ➔ display server
zathura   (s) ➔ document viewer config
zsh       (s) ➔ shell
```

## Instructions
1. Clone the repo to `~/.dotfiles`.
1. Run `stow` ([gnu stow](https://www.gnu.org/software/stow/)) on all directories marked with `(s)`.
1. Add all files in `cron` to your `crontab` by running `crontab -e`. Set the desired schedule. For more information, see [Cron - ArchWiki](https://wiki.archlinux.org/index.php/Cron#Crontab_format).
1. Update monitor ids in `lead`.
1. Create the file `omzsh/secret.sh` and populate it with the following:
    ```
    export NPM_TOKEN="YOUR_NPM_SECRET_TOEKN"
    ```
1. Copy `refind.conf` to your `refind` directory (`/boot/EFI/BOOT/`) in my case.

### wallpapers
![scrot 15](https://raw.githubusercontent.com/Iambecomeroot/dotfiles/master/scrots/Screenshot_2016-12-31_19-38-33.png)

