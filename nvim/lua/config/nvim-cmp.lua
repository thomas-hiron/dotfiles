local cmp = require('cmp')
local lspkind = require('lspkind')

-- Define floating windows borders
vim.o.winborder = 'rounded'
vim.cmd([[
  highlight NormalFloat guibg=#ffffff guifg=#444444
  highlight FloatBorder guibg=#ffffff guifg=#444444
]])

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
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
      { name = 'form_options' },
      { name = 'symfony_routes' },
      { name = 'symfony_translations' },
      { name = 'twig' },
      { name = 'twig_constants' },
      { name = 'twig_templates' },
    })
})
