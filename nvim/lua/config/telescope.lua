local lga_actions = require("telescope-live-grep-args.actions")

-- Display filename first, found here: https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filename_first(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

-- Temp workaround to append a live grep arg: see https://github.com/nvim-telescope/telescope-live-grep-args.nvim/pull/59
local function append_prompt(opts)
  local action_state = require("telescope.actions.state")

  return function(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local prompt = picker:_get_prompt()

    prompt = vim.trim(prompt)
    picker:set_prompt(prompt .. opts.postfix)
  end
end

local function flash(prompt_bufnr)
  require("flash").jump({
    pattern = "^",
    label = {
      after = {0, 0},
    },
    search = {
      mode = "search",
      exclude = {
        function(win)
          return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
        end,
      },
    },
    action = function(match)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      picker:set_selection(match.pos[1] - 1)
      require('telescope.actions').select_default(prompt_bufnr)
    end,
  })
end

require('telescope').setup {
  defaults = {
    cache_picker = {
      num_pickers = 100,
    },
    file_ignore_patterns = {
      ".git",
      "sdk",
    },
    layout_config = {
      width = 0.95
    },
    mappings = {
      i = {
        ['<c-s>'] = flash,
        ['<esc>'] = require('telescope.actions').close,
      }
    },
    path_display = filename_first,
    preview = {
      filesize_limit = 0.05,
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-f>"] = append_prompt({ postfix = " -F " }),
          ["<C-i>"] = append_prompt({ postfix = " --ignore-case " }),
          ["<C-n>"] = append_prompt({ postfix = " --no-ignore " }),
          ["<C-h>"] = append_prompt({ postfix = " --hidden " }),
          ["<C-t>"] = append_prompt({ postfix = " -t" }),
          ["<C-p>"] = append_prompt({ postfix = " -tphp" }),
          ["<C-c>"] = append_prompt({ postfix = " --case-sensitive" }),
        }
      }
    }
  }
}
require'telescope-all-recent'.setup{}
require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
require("telescope").load_extension("yank_history")
