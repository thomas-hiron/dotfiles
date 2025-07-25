local cmp = require('cmp')
local lspkind = require('lspkind')

-- vim.lsp.set_log_level('debug')

-- Define floating windows borders
vim.cmd([[
  highlight NormalFloat guibg=#ffffff guifg=#444444
  highlight FloatBorder guibg=#ffffff guifg=#444444
]])

-- LSP hover borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      before = function (entry, vim_item)
        if entry.source.name == 'behat' then
          vim_item.kind = '🎓 Behat'
        elseif entry.source.name == 'dotenv' then
          vim_item.kind = '󰀫 Env'
        elseif entry.source.name == 'html_class' then
          vim_item.kind = '📌 Class'
        elseif entry.source.name == 'symfony_routes' then
          vim_item.kind = '🛣️ Route'
        elseif entry.source.name == 'symfony_translations' then
          vim_item.kind = '🔤 Translation'
        elseif entry.source.name == 'twig' then
          vim_item.kind = '🌾 Twig'
        elseif entry.source.name == 'twig_constants' then
          vim_item.kind = '🌾 Twig constant'
        elseif entry.source.name == 'twig_templates' then
          vim_item.kind = '🌾 Twig template'
        elseif entry.source.name == 'form_options' then
          vim_item.kind = '📋 Form options'
        end

        return vim_item
      end
    }),
  },
  -- Autocomplete borders
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
      { name = 'behat' },
      { name = 'html_class' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'form_options' },
      { name = 'symfony_routes' },
      { name = 'symfony_translations' },
      { name = 'twig' },
      { name = 'twig_constants' },
      { name = 'twig_templates' },
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').bashls.setup {
  capabilities = capabilities
}

require('lspconfig').docker_compose_language_service.setup {
  capabilities = capabilities
}

require('lspconfig').dockerls.setup {
  capabilities = capabilities
}

require('lspconfig').emmet_language_server.setup {
  filetypes = { "css", "html", "sass", "scss", "twig" },
  capabilities = capabilities
}

require('lspconfig').gitlab_ci_ls.setup {
  capabilities = capabilities
}

require('lspconfig').intelephense.setup {
  capabilities = capabilities,
  init_options = {
    licenceKey = ""
  },
  settings = {
    -- https://github.com/bmewburn/vscode-intelephense/issues/1253
    intelephense = {
      references = {
        exclude = {}
      }
    }
}
}

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
}

require('lspconfig').nginx_language_server.setup {
  capabilities = capabilities
}

-- require('lspconfig').cucumber_language_server.setup {
--   capabilities = capabilities,
--   settings = {
--     cucumber = {
--       features = { 'behat/**/*.feature' },
--       glue = { 'vendor/friends-of-behat/mink-extension/src/Behat/MinkExtension/Context/**/*.php' },
--     },
--   }
-- }

require('lspconfig').ruby_lsp.setup {
  capabilities = capabilities,
}

require('lspconfig').tailwindcss.setup {
  capabilities = capabilities,
  filetypes = {
    'twig'
  }
}

require('lspconfig').ts_ls.setup {
  capabilities = capabilities
}

require('lspconfig').yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      validate = false,
    },
  }
}
