return {
  -- Go language support
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(lp, opts)
      -- setup your go.nvim
      -- make sure lsp_cfg is disabled
      require('go').setup{
        lsp_cfg = false,
        -- 禁用go.nvim的键盘映射
        keymaps = false,
        lsp_keymaps = false,
        -- 如果上面的选项不起作用，可以尝试这个
        -- disable_defaults = true,
        -- other setups...
      }
      
      local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup
      
      require('lspconfig').gopls.setup(cfg)
    end,
  },
}