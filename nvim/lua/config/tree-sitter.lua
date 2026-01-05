local filetypes = {
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
  "scss",
  "twig",
  "vim",
  "vimdoc",
  "vue",
  "yaml",
}

require'nvim-treesitter'.install(filetypes)

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
