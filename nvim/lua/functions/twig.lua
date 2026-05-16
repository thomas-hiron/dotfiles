local function find_usages()
  local filepath = vim.fn.expand('%'):gsub("templates/", "")
  require('fzf-lua.providers.grep').live_grep({search = filepath})
end

return {
  find_usages = find_usages,
}
