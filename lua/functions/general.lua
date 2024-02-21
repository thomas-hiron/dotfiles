_G.restoreCursorPosition = function()
  if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
    vim.cmd([[normal! g`"]])
  end
end
