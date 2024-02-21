# Full configuration for neovim

This configuration is optimized for a PHP environment.  
Javascript, Yaml, Twig, Json, Behat, CS are also needed.

## Prerequisites
- [ripgrep](https://github.com/BurntSushi/ripgrep): for telescope search
- [nerdfonts](https://www.nerdfonts.com/): specificaly Hack Nerd Font
- Node (with NPM) for tsserver and others LSP
- PHP and Composer for phpactor
- [phpactor](https://github.com/phpactor/phpactor) for the nvim plugin

## Installation
Clone this project into `$XDG_CONFIG_HOME/nvim` and symlink `.vimrc` to home directory.  
Then simply run `:PlugInstall`.

## Installed plugins
- [dressing](https://github.com/stevearc/dressing.nvim): vim.ui interface
- [edge](https://github.com/sainnhe/edge): color theme
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim): simple git integration
- [lspconfig](https://github.com/neovim/nvim-lspconfig): multi LSP preconfigurations
- [mason](https://github.com/williamboman/mason.nvim): easy LSP integration with lspconfig (with mason-lspconfig)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): entire autocomplete feature
- [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim): status line
- [quickfix-reflector](https://github.com/stefandtw/quickfix-reflector.vim): edit quickfix list
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
  - [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim): better file search
  - [telescope-live-grep-args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim): usage of rg args
- [toggleterm](https://github.com/akinsho/toggleterm.nvim): terminal
- [tree](https://github.com/nvim-tree/nvim-tree.lua): with [web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace): trim trailings whitespaces on save
- [vim-expand-region](https://github.com/terryma/vim-expand-region): increasingly expand visual region
- [vim-fugitive](https://github.com/tpope/vim-fugitive): mostly for git blame
- [vim-illuminate](https://github.com/RRethy/vim-illuminate): match words under cursor
- [vim-matchup](https://github.com/andymass/vim-matchup): syntax matching plugin
- [vim-plug](https://github.com/junegunn/vim-plug)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): language pack plugin
- [which-key](https://github.com/folke/which-key.nvim)

## Installing a new plugin
1. Add the new plugin (with Plug) in the `.vimrc` inside the `plug` block.
2. Run `:PlugInstall`
3. If configuration is necessary, create a lua file in `lua/config`
4. Require it in `lua/config/init.lua`

## Installed tree-sitter parsers
- html
- javascript
- make
- php
- twig
- yaml

Install parsers with this command:
```vim
:TSInstall javascript
:TSInstall make
```

## LSP
Installing a LSP is made easy with mason-lspconfig, just run the following command to install a LSP:  
```vim
:LspInstall phpactor
:LspInstall yamlls
:LspInstall tsserver
```

The corresponding LSP are attached in `lua/config/nvim-cmp.lua`.

## PHPActor configuration
Symlink `phpactor.json` to `$XDG_CONFIG_HOME/phpactor`, and make sure the config file is loaded:
```bash
phpactor status
```

![PHPActor status](docs/phpactor_status.jpg)

## Troubleshooting

### LSP
`:LspInfo` gives great infos about errors of LSP not correctly setup

### Telescope FZF
If fzf fails to install, go to the plugin dir `$XDG_CONFIG_HOME/nvim/plugged/telescope-fzf-native.nvim` and run make: 
```bash
make
```
