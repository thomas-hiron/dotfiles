require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, {desc = 'Add this hunk to the staging area'})
    map('n', '<leader>gr', gs.reset_hunk, {desc = 'Remove this hunk'})
    map('n', '<leader>gS', gs.stage_buffer, {desc = 'Add all buffer hunks to the staging area'})
    map('n', '<leader>gR', gs.reset_buffer, {desc = 'Remove all buffer hunks'})
    map('n', '<leader>gb', gs.toggle_current_line_blame, {desc = 'Show current line blame'})
    map('n', '<leader>gB', function() gs.blame_line{full=true} end, {desc = 'Show current line full blame'})
    map('n', '<leader>gd', gs.diffthis, {desc = 'Show git diff for current buffer'})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
