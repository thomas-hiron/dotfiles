local function restore_cursor_position()
  if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
    vim.cmd([[normal! g`"]])
  end
end

local function delete_trailing_space()
  vim.cmd([[
    normal mz
    %s/\v\s+$//ge
    normal `z
  ]])
end

return {
  restore_cursor_position = restore_cursor_position,
  delete_trailing_space = delete_trailing_space,
}
