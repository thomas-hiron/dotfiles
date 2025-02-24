require'nvim-treesitter'.setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "dockerfile",
    "html",
    "javascript",
    "lua",
    "make",
    "markdown",
    "php",
    "ruby",
    "twig",
    "vim",
    "vimdoc",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
