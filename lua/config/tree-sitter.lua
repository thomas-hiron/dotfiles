require'nvim-treesitter'.setup {}
require'nvim-treesitter.configs'.setup {
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
