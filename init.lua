require("config.lazy")

require("autocommands")


-- nvim fold code block
-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#minimal-configuration
-- https://www.ericapisani.dev/how-to-install-nvim-ufo-in-lazyvim-to-enable-foldable-code-blocks/
-- Keymaps:
--  zc: collapse one block
--  zo: open one block
--  zM: collapse all blocks
--  zR: open all blocks
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


-- toggle modifiable mode
-- via command line argument, vim -M filename to turn on
-- via vim command, :set ma for turn on and :set noma for turn off

-- :terminal, :term mode Keymaps
-- press <i> to insert command
-- exit mode via <ESC> & <Ctrl-[>
-- just like how to exit insert mode in normal file
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap = false})
vim.api.nvim_set_keymap("t", "<C-[>", "<C-\\><C-n>", {noremap = false})
-- Go back to editer after terminal session ends (via "exit" command)
-- Recommand to use :term mode with :split mode


-- :split, :sp window in NeoVim
-- can be invoke via command or keyboard shortcuts:
--    * split vertical:    <Ctrl-W>+<s>, or :sp, :sp filename
--    * split horizontal:  <Ctrl-W>+<v>, or :vs, :vs filename
--    * move across windows, just like how to move cursor:
--        <Ctrl-W>+<h>
--        <Ctrl-W>+<j>
--        <Ctrl-W>+<k>
--        <Ctrl-W>+<l>


-- :new, :vne split a new empty buffer in split window
-- :new split vertically
-- :vne split horizontally


-- :tabnew, :tabnew filename, :tabe open file in a new tab
-- can switch tab via <g>+<t> forward or <g>+<T> backword
-- :tabnew open a new empty buffer in new tab
-- :tabnew filename open the specified file in new tab
-- :tabf filename open the specified file in new tab






