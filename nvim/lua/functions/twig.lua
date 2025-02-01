local function find_usages()
  local filepath = vim.fn.expand('%'):gsub("templates/", "")
  require('telescope').extensions.live_grep_args.live_grep_args({default_text = filepath})
end

return {
  find_usages = find_usages,
}
