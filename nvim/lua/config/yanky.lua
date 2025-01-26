require("yanky").setup({
  ring = {
    history_length = 100,
    storage = "memory",
  },
  highlight = {
    on_put = false,
    on_yank = false,
  },
})
