local dapui = require('dapui')
local dap = require('dap')

dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 1
        },
      },
      position = "left",
      size = 50
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "bottom",
      size = 5
    },
  },
})
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {
  text = '⬤',
  texthl = 'ErrorMsg',
  linehl = '',
  numhl = 'ErrorMsg'
})

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/Softwares/vscode-php-debug/out/phpDebug.js' }
}

-- Configured locally in .nvimrc to customize paths
-- dap.configurations.php = {
--   {
--     type = 'php',
--     request = 'launch',
--     name = 'Listen for Xdebug',
--     port = 9003,
--     serverSourceRoot = '/app/',
--     localSourceRoot = '/path/to/project',
--   }
-- }
