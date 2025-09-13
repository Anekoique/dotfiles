return {
  "m00qek/baleia.nvim",
  version = "*",
  config = function()
    -- 设置 baleia 并创建全局变量
    local baleia = require("baleia").setup({
      name = "AnsiColor",     -- 自定义高亮组名前缀
      strip_ansi_codes = true, -- 保留原始 ANSI 代码
      async = true,            -- 异步处理提高性能
      log = "WARN",            -- 日志级别
    })
    vim.g.baleia = baleia

    -- 创建用户命令
    vim.api.nvim_create_user_command("Colorize", function()
      baleia.once(vim.api.nvim_get_current_buf())
    end, { bang = true })

    -- 自动为日志文件着色
    vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
      pattern = { "*.log", "*.txt" },
      callback = function()
        baleia.automatically(vim.api.nvim_get_current_buf())
      end,
    })
  end
}
