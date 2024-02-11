set hidden
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
set nocompatible
set scrolloff=3
set number relativenumber
set nrformats-=octal
set formatoptions-=t " do not automaticcaly wrap text when typing
filetype on
filetype indent on
set mouse=a
let mapleader = ","
let g:better_whitespace_enabled=0 " Disable trailing whitespaces highlight, works with ntpeters/vim-better-whitespace

" Allow project specific .vimrc
set exrc
set secure

" Telescope mapping
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep_args<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
vnoremap <leader>fv <cmd>lua require("telescope-live-grep-args.shortcuts").grep_visual_selection()<cr>
nnoremap <leader>fw <cmd>lua require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap gs <cmd>Telescope lsp_document_symbols<cr>

" LSP mapping
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ra <cmd>lua vim.lsp.buf.code_action()<cr>

" Tree maping
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>
nnoremap <leader>tr <cmd>NvimTreeRefresh<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

nnoremap œ :bprevious<cr>
nnoremap æ :bprevious<cr>
nnoremap â :bdelete<cr>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Global plugins
Plug 'akinsho/toggleterm.nvim'
Plug 'alvan/vim-php-manual'
Plug 'andymass/vim-matchup'
Plug 'folke/which-key.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'RRethy/vim-illuminate'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'stevearc/dressing.nvim'
Plug 'windwp/nvim-autopairs'

" Aucomplete plugins
Plug 'hrsh7th/cmp-buffer' " Autocomplete with words in current buffer
Plug 'hrsh7th/cmp-nvim-lsp' " LSP integration
Plug 'hrsh7th/cmp-path' " Autocomplete for system path
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim' " Additional contextual menu info

" Snippets plugins
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets' " Multi language code snippets

" Theme plugins
Plug 'sainnhe/edge'

" Mason
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

call plug#end()

if has('nvim')
  lua require('config')
endif
