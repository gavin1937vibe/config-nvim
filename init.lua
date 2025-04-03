require("config.lazy")

require("lazy-lsp").setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  excluded_servers = {
    "marksman", "ltex", "ccls", "zk",
  },
  -- Alternatively specify preferred servers for a filetype (others will be ignored).
  preferred_servers = {
    python = { "pyright" },
    cpp = { "clangd" },
    c = { "clangd" },
  },
  prefer_local = true, -- Prefer locally installed servers over nix-shell
  -- Default config passed to all servers to specify on_attach callback and other options.
  default_config = {
    flags = {
      debounce_text_changes = 150,
    },
    -- on_attach = on_attach,
    -- capabilities = capabilities,
  },
  -- Override config for specific servers that will passed down to lspconfig setup.
  -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
  configs = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    },
  },
}


require("autocommands")


--------------- Custom Configs ---------------

-- Indent using 2 spaces
vim.opt.tabstop = 4 -- Always 4 (see :h tabstop)
vim.opt.softtabstop = 2 -- What you expecting
vim.opt.shiftwidth = 2 -- What you expecting
vim.opt.expandtab = true -- Always use space

-- Show line number
vim.opt.number = true
-- vim.opt.relativenumber = true -- relative line number around cursor





