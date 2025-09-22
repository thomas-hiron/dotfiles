return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json' },
  init_options = {
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
