-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-l>"] = cmp.mapping.confirm({ select = true }),
	["<C-h>"] = cmp.mapping.complete(),
	["<Up>"] = vim.NIL,
	["<Down>"] = vim.NIL,
})

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})
lsp.setup()

vim.diagnostic.config({
	virtual_text = { spacing = 10, prefix = "󰄛 " },
	signs = true,
	update_in_insert = false,
	underline = false,
	severity_sort = false,
	float = true,
})

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
