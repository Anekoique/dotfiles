local is_ok, tokyonight = pcall(require, 'tokyonight')
if not is_ok then
    return
end

tokyonight.setup({
	style = "storm", -- 选择风格: storm, night, 或 day
	light_style = "storm",
	transparent = false, -- 是否启用透明背景
	terminal_colors = true, -- 是否设置终端颜色
	styles = {
	comments = { italic = true },
	keywords = { italic = false },
	functions = {},
	variables = {},
	},
	sidebars = { "qf", "help" }, -- 为特定窗口设置侧边栏背景
	lualine_bold = true, -- 是否使 lualine 加粗
	on_colors = function(colors)
		colors.bg = "#07080d"
		colors.blue = "#bdd1fb"
		colors.orange = "#fcb183"
		colors.NvimTreeNormal = {
			bg = "#07080d",
			fg = "#a9b1d6"
		}
	end,
	on_highlights = function(hl, c)
		hl.TabLineFill = { bg = "#07080d" } -- 标签栏空白区域
        
		hl.NvimTreeNormal = { bg = "#07080d"}
		hl.NvimTreeNormalNC = { bg = "#07080d"}
		hl.NvimTreeWinSeparator = { bg = "#07080d", fg = "#383c4a" } -- fg 是边框颜色，可以根据需要调整
        -- hl.NvimTreeNormal = { bg = "NONE"}
        -- hl.NvimTreeNormalNC = { bg = "NONE"}
        -- hl.NvimTreeWinSeparator = { bg = "NONE", fg = "#383c4a" } -- fg 是边框颜色，可以根据需要调整              		
        hl.ColorColumn = { bg = "NONE" }
        hl.CursorLine = { bg = "#2f313d" }
        -- dap-ui 高亮配置
        hl.DapUIPlayPause = { fg = c.green, bg = c.blue }
        hl.DapUIRestart = { fg = c.orange, bg = c.blue }
        hl.DapUIStop = { fg = c.red, bg = c.blue }
        hl.DapUIStepOver = { fg = c.blue, bg = c.blue }
        hl.DapUIStepInto = { fg = c.cyan, bg = c.blue }
        hl.DapUIStepOut = { fg = c.purple, bg = c.blue }
        hl.DapUIStepBack = { fg = c.yellow, bg = c.blue }
        hl.DapUIUnavailable = { fg = c.gray, bg = c.blue }

        -- dap-ui 边框等其他元素
        hl.DapUIFloatBorder = { fg = c.blue, bg = c.blue }
        hl.DapUIWatchesValue = { fg = c.green, bg = c.blue }
        
	end,
})
vim.cmd([[colorscheme tokyonight]])
