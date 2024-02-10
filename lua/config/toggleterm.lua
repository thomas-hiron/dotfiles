require('toggleterm').setup {
  open_mapping = [[<leader>te]]
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}

  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Leave terminal mode
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) -- Return to previous buffer
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts) -- Handle Ctrl+W mapping
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
