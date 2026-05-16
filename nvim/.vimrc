set hidden
nnoremap <Up> :resize -10<cr>
nnoremap <Down> :resize +10<cr>
nnoremap <Left> :vertical resize -10<cr>
nnoremap <Right> :vertical resize +10<cr>
set nocompatible
set scrolloff=3
set number relativenumber
set nrformats-=octal
set nrformats+=unsigned
set formatoptions-=t " do not automatically wrap text when typing
set textwidth=0 " do not automatically wrap text when typing
set splitbelow
set splitright
filetype on
filetype indent on
set mouse=a
let mapleader = ","

" Indent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab shiftround autoindent " Indentation configuration
autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Highlight yanked text
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }

set signcolumn=yes " Always show the sign column

" List chars displayed as guides
set list
set listchars=
set listchars+=tab:<->
set listchars+=eol:¬
set listchars+=trail:⋅
set listchars+=lead:⋅
set listchars+=nbsp:‗

" Allow project specific .vimrc
set exrc
set secure

" Easymotion
let g:EasyMotion_do_mapping = 0
nnoremap <leader>k <cmd>lua require("flash").jump()<cr>

" FzfLua mapping
nnoremap <space>f <cmd>FzfLua files<cr>
nnoremap <space>a <cmd>FzfLua files fd_opts='--no-ignore'<cr>
" Find exact file under cursor
nnoremap <expr> <space>d ':FzfLua files<cr>' . "'" . expand('<cword>')
" Live grep with current nvim-tree directory
nnoremap <silent> <leader>fz :lua require('fzf-lua').live_grep({cwd = require("nvim-tree.api").tree.get_node_under_cursor().absolute_path})<cr>
nnoremap <space>g <cmd>FzfLua live_grep<cr>
nnoremap <space>b <cmd>FzfLua buffers<cr>
nnoremap <space>o <cmd>FzfLua oldfiles<cr>
nnoremap <space>s <cmd>FzfLua resume<cr>
vnoremap <space>v <cmd>FzfLua grep_visual<cr>
nnoremap <space>y <cmd>lua Snacks.picker.yanky()<cr>
nnoremap <expr> <space>w ':FzfLua live_grep<cr>' . expand('<cword>')
nnoremap gd <cmd>lua require("fzf-lua").lsp_definitions({ jump1 = true })<cr>
nnoremap gr <cmd>lua require("fzf-lua").lsp_references({ jump1 = true, includeDeclaration = false })<cr>
nnoremap gi <cmd>FzfLua lsp_implementations<cr>
nnoremap gss <cmd>FzfLua lsp_document_symbols<cr>
nnoremap gsm <cmd>FzfLua lsp_document_symbols regex_filter=Method]<cr>
nnoremap gsp <cmd>FzfLua lsp_document_symbols regex_filter=Property]<cr>

" LSP mapping
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ra <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <leader>ra <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>d <cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>

" Tree maping
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>
nnoremap <leader>tr <cmd>NvimTreeRefresh<cr>

" Git
nnoremap <leader>gb <cmd>Git blame<cr>

" Argonaut
xnoremap ia :<C-U>ArgonautObject inner<CR>
onoremap ia :<C-U>ArgonautObject inner<CR>
xnoremap aa :<C-U>ArgonautObject outer<CR>
onoremap aa :<C-U>ArgonautObject outer<CR>

" Symfony
nnoremap <leader>s <cmd>SymfonyGoto<cr>
nnoremap <leader>se <cmd>SymfonyFindEventListeners<cr>
command! -nargs=1 SymfonyGotoRouteView call general#GotoTwigView(<f-args>)
command! -nargs=1 SymfonyGotoFormType call general#GotoFormType(<f-args>)

cnoreabbrev sg SymfonyGotoRoute
cnoreabbrev sv SymfonyGotoRouteView
cnoreabbrev st SymfonyGotoFormType
inoreabbrev emi EntityManagerInterface

" Snippets
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Buffers
nmap <C-J> <cmd>BufferPrevious<cr>
nmap <C-K> <cmd>BufferNext<cr>
nnoremap <leader>bc <cmd>BufferClose<cr>
nnoremap <leader>br <cmd>BufferRestore<cr>
nnoremap <leader>bp <cmd>BufferPick<cr>
nnoremap <leader>bxl <cmd>BufferCloseBuffersLeft<cr>
nnoremap <leader>bxr <cmd>BufferCloseBuffersRight<cr>
nnoremap <leader>bxo <cmd>BufferCloseAllButCurrent<cr>
nnoremap <leader>bml <cmd>BufferMovePrevious<cr>
nnoremap <leader>bmr <cmd>BufferMoveNext<cr>

" Dap
nnoremap <leader>db <cmd>DapToggleBreakpoint<cr>
nnoremap <leader>dn <cmd>DapNew<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>do <cmd>DapStepOut<cr>
nnoremap <leader>dv <cmd>DapStepOver<cr>
nnoremap <leader>du <cmd>lua require('dapui').toggle()<cr>

" Others
nnoremap J mzJ`z " Keep the cursor in place while joining lines
map q: :q
nnoremap <leader>w <cmd>ArgonautToggle<cr>
nnoremap <leader>mp <cmd>MarkdownPreview<cr>
nnoremap <leader>yk <cmd>YAMLYankKey<cr>
nnoremap <leader>yv <cmd>YAMLYankValue<cr>
nnoremap <leader>yy :%y+"<cr>
nnoremap â :bdelete<cr>
nnoremap ç :cprev<cr>
nnoremap å :cnext<cr>
nnoremap <C-l> :noh<cr>
nnoremap <leader>o :only<cr>

" autocmd
if has('nvim')
  set cursorline

  autocmd BufReadPost * call general#RestoreCursorPosition()
  autocmd BufWrite *.php,*.js,*.twig,*.html,*.sh,*.yaml,*.yml,*.vim,*.lua,*.feature call general#DeleteTrailingSpace()
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
end

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Global plugins
Plug 'alvan/vim-php-manual'
Plug 'https://git.sr.ht/~foosoft/argonaut.nvim'
Plug 'https://tangled.org/cuducos.me/yaml.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'folke/flash.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/snacks.nvim'
Plug 'gbprod/yanky.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'ibhagwan/fzf-lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'romgrk/barbar.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'stevearc/dressing.nvim'
Plug 'thomas-hiron/symfony-goto.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Aucomplete plugins
Plug 'hrsh7th/cmp-buffer' " Autocomplete with words in current buffer
Plug 'hrsh7th/cmp-nvim-lsp' " LSP integration
Plug 'hrsh7th/cmp-path' " Autocomplete for system path
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim' " Additional contextual menu info
Plug 'thomas-hiron/cmp-symfony'

" Snippets plugins
Plug 'hrsh7th/vim-vsnip'
Plug 'SirVer/ultisnips'

" Theme plugins
Plug 'sainnhe/edge'

" Mason
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'mason-org/mason.nvim'

" Dap
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

if has('nvim')
  lua require('config')

  " Enable diagnostics
  lua vim.diagnostic.config({ virtual_text = true })
endif
