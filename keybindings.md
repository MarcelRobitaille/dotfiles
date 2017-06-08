# Cross application keybindings
I spend most of my time in a terminal emulator. For that reason, I have tried to keep the keybindings similar for different terminal applications just with different modifiers. I am often in vim under tmux. I move around in vim more so vim's keybindings don't have a modifier. The alt modifier will trigger a similar command in tmux and the super modifier will trigger it in bspwm. For example: in vim <kbd>\`</kbd> switches to the most recent buffer, in tmux, <kbd>alt-\`</kbd> switches to the most recent window, and in bspwm, <kbd>super-\`</kbd> switches to the most recent workspace.

<table>
  <thead>
    <tr>
      <td><strong>function</strong></td>
      <td><strong>vim</strong></td>
      <td><strong>tmux</strong></td>
      <td><strong>bspwm</strong></td>
      <td><strong>notes</strong></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>last buffer/window/node</td>
      <td><kbd>`</kbd><br><code>:e #\&lt;CR&gt;</code></td>
      <td><kbd>alt-`</kbd><br><code>last-window</code></td>
      <td><kbd>super-`</kbd><br><code>bspc node -f last</code></td>
      <td></td>
    </tr>
    <tr>
      <td>previous buffer/window/desktop</td>
      <td><kbd>{</kbd><br><code>:bp\&lt;CR&gt;</code></td>
      <td><kbd>alt-{</kbd><br><code>previous-window</code></td>
      <td><kbd>supder-[</kbd><br><code>bspc desktop -f prev</code></td>
      <td rowspan=4>vim and tmux use <kbd>{</kbd> and <kbd>}</kbd> to switch buffers/windows. bspwm uses <kbd>[</kbd> and <kbd>]</kbd> to change desktops and <kbd>{</kbd> and <kbd>}</kbd> to move nodes to the previous and next desktop respectively. The reason for this is to avoid conflicts in vim and tmux.</td>
    </tr>
    <tr>
      <td>next buffer/window/desktop</td>
      <td><kbd>}</kbd><br><code>:bn\&lt;CR&gt;</code></td>
      <td><kbd>alt-}</kbd><br><code>next-window</code></td>
      <td><kbd>super-]</kbd><br><code>bspc desktop -f next</code></td>
    </tr>
    <tr>
      <td>move node to previous desktop</td>
      <td>-</td>
      <td>-</td>
      <td><kbd>super-{</kbd><br><code>desktop -f prev</code></td>
    </tr>
    <tr>
      <td>move node to next desktop</td>
      <td>-</td>
      <td>-</td>
      <td><kbd>supder-}</kbd><br><code>desktop -f next</code></td>
    </tr>
    <tr>
      <td>focus pane/node in direction</td>
      <td><kbd>ctrl-{h,j,k,l}</kbd><br><code>&lt;C-w&gt;&lt;C-{h,j,k,l}&gt;</code></td>
      <td><kbd>alt-{h,j,k,l}</kbd><br><code>select-pane -{L,D,U,R}</code></td>
      <td><kbd>super-{h,j,k,l}</kbd><br><code>bspc node -f {west,south,north,east}</code></td>
      <td></td>
    </tr>
    <tr>
      <td>focus nth buffer/window/desktop</td>
      <td><kbd>{0-99}-leader</kbd><br><code>:b {0-99}</code></td>
      <td><kbd>alt-{1-9,0}</kbd><br><code>select-window -t {1-9,10}</code></td>
      <td><kbd>super-{1-9,0}</kbd><br><code>bspc desktop -f '^{1-9,10}'</code></td>
      <td></td>
    </tr>
  </tbody>
</table>

# Vim keybindings
## Vanilla vim
| description                          | keybinding                     |function                                                                          |
|--------------------------------------|--------------------------------|----------------------------------------------------------------------------------|
| hide search results                  | <kbd>leader-/</kbd>            | `:noh`                                                                           |
| close buffer                         | <kbd>leader-q</kbd>            | `:bp<bar>sp<bar>bn<bar>bd<CR>`                                                   |
| empty line without deleting it       | <kbd>leader-dd</kbd>           | `0d$`                                                                            |
| insert single character at cursor    | <kbd>s</kbd>                   | `:<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>`             |
| insert single character after cursor | <kbd>S</kbd>                   | `:<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>`             |

## FZF
| description                          | keybinding                     |function                                                                          |
|--------------------------------------|--------------------------------|----------------------------------------------------------------------------------|
| open fuzzy file finder               | <kbd>ctrl-p</kbd>              | `:FZF`                                                                           |

## NERDTree
| description                          | keybinding                     |function                                                                          |
|--------------------------------------|--------------------------------|----------------------------------------------------------------------------------|
| toggle                               | <kbd>leader-n</kbd>            | `:NERDTreeToggle`                                                                |
