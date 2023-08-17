vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C-q>", '<C-\\><C-n><CMD>lua require("FTerm").exit()<CR>')
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
local terminal = require("FTerm")
terminal.setup({
	border = "rounded",
	dimensions = {
		height = 0.5,
		width = 1,
		y = 1,
	},
	blend = 0,
})
