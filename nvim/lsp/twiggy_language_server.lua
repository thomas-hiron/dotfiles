---@type vim.lsp.Config
return {
  cmd = { 'twiggy-language-server', '--stdio' },
  -- filetypes copied and adjusted from tailwindcss-intellisense
  filetypes = {
    'twig',
  },
  root_markers = { 'composer.json', '.git' },
}
