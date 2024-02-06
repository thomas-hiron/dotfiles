# Full configuration for neovim

## Prerequisites
- [ripgrep](https://github.com/BurntSushi/ripgrep): for telescope search
- [nerdfonts](https://www.nerdfonts.com/): specificaly Hack Nerd Font
- PHP and Composer for phpactor
- [phpactor](https://github.com/phpactor/phpactor) for the nvim plugin

## Installation
Clone this project into `$XDG_CONFIG_HOME/nvim` and symlink `.vimrc` to home directory.  
Then simply run `:PlugInstall`.

## Installed plugins
- [vim-plug](https://github.com/junegunn/vim-plug)
- [telescope](https://github.com/nvim-telescope/telescope.nvim): with telescope-fzf-native
- [tree](https://github.com/nvim-tree/nvim-tree.lua): with [web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter): run also `:TSUpdate php` to install PHP language
- [lspconfig](https://phpactor.readthedocs.io/en/master/lsp/vim.html): PHP LSP
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): entire autocomplete feature

## Installing a new plugin
1. Add the new plugin (with Plug) in the `.vimrc` inside the `plug` block.
2. Run `:PlugInstall`
3. If configuration is necessary, create a lua file in `lua/config`
4. Require it in `lua/config/init.lua`
