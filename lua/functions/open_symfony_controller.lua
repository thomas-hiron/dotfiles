_G.openSymfonyController = function(word)
  local filepath = "./var/cache/dev/url_generating_routes.php"
  local handle = io.open(filepath, "r")
  if not handle then
    vim.api.nvim_echo({{'Could not open routes file: ' .. filepath .. ')', 'WarningMsg'}}, true, {})

    return nil
  end

  for line in handle:lines() do
    -- Search for exact route word
    if string.find(line, "%f[%a]" .. word .. "%f[^%a]") then
      -- Extract controller value
      local controller = string.match(line, "'_controller'%s*=>%s*'([^']+)'")
      -- Transform controller FQCN to path
      local filepath = string.gsub(controller, 'App', 'src'):gsub('\\\\', '/'):gsub('::.+', '') .. '.php'
      -- Get action name
      local action = string.match(controller, "::(.+)")

      if vim.fn.filereadable(filepath) == 1 then
        vim.cmd('edit ' .. filepath)
        vim.fn.search('function ' .. action .. '(', 'b', 0)

        break
      else
        vim.api.nvim_echo({{'Could not open controller (path: ' .. filepath .. ')', 'WarningMsg'}}, true, {})
      end
    end
  end

  handle:close()
end
