local function find_usages()
  vim.cmd("YAMLYankKey")

  -- Wait 100 ms to let cmd finish
  vim.defer_fn(function()
    local key = '"' .. vim.fn.getreg('"') .. '" -ttwig -tphp'

    if key and key ~= "" then
      require('telescope').extensions.live_grep_args.live_grep_args({default_text = key})
    end
  end, 100)
end

return {
  find_usages = find_usages,
}
