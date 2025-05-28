require("config.lazy")

require("lazy-lsp").setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  excluded_servers = {
    "marksman", "ltex", "ccls", "sourcekit", "zk",
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

    ccls = {
      cache = {
        directory = "/tmp/.ccls-cache";
      };
    },

-- try to disable following lsp, but don't work
--    marksman = { manager = nil },
--    markdown = { manager = nil },
--    ltex = { manager = nil },
--    ltex_ls = { manager = nil },
--    ltexls = { manager = nil },
--    ccls = { manager = nil },
  },
}

-- try to disable following lsp, but don't work
-- local lspconfig = require('lspconfig')
-- -- Disable ccls if it was previously set up
-- if lspconfig.ccls then
--   lspconfig.ccls.manager = nil
-- end
-- if lspconfig.sourcekit then
--   lspconfig.sourcekit.manager = nil
-- end
-- if lspconfig.marksman then
--   lspconfig.marksman.manager = nil
-- end


require("autocommands")


-- nvim fold code block
-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#minimal-configuration
-- https://www.ericapisani.dev/how-to-install-nvim-ufo-in-lazyvim-to-enable-foldable-code-blocks/
-- Keymaps:
--  zc: collapse one block
--  zo: open one block
--  zR: collapse all blocks
--  zM: open all blocks
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()



--------------- Custom Configs ---------------

-- Indent using 2 spaces
vim.opt.tabstop = 4      -- Always 4 (see :h tabstop)
vim.opt.softtabstop = 2  -- What you expecting
vim.opt.shiftwidth = 2   -- What you expecting
vim.opt.expandtab = true -- Always use space

-- Show line number
vim.opt.number = true
-- vim.opt.relativenumber = true -- relative line number around cursor

-- Enable copy selected content to clipboard outside of nvim
--  shortcut: "+Y
vim.api.nvim_set_option("clipboard", "unnamed")

-- shortcut follow links in neovim: gx


-- :terminal, :term mode Keymaps
-- exit mode via <ESC> & <Ctrl-[>
-- just like how to exit insert mode in normal file
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap = false})
vim.api.nvim_set_keymap("t", "<C-[>", "<C-\\><C-n>", {noremap = false})
-- Go back to editer after terminal session ends (via "exit" command)
-- Recommand to use :term mode with :split mode


-- :split, :sp window in NeoVim
-- can be invoke via command or keyboard shortcuts:
--    * split vertical:    <Ctrl-W>+<S>
--    * split horizontal:  <Ctrl-W>+<V>






