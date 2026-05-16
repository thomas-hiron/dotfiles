require("fzf-lua").setup {
  { "ivy", "hide" },
  defaults = {
    -- https://github.com/ibhagwan/fzf-lua/pull/1255#issuecomment-2163449012
    formatter= { "path.filename_first", 2 }
  },
  files = {
    cwd_prompt = false,
  },
  grep = {
    rg_glob = true,
    rg_glob_fn = function(query, opts)
      local regex, flags = query:match("^(.-)%s%-%-(.*)$")

      return (regex or query), flags
    end,
    winopts = {
      on_create = function(e)
        vim.keymap.set('t', '<c-k>', function() vim.api.nvim_paste(' -- ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-f>', function() vim.api.nvim_paste('-F ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-i>', function() vim.api.nvim_paste('--ignore-case ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-n>', function() vim.api.nvim_paste('--no-ignore ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-t>', function() vim.api.nvim_paste('-t', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-p>', function() vim.api.nvim_paste('-tphp ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-c>', function() vim.api.nvim_paste('--case-sensitive ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-h>', function() vim.api.nvim_paste('--hidden ', false, -1) end, { buffer = e.bufnr })
      end
    },
  },
  oldfiles = {
    cwd_only = true,
    include_current_session = true,
  },
  keymap = {
    builtin = {
      ["<C-d>"]      = "preview-page-down",
      ["<C-t>"]      = "preview-page-up",
    },
    fzf = {
      true,
      -- Use <c-q> to select all items and add them to the quickfix list
      ["ctrl-q"] = "select-all+accept",
    },
  }
}
