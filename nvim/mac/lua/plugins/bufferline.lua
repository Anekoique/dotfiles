return {
  "akinsho/bufferline.nvim",
  init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = {" ", " "},
    },
    highlights = {
      buffer_selected = { italic = false, bold = false },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
