require'treesitter-context'.setup {
  multiline_threshold = 1,
}

-- Go to upward context
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
