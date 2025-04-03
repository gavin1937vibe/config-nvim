return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- Render markdown file by default
    -- vim commands:
    --    :RenderMarkdown           (same as enable)
    --    :RenderMarkdown enable
    --    :RenderMarkdown disable
    --    :RenderMarkdown toggle
    -- more in plugin RAEDME:
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#commands
    enabled = true,
  },
}
