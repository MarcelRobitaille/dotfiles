```
         __      __  _____ __
    ____/ /___  / /_/ __(_) /__  _____
   / __  / __ \/ __/ /_/ / / _ \/ ___/
 _/ /_/ / /_/ / /_/ __/ / /  __(__  )
(_)__,_/\____/\__/_/ /_/_/\___/____/
```

# My `.dotfiles`, managed by [dotdrop](https://github.com/deadc0de6/dotdrop)

## Encryption

Some sensitive dotfiles are encrypted using [`git-crypt`](https://github.com/AGWA/git-crypt).
These are specified in [`.gitattributes`](./.gitattributes).

## NeoVim

### Debugging

#### Debugging plugin options

```
nvim --cmd 'let g:debug_plugin_settings = 1'
```
