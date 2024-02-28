require ('lualine').setup {
  sections = {
    lualine_a = {
      {
        'buffers',
        show_modified_status = false,
        max_length = vim.o.columns * 9 / 10,
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {},
  },
}

