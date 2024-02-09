local lga_actions = require("telescope-live-grep-args.actions")

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      ".git",
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
