local status, bufferline = pcall(require, "bufferline")
	if not status then
	    vim.notify("没有找到 bufferline")
	  return
	end

bufferline.setup({
	options = {
		mode = "buffers",
		themable = true,
		separator_style = "thin",
		close_command = "bdelete! %d",       -- 点击关闭按钮关闭
		right_mouse_command = "bdelete! %d", -- 右键点击关闭
		indicator = {
			icon = '▎', -- 分割线
		},
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false, -- only applies to coc
		diagnostics_update_on_event = true, -- use nvim's diagnostic handler
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
            end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer" ,
				text_align = "center",
				separator = true,
			}
		},
		hover = {
            enabled = true,
            reveal = {'close'}
        },
		groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " })
            }
        }
	},
})

