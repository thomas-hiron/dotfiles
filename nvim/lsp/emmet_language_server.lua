---@type vim.lsp.Config
return {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = {
    "css",
    "html",
    "sass",
    "scss",
    "twig",
  },
  root_markers = { '.git' },
}
