vim.opt.runtimepath:append("/snap/nvim/2809/usr/share/nvim/runtime")

require("nvim-treesitter.configs").setup({
	-- parser_install_dir = "/snap/nvim/2809/usr/share/nvim/runtime",

	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { "c", "javascript", "vim" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	autopair = {
		enable = true,
	},

	-- ignore_install = { "lua" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		disable = { "lua" },

		-- Setting this to true will run `:h syntax` and tre-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
