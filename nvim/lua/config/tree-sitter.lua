require'nvim-treesitter'.setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "php",
    "query",
    "ruby",
    "twig",
    "vim",
    "vimdoc",
    "vue",
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
