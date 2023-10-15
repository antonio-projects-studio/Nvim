-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("n", "l", function() require('alpha').press() end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "A-q", "<Esc>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-v>", '"+p')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

if not vim.g.vscode then
	vim.keymap.set("n", "<leader>pa", ":Alpha <CR>")
	vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
	vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
	vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
	vim.keymap.set("n", "<S-q>", ":Bdelete<CR>")
	vim.keymap.set("n", "<leader>c", ":lua B.st()<CR>")
	vim.keymap.set("n", "<leader>w", ":FormatWrite<CR>")
	vim.keymap.set("n", "<leader>xx", ":!pip freeze > requirements.txt")
	vim.keymap.set("n", "<leader>xc", ":!pip install -r requirements.txt")
	vim.cmd("au BufEnter * NeoRoot")

	local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }
	vim.keymap.set("n", "<Leader>p", function()
		vim.cmd("NeoRootSwitchMode")
	end, NOREF_NOERR_TRUNC)
	vim.keymap.set("n", "<Leader>pre", function()
		vim.cmd("NeoRootChange")
	end, NOREF_NOERR_TRUNC)
end

-- vim.g.dashboard_preview_command = "chafa -c 256 --fg-only --symbols braille"
-- vim.g.dashboard_preview_file = "LAINHADN3.gif"
