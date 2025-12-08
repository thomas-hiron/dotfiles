return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json' },
  init_options = {
  },
  settings = {
    intelephense = {
      -- Full config: https://github.com/bmewburn/vscode-intelephense/blob/master/package.json
      completion = {
        propertyCase = "camel"
      },
      -- https://github.com/bmewburn/vscode-intelephense/issues/1253
      references = {
        exclude = {}
      }
    }
  }
}
