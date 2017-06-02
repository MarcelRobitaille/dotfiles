| key               | vim          | tmux          | bspwm                <td>**Notes**
|-------------------|--------------|---------------|------------------
| <kbd>\`</kbd>     | `:e #\<CR>`  | `last-window` | `bspc node -f last`  <td>
| <kbd>{</kbd>      | `:bp\<CR>`   |               |                      <td rowspan=4>Note: vim and tmux use <kbd>{</kbd> and <kbd>}</kbd> to switch buffers/windows. bspwm uses <kbd>[</kbd> and <kbd>]</kbd> to change desktops and <kbd>{</kbd> and <kbd>}</kbd> to move nodes to the previous and next desktop respectively. The reason for this is to avoid conflicts in vim and tmux.
| <kbd>}</kbd>      | `:bn\<CR>`   |               |                            
| <kbd>[</kbd>      | -            | -             | `desktop -f prev`
| <kbd>]</kbd>      | -            | -             | `desktop -f next`

