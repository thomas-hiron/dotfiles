require'nvim-treesitter'.setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "make",
    "php",
    "ruby",
    "twig",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  matchup = {
    enable = true
  }
}
