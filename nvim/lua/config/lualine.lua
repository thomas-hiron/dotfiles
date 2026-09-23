require ('lualine').setup {
  sections = {
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {
      'filetype',
    },
  },
}

