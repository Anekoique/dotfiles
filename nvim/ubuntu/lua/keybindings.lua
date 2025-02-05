vim.api.nvim_set_keymap("n", "<F5>", ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F11>", ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "<C-c>", "y", opt)
-- 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>i", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
-- oo
map("n", "oo", "o<ESC>k", opt)
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

-- Lsp
-- rename
map("n", "<leader>r", ":lua vim.lsp.buf.rename<CR>", opt)
-- code action
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
-- go to definition
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
-- show hover
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opt)
-- format
map("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opt)
map("n", "<leader>gg", ":lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "<leader>gr", ":lua vim.lsp.buf.refreences()<CR>", opt)

map("n", "qw", ":bdelete<CR>", { noremap = true, silent = true })
map("n", "<C-]>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<C-p>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
-- 依此类推，直到最大标签数量

map("n", "<ESC>", "<ESC>", opt)

map("n", "<C-c>", "y", opt)
map("n", "<F5>", ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
map("n", "<F2>", ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
map("n", "<F3>", ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
map("n", "<F4>", ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })

-- DAP UI 快捷键
map("n", "<leader>y", '<cmd>lua require"dapui".eval()<CR>', opt)
map("n", "<leader>b", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opt)
map(
	"n",
	"<leader>c",
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("[Condition] > "))<CR>',
	opt
)
map("n", "<leader>u", '<cmd>lua require"dapui".toggle()<CR>', opt)
map("n", "<leader>h", '<cmd>lua require"dap.ui.widgets".hover()<CR>', opt)
map("n", "<leader>s", '<cmd>lua require"dap".session()<CR>', opt)
map("n", "<leader>g", '<cmd>lua require"dap".disconnect()<CR>', opt)
map("n", "<leader>r", '<cmd>lua require"dap".repl.toggle()<CR>', opt)
map("n", "<leader>q", '<cmd>lua require"dap".close()<CR>', opt)
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

map("n", "H", "^", opt)
map("n", "L", "$", opt)

