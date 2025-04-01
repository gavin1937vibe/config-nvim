return {
  "dundalek/lazy-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lazy-lsp").setup {
      require'lspconfig'.pyright.setup{},

      require'lspconfig'.marksman.setup{
        filetypes = {
          "marksman",
          "markdown",
        },
      },
      require'lspconfig'.ltex.setup{
        filetypes = {
          "marksman",
          "markdown",
        },
      },
    }
  end
}
