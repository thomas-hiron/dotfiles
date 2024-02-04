# Full configuration for neovim

## Prerequisites
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [nerdfonts](https://www.nerdfonts.com/): specificaly Hack Nerd Font

## Installation
Clone this project into `$XDG_CONFIG_HOME/nvim` and symlink `.vimrc` to home directory.  
Then simply run `:PlugInstall`.

## Installed plugins
- [vim-plug](https://github.com/junegunn/vim-plug)
- [telescope](https://github.com/nvim-telescope/telescope.nvim): with telescope-fzf-native
- [tree](https://github.com/nvim-tree/nvim-tree.lua): with [web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## Installing a new plugin
1. Add the new plugin (with Plug) in the `.vimrc` inside the `plug` block.
2. Run `:PlugInstall`
3. If configuration is necessary, create a lua file in `lua/config`
4. Require it in `lua/config/init.lua`
