-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local Util = require("lazyvim.util")

-- 去掉 <leader><leader> 来搜索文件的映射，转移到 lazy.lua 中去去除
-- unmap("n", "<leader><space>", { desc = "Find Files (root dir)" })
-- remove the mapping of <leader>w
-- map("n", "<leader>q", "<cmd>q<cr>", { desc = "Faster \[Q\]uit" })
-- map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Faster \[W\]rite" })
unmap("n", "<leader>w", { desc = "Windows" }) -- This is optional, does not has the real effect, the effective code is located in which-key.lua file
unmap("n", "<leader>wd", { desc = "Windows" })
unmap("n", "<leader>wm", { desc = "Windows" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current change", remap = true })

unmap("n", "<leader>l", { desc = "Lazy" })

-- toggle color between 雷姆蓝 and 拉姆粉
local color_switch = 0
local function toggle_color()
  if color_switch == 1 then
    color_switch = 0
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")
  else
    color_switch = 1
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#91bef0")
  end
end
map("n", "<leader><leader>t", function()
  toggle_color()
end, { desc = "Toggle gui cursor color" })

-- for hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader leader w
map({ "n", "v" }, "<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader leader e
map({ "n", "v" }, "<leader><leader>e", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any end of words" })
-- leader leader b
map({ "n", "v" }, "<leader><leader>b", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })
-- leader leader v
map({ "n", "v" }, "<leader><leader>v", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any end of words" })
-- leader leader l
map({ "n", "v" }, "<leader><leader>l", function()
  hop.hint_camel_case({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })
-- leader leader h
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })

-- suppress useless warning here
---@diagnostic disable: missing-fields
-- leader leader a
map({ "n", "v" }, "<leader><leader>a", function()
  hop.hint_anywhere({})
end, { desc = "Go to any char" })
---@diagnostic enable: missing-fields

-- leader leader j
map({ "n", "v" }, "<leader><leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader leader k
map({ "n", "v" }, "<leader><leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })

map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "tt", ':tabnew<CR>', { desc = "new tab"})
map('n', 't1', '1gt', { noremap = true, silent = true })
map('n', 't2', '2gt', { noremap = true, silent = true })
map('n', 't3', '3gt', { noremap = true, silent = true })
map('n', 't4', '4gt', { noremap = true, silent = true })
map('n', 't5', '5gt', { noremap = true, silent = true })
map('n', 't6', '6gt', { noremap = true, silent = true })

map("n", "<leader>v", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Close current buffer" })

-- toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })

-- programming language about
-- run single python codes
map("n", "<leader>py", '<cmd>TermExec cmd="python %"<cr>', { desc = "Run python codes" })
-- run single cmake codes
map("n", "<leader>rc", '<cmd>TermExec cmd="cmake -P %"<cr>', { desc = "Run cmake codes" })
-- execute "cargo run"
map("n", "<leader>ru", '<cmd>TermExec cmd="cargo run"<cr>', { desc = "Run cargo codes" })

-- 移动 buffer
local moveBy = function(dir)
  if dir == "left" then
    dir = -1
  else
    dir = 1
  end
  local moveBy = vim.v.count
  if moveBy == 0 then
    moveBy = 1
  end
  local myBufferline = require("bufferline")
  for _ = 1, moveBy, 1 do
    myBufferline.move(dir)
  end
end

vim.keymap.set("n", "<b", function()
  moveBy("left")
end, { desc = "Move current buffer to left" })
vim.keymap.set("n", ">b", function()
  moveBy("right")
end, { desc = "Move current buffer to right" })

-- for persisted
map("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Search history sessions" })

-- for cancel of highlight
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "Cancel highlight" })

-- lsp about
-- unmap("n", "<leader>cl") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>ca", { desc = "Code Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cA", { desc = "Source Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cr") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cm") -- 这个在 mason 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>cF") -- 这个在 conform 插件配置中进行取消映射

unmap("n", "<leader>cd")
unmap({ "n", "v" }, "<leader>cf")

map("n", "<leader>lA", function()
  vim.lsp.buf.code_ac({
    context = {
      only = {
        "source",
      },
      diagnostics = {},
    },
  })
end, { desc = "Source Action" })

map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- formatting
if vim.g.vscode then
  map("n", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>", { desc = "Format" })
  map("v", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>", { desc = "Format" })
else
  map({ "n", "v" }, "<leader>lf", function()
    Util.format({ force = true })
  end, { desc = "Format" })
end

map({ "n", "v" }, "<leader>lF", function()
  require("conform").format({ formatters = { "injected" } })
end, { desc = "Format Injected Langs" })

map("n", "<leader>ll", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

map("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })
if require("lazyvim.util").has("inc-rename.nvim") then
  map("n", "<leader>lr", function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "Rename" })
else
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
end

-- 解决 visual 选中粘贴替换只能粘贴一次的问题
map("x", "p", "P")

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<c-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<c-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<c-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
  vim.keymap.set("n", "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
  vim.keymap.set("v", "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
  vim.keymap.set({ "i", "c" }, "<C-S-v>", "<C-r>+", { desc = "Paste from clipboard" })
end

function ClearTerm(reset)
  -- notice here: 0 is invalid, so we need to use 1
  vim.opt_local.scrollback = 1
  vim.api.nvim_command("startinsert")
  if reset == 1 then
    vim.api.nvim_feedkeys("reset", "t", false)
  else
    vim.api.nvim_feedkeys("clear", "t", false)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cr>", true, false, true), "t", true)
  vim.opt_local.scrollback = 10000
end
map("t", "<C-S-l>", function()
  ClearTerm()
end, { desc = "Clear terminal buffer" })

-- transfer from ubuntu
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

map("n", "<C-]>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<C-[>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<C-Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
-- oo
map("n", "oo", "o<ESC>k", opt)

map("n", "<C-q>", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

map("n", "H", "^", opt)
map("n", "L", "$", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "8k", opt)
map("n", "<C-d>", "8j", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)

map("n", "<leader>w", ":Colorize<CR>", { noremap = true, silent = true })
