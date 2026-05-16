local function find_usages()
  vim.cmd("YAMLYankKey")

  -- Wait 100 ms to let cmd finish
  vim.defer_fn(function()
    local key = vim.fn.getreg('"') .. ' -- -ttwig -tphp -w'

    if key and key ~= "" then
      require('fzf-lua.providers.grep').live_grep({regex = key})
    end
  end, 100)
end

return {
  find_usages = find_usages,
}
