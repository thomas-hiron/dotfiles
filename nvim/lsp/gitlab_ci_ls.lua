local cache_dir = vim.uv.os_homedir() .. '/.cache/gitlab-ci-ls/'

---@type vim.lsp.Config
return {
  cmd = { 'gitlab-ci-ls' },
  filetypes = { 'yaml.gitlab' },
  root_dir = function(_, on_dir)
    on_dir(vim.fn.getcwd())
  end,
  init_options = {
    cache_path = cache_dir,
    log_path = cache_dir .. '/log/gitlab-ci-ls.log',
  },
}
