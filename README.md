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

* `psalm` - only supports diagnostics & goto definition, doesn't support symbol list and refactoring
* `intellephense` - incorrect parent class detection
* `phpactor` - supports goto, symbols, refactoring
