local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      before = function (entry, vim_item)
        if entry.source.name == 'symfony_routes' then
          vim_item.kind = '🛣️ Route'
        elseif entry.source.name == 'twig' then
          vim_item.kind = '🌾 Twig'
        end

        return vim_item
      end
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = 'vsnip' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'symfony_routes' },
    { name = 'twig' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

require('lspconfig').lua_ls.setup {
  capabilities = capabilities
}

require('lspconfig').nginx_language_server.setup {
  capabilities = capabilities
}

require('lspconfig').phpactor.setup {
  capabilities = capabilities
}

require('lspconfig').tsserver.setup {
  capabilities = capabilities
}
