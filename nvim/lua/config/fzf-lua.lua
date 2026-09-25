local actions = require("fzf-lua.actions")

require("fzf-lua").setup {
  { "ivy", "hide" },
  defaults = {
    -- https://github.com/ibhagwan/fzf-lua/pull/1255#issuecomment-2163449012
    formatter= { "path.filename_first", 2 }
  },
  files = {
    cwd_prompt = false,
    actions = {
      ["ctrl-i"] = { actions.toggle_ignore },
      ["ctrl-h"] = { actions.toggle_hidden },
      ["ctrl-l"] = function()
        local query = require('fzf-lua').get_last_query()
        require('fzf-lua').live_grep({ search = query })
      end,
    },
    fzf_opts = {
      ["--history"] = "/tmp/fzf-files"
    },
  },
  fzf_opts = {
    ["--cycle"] = true,
  },
  grep = {
    rg_glob = true,
    rg_glob_fn = function(query, opts)
      local regex, flags = query:match("^(.-)%s%-%-(.*)$")

      return (regex or query), flags
    end,
    actions = {
      ["ctrl-l"] = function()
        local query = require('fzf-lua').get_last_query()
        require('fzf-lua').files({ query = query })
      end,
    },
    fzf_opts = {
      ["--history"] = "/tmp/fzf-rg"
    },
    winopts = {
      on_create = function(e)
        vim.keymap.set('t', '<c-k>', function() vim.api.nvim_paste(' -- ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-f>', function() vim.api.nvim_paste('-F ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-i>', function() vim.api.nvim_paste('--ignore-case ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-t>', function() vim.api.nvim_paste('-t', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-c>', function() vim.api.nvim_paste('--case-sensitive ', false, -1) end, { buffer = e.bufnr })
        vim.keymap.set('t', '<c-h>', function() vim.api.nvim_paste('--hidden ', false, -1) end, { buffer = e.bufnr })
      end
    },
  },
  oldfiles = {
    cwd_only = true,
    include_current_session = true,
    actions = {
      ["ctrl-l"] = function()
        local query = require('fzf-lua').get_last_query()
        require('fzf-lua').files({ query = query })
      end,
    },
  },
  keymap = {
    builtin = {
      ["<C-d>"]      = "preview-page-down",
      ["<C-u>"]      = "preview-page-up",
    },
    fzf = {
      true,
      -- Use <c-q> to select all items and add them to the quickfix list
      ["ctrl-q"] = "select-all+accept",
    },
  },
}

-- https://theopark.me/blog/2025-04-23-fzf-lua-parent-dir/
-- https://github.com/gbprod/yanky.nvim/blob/main/lua/yanky/picker.lua#L11
-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced#api-basics-fzf_exec

-- vim.keymap.set("n", "<leader>p", function()
--   -- Fill the table with parent directories
--   -- local dirs = {}
--   -- for dir in vim.fs.parents(vim.uv.cwd()) do
--   --   table.insert(dirs, dir)
--   -- end

--   local history = {}
--   for index, value in pairs(require("yanky.history").all()) do
--     -- value.history_index = index
--     table.insert(history, value.regcontents)
--     -- history[index] = value
--   end

--   -- Open a custom fzf to select a directory and launch fzf-files
--   require("fzf-lua").fzf_exec(dirs, {
--     prompt = "Parent Directories ❯ ",
--     actions = {
--       ["default"] = function(selected)
--         require("fzf-lua").files({ cwd = selected[1] })
--       end
--     }
--   })
-- end, { desc = "[S]earch Parent Directories [..]" })
