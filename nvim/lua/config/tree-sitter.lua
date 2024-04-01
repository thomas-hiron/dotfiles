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
