local is_ok, lualine = pcall(require, "lualine")
if not is_ok then
	return
end

lualine.setup({
	options = {
		theme = "tokyonight",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = " ", right = "" },
	},
	sections = {
		lualine_c = {
			{ "filename", path = 1 },  -- 显示相对路径，使用 path = 2 显示绝对路径
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = '', -- e712
					dos = '', -- e70f
					mac = "", -- e711
				},
			},
			"encoding",
			"filetype",
		},
	},
})

