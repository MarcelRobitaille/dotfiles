# Cross application keybindings
I spend most of my time in a terminal emulator. For that reason, I have tried to keep the keybindings similar for different terminal applications just with different modifiers. I am often in vim under tmux. I move around in vim more so vim's keybindings don't have a modifier. The alt modifier will trigger a similar command in tmux and the super modifier will trigger it in bspwm. For example: in vim <kbd>\`</kbd> switches to the most recent buffer, in tmux, <kbd>alt-\`</kbd> switches to the most recent window, and in bspwm, <kbd>super-\`</kbd> switches to the most recent workspace.

<table>
  <thead>
    <tr>
      <td><strong>key</strong></td>
      <td><strong>vim</strong></td>
      <td><strong>tmux</strong></td>
      <td><strong>bspwm</strong></td>
      <td><strong>notes</strong></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><kbd>`</kbd></td>
      <td>edit last buffer<br><code>:e #\&lt;CR&gt;</code></td>
      <td>go to last window<br><code>last-window</code></td>
      <td>go to last node<br><code>bspc node -f last</code></td>
      <td></td>
    </tr>
    <tr>
      <td><kbd>{</kbd></td>
      <td>previous buffer<br><code>:bp\&lt;CR&gt;</code></td>
      <td>previous window<br><code>previous-window</code></td>
      <td>previous desktop<br><code>bspc desktop -f prev</code></td>
      <td rowspan=4>vim and tmux use <kbd>{</kbd> and <kbd>}</kbd> to switch buffers/windows. bspwm uses <kbd>[</kbd> and <kbd>]</kbd> to change desktops and <kbd>{</kbd> and <kbd>}</kbd> to move nodes to the previous and next desktop respectively. The reason for this is to avoid conflicts in vim and tmux.</td>
    </tr>
    <tr>
      <td><kbd>}</kbd></td>
      <td>next buffer<br><code>:bn\&lt;CR&gt;</code></td>
      <td>previous window<br><code>next-window</code></td>
      <td>previous desktop<br><code>bspc desktop -f next</code></td>
    </tr>
    <tr>
      <td><kbd>[</kbd></td>
      <td>-</td>
      <td>-</td>
      <td><code>desktop -f prev</code></td>
    </tr>
    <tr>
      <td><kbd>]</kbd></td>
      <td>-</td>
      <td>-</td>
      <td><code>desktop -f next</code></td>
    </tr>
  </tbody>
</table>

