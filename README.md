# .vimrc

This is a combination of my old VIM settings and newly created NeoVim config 

# neovim

`nvim` folder is supposed to be linked to `~/.config/nvim`

Requirements:

```
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

## Windows

Config should be linked to `~/AppData/Local/nvim`


```
scoop bucket add nerd-fonts
scoop install neovim neovide ripgrep zig FiraCode-NF-Mono 
# for python
scoop install python
```

## Fun

```
:CellularAutomaton make_it_rain
```

# Decision log

## PHP Language server

✅❌

| LSP                 | diagnostic | goto | symbols | refactoring | formatting | problems                         |
|---------------------|------------|------|---------|-------------|------------|----------------------------------|
| psalm               | ✅         | ✅   | ❌      | ❌          |            |                                  |
| intellephense       | ✅         | ✅   | ✅      | 💰          | ✅         | incorrect parent class detection |
| phpactor            | ✅         | ✅   | ✅      | ✅          | ❌         |                                  |
| php-language-server | ✅         | ✅   | ✅      | ❌          | ❌         | not supported since 2018         |
| serenata            | ✅         | ✅   | ✅      | ✅          | ❌         | not supported for 1 year         |
|                     |            |      |         |             |            |                                  |


# Colors to add

See more at 
    https://vimcolorschemes.com/
    https://dotfyle.com/neovim/colorscheme/trending

https://github.com/jacoborus/tender.vim
https://github.com/bluz71/vim-moonfly-colors
https://github.com/savq/melange-nvim
https://github.com/AlexvZyl/nordic.nvim
https://github.com/ayu-theme/ayu-vim

# Colors evaluation

aura-soft-dark-soft-text - diff not visible in neogit
