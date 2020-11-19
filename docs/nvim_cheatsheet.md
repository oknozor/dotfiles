# Nvim cheatsheet

# Foreword

This is not an exhaustive vim cheatsheet, common vim actions are not listed here. 
My vim `<leader>` is `,` it's refered as capital L in the current document. 

## Navigation

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| All     | Normal mode               | `jk`                     | 
| Normal  | Toggle search hilight     | `F2`                     | 
| Normal  | Previous tab              | `ArrowLeft` or `L+j`     | 
| Normal  | Next tab                  | `ArrowRight` or `L+k`    | 
| Normal  | New tab                   | `L+t`                    | 
| Normal  | New window horizontal     | `L+h`                    | 
| Normal  | New window vertical       | `L+v`                    | 
| Normal  | Scroll down               | `Ctrl+f`,`Alt+j`         | 
| Normal  | Scroll up                 | `Crtl+b`,`Alt+k`         | 
| Normal  | Next buffer               | `Alt+h`                  | 
| Normal  | Previous buffer           | `Alt+l`                  | 
| All     | Focus window left         | `Ctrl+h`                 | 
| All     | Focus window down         | `Ctrl+j`                 | 
| All     | Focus window up           | `Ctrl+k`                 | 
| All     | Focus window right        | `Ctrl+l`                 | 
| Normal  | Jump to previous location | `Ctrl+o`                 | 
| Normal  | Jump to next location     | `Ctrl+i`                 | 
| Normal  | Open Nerdtree             | `Ctrl+n`                 | 
| Normal  | Move forward a word       | `Ctrl+Space`             | 

## Nvim terminal

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Insert  | Terminal: Normal mode     |  `Esc`                   | 
| Normal  | Open terminal             |  `L+x`                   | 

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
| Normal  | Edit   `$NVIMRC`          | `L+ev`                   |
| Normal  | Source `$NVIMRC`          | `L+sv`                   |
| Normal  | Edit   `$SHELL_RC`        | `L+ez`                   |
| Normal  | Source `$SHELL_RC`        | `L+sz`                   |

## Finder

| Modes   | Action                    |  Keymap                  |
|:---     | :-----                    | -------:                 | 
| Normal  | Search files              | `L+f`                    | 
| Normal  | Search all  (ripgrep)     | `L+n`                    | 

## LSP  

See [coc.nvim documentation](https://github.com/neoclide/coc.nvim/wiki/Language-servers) to install additional language servers. 
Current dotfiles comes with [rust-analyser](https://rust-analyzer.github.io/)

| Modes   | Action                              |  Keymap                  |
|:---     | :-----                              | -------:                 | 
| Normal  | Display symbol documentation        | `K`                      | 
| Normal  | Search symbols                      | `L+N`, `Space+s`         | 
| Normal  | Go to definition                    | `gd`                     | 
| Normal  | Interactive reference list          | `gr`                     | 
| Normal  | Interactive implementation list     | `gi`                     | 
| Normal  | Rename variable                     | `rn`                     | 
| Normal  | Scroll forward floating window      | `Ctrl+f`                 | 
| Normal  | Scroll backward floating window     | `Ctrl+b`                 | 
| Normal  | Select region (press multiple)      | `Ctrl+s`                 | 
| Normal  | List code diagnostics interactive   | `Space+a`                | 
| Normal  | Coc command interactive             | `Space+c`                | 
| Normal  | Outline (much like idea "structure")| `Space+o`                | 
| Normal  | Resume last list                    | `Space+p`                | 
| Insert  | Open autocompletion                 | `Ctrl+Space`             | 
| Insert  | Autocompletion forward selection    | `Tab`                    |  
| Insert  | Autocompletion backward selection   | `Shift+Tab`              |  
| Insert  | Autocompletion apply selection      | `Enter`                  |  


