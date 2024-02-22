local function restore_cursor_position()
  if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
    vim.cmd([[normal! g`"]])
  end
end

return {
  restore_cursor_position = restore_cursor_position,
}
