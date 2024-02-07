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
- [vim-plug](https://github.com/junegunn/vim-plug)
- [telescope](https://github.com/nvim-telescope/telescope.nvim): with telescope-fzf-native
- [tree](https://github.com/nvim-tree/nvim-tree.lua): with [web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [lspconfig](https://phpactor.readthedocs.io/en/master/lsp/vim.html): PHP LSP
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): entire autocomplete feature
- [gruvbox](https://github.com/ellisonleao/gruvbox.nvim): pastel theme
- [mason](https://github.com/williamboman/mason.nvim): easy LSP integration with lspconfig (with mason-lspconfig)

## Installing a new plugin
1. Add the new plugin (with Plug) in the `.vimrc` inside the `plug` block.
2. Run `:PlugInstall`
3. If configuration is necessary, create a lua file in `lua/config`
4. Require it in `lua/config/init.lua`

## Installed tree-sitter parsers
- javascript
- make
- php
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
