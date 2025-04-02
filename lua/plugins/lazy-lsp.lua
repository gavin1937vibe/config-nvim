return {
  "dundalek/lazy-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lazy-lsp").setup {
      require'lspconfig'.pyright.setup{},
      require'lspconfig'.clangd.setup{},
    }
  end
}
