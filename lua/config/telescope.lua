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

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      ".git",
    },
    mappings = {
      n = {
        ['þ'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['þ'] = require('telescope.actions').delete_buffer
      }
    },
    path_display = filename_first
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
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-n>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
          ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
          ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
        }
      }
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
