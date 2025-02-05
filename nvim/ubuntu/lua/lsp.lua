-- Note: The order matters: mason -> mason-lspconfig -> lspconfig
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = { "pyright", "lua_ls" },
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer
local lspconfig = require("lspconfig")

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>s", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.name == "rust_analyzer" then
		-- This requires Neovim 0.10 or later
		vim.lsp.inlay_hint.enable()
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({
			async = true,
			-- Only request null-ls for formatting
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end, bufopts)
end

-- How to add a LSP for a specific programming language?
-- 1. Use `:Mason` to install the corresponding LSP.
-- 2. Add the configuration below. The syntax is `lspconfig.<name>.setup(...)`
-- Hint (find <name> here) : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.pyright.setup({
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			format = {
				enable = true,
				defaultConfig = {
					index_size = "space",
					indent_size = "4",
				},
			},
		},
	},
})

lspconfig.bashls.setup({})

-- source: https://rust-analyzer.github.io/manual.html#nvim-lsp
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
})

lspconfig.ocamllsp.setup({
	on_attach = on_attach,
})

lspconfig.ruby_lsp.setup({
	on_attach = on_attach,
})

-- For CMake User (assumption: ./build is the build directory)
--     $ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
--     $ ln -s ./build/compile_commands.json .
-- If you don't use any build tool
--     Put compile_commands.json in the root directory of your project
--     The compile_commands.json contains *build flags* (-I ...)
-- see: https://clangd.llvm.org/installation#compile_commandsjson
lspconfig.clangd.setup({
	on_attach = on_attach,
})

-- vim.diagnostic.config({
-- 	virtual_text = true,
-- 	signs = true,
-- 	-- 在输入模式下也更新提示，设置为 true 也许会影响性能
-- 	update_in_insert = true,
-- })
vim.diagnostic.config({
	virtual_text = true, -- 保持虚拟文本
	signs = true, -- 显示错误标志
	update_in_insert = true, -- 在插入模式下更新诊断
	float = {
		show_header = true, -- 显示诊断的头部信息
		source = "always", -- 显示错误来源
		border = "rounded", -- 使用圆角边框
		focusable = false, -- 禁止在浮动窗口中移动光标
		style = "minimal", -- 简化样式
		max_width = 80, -- 限制浮动窗口的最大宽度
		wrap = true, -- 启用自动换行
	},
})

local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
