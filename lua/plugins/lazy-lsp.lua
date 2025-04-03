return {
  "dundalek/lazy-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lazy-lsp").setup {
      require'lspconfig'.pyright.setup{},
      require'lspconfig'.clangd.setup{},



      require'lspconfig'.ccls.setup {
        -- -- try disable ccls, but don't work
        -- enable = false,
        init_options = {
          -- move cache folder to /tmp/ to avoid it being everywhere
          cache = {
            directory = "/tmp/.ccls-cache";
          };
        }
      },
--      require'lspconfig'.sourcekit.setup {
--        enable = false, -- try disable ccls, but don't work
--      },
--      require'lspconfig'.marksman.setup {
--        enable = false, -- try disable ccls, but don't work
--      },
--      require'lspconfig'.ltex.setup {
--        enable = false, -- try disable ccls, but don't work
--      },
    }
  end
}
