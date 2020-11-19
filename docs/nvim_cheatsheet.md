# Okno'z nvim cheatsheet

# Foreword

My vim `<leader>` is `,` it's refered as capital L in the current document. 

## Navigation

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| All     | Normal mode               | `jk`                     | 
| Normal  | Toggle search hilight     | `F2`                     | 
| Normal  | Previous tab              | `ArrowLeft` or `L+j`   | 
| Normal  | Next tab                  | `ArrowRight` or `L+k`  | 
| Normal  | New tab                   | `L+t`                  | 
| Normal  | New window horizontal     | `L+h`                  | 
| Normal  | New window vertical       | `L+v`                  | 
| Normal  | Scroll down               | `Alt+j`                  | 
| Normal  | Scroll up                 | `Alt+k`                  | 
| Normal  | Next buffer               | `Alt+h`                  | 
| Normal  | Previous buffer           | `Alt+l`                  | 
| All     | Focus window left         | `Ctrl+h`                 | 
| All     | Focus window down         | `Ctrl+j`                 | 
| All     | Focus window up           | `Ctrl+k`                 | 
| All     | Focus window right        | `Ctrl+l`                 | 

## Nvim terminal

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Insert  | Terminal: Normal mode     |  `Esc`                   | 
| Normal  | Open terminal             |  `L+x`                 | 

##  Edition

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Normal  | Move line down            | `+`                      |
| Normal  | Move line up              | `-`                      |
| Normal  | Surround word with        | `L+" or ' or ` or ( or [ or è or `` (è: for `` ` ``)    |
| Visual  | Surround selection with   | ``L+" or ' or ` or ( or [ or è or `` (è: for `` ` ``)   |
| Normal  | Add to multiple selection | `Ctrl+c`                 |
| Normal  | Smart multiple selection  | `Ctrl+d`                 |

## Quick edit

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Normal  | Edit   `$NVIMRC`          | `L+ev`                 |
| Normal  | Source `$NVIMRC`          | `L+sv`                 |
| Normal  | Edit   `$SHELL_RC`        | `L+ez`                 |
| Normal  | Source `$SHELL_RC`        | `L+sz`                 |

## Finder

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Normal  | Search files              | `L+f`                  | 
| Normal  | Search all  (ripgrep)     | `L+n`                  | 
| Normal  | Search symbols  (LSP required)    | `L+N`                  | 
