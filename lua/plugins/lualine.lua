return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = 'ayu_mirage',
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', colored = true, 'diagnostics'},
        lualine_c = {'filename', path = 1 },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    },
  })
  end,
}
