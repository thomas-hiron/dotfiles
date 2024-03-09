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
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]a"] = "@parameter.inner",
      },
      goto_previous_start = {
        ["[a"] = "@parameter.inner",
      },
    },
  },
}
