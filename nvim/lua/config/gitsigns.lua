require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gw', function()
      if vim.wo.diff then return '<leader>gw' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr = true, desc = 'Go to previous hunk'})

    map('n', '<leader>gx', function()
      if vim.wo.diff then return '<leader>gx' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = 'Go to next hunk'})

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, {desc = 'Add this hunk to the staging area'})
    map('n', '<leader>gr', gs.reset_hunk, {desc = 'Remove this hunk'})
    map('n', '<leader>gS', gs.stage_buffer, {desc = 'Add all buffer hunks to the staging area'})
    map('n', '<leader>gR', gs.reset_buffer, {desc = 'Remove all buffer hunks'})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
