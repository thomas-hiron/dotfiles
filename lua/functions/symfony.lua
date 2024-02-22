local function open_symfony_controller()
  local word = vim.fn.expand('<cword>')
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
      local filepath = string.gsub(controller, '^App', 'src'):gsub('\\\\', '/'):gsub('::.+', '') .. '.php'
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

local function open_webpack_entrypoint()
  -- Get whole line under cursor
  local cursorLine = vim.api.nvim_get_current_line()

  -- Get text inside quotes
  local path = string.match(cursorLine, "'.+'"):gsub("'", '')

  local fileType = string.match(path, '^css') and 'css' or 'js'

  -- Remove file type
  local realPath = string.gsub(path, '^'..fileType, '')

  local extension = (fileType == 'css') and '.scss' or '.js'

  -- Open the file
  vim.cmd('edit assets/'..fileType..'/entrypoint/'..realPath..extension)
end


return {
  open_symfony_controller = open_symfony_controller,
  open_webpack_entrypoint = open_webpack_entrypoint,
}
