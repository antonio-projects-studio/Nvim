-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

local packer = require('packer')
packer.init({
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/' .. 'packer_compiled.lua',
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or, branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--Dressing(select)
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	})
	--Transparent
	use("xiyaowong/nvim-transparent")

	-- Lastcolor
	use({ "raddari/last-color.nvim" })

	-- Colorsheme
	use("folke/tokyonight.nvim")

	use({ "ellisonleao/gruvbox.nvim" })

	use({ "catppuccin/nvim", as = "catppuccin" })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use("EdenEast/nightfox.nvim")

	require("alpha.term")
	use({
		"folke/styler.nvim",
		config = function()
			require("styler").setup({
				themes = {
					markdown = { colorscheme = "gruvbox" },
					help = { colorscheme = "catppuccin-mocha", background = "dark" },
				},
			})
		end,
	})

	--Needs
	use({
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	})
	--Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("nvim-treesitter.configs").setup({
				context_commentstring = {
					enable = true,
				},
			})
		end,
	})
	--Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	--Bufferbye
	use("famiu/bufdelete.nvim")

	--Treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	--LSP
	use({
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v1.x",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" }, -- Required
				{ "williamboman/mason.nvim" }, -- Optional
				{ "williamboman/mason-lspconfig.nvim" }, -- Optional

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" }, -- Required
				{ "hrsh7th/cmp-nvim-lsp" }, -- Required
				{ "hrsh7th/cmp-buffer" }, -- Optional
				{ "hrsh7th/cmp-path" }, -- Optional
				{ "saadparwaiz1/cmp_luasnip" }, -- Optional
				{ "hrsh7th/cmp-nvim-lua" }, -- Optional

				-- Snippets
				{ "L3MON4D3/LuaSnip" }, -- Required
				{ "rafamadriz/friendly-snippets" }, -- Optional
			},
		},
		"folke/lsp-colors.nvim", --Support color group
		"nvim-tree/nvim-web-devicons", --Support icons
		{
			"folke/trouble.nvim",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					action_keys = {
						jump = { "l" },
					},
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		},
		{ "mhartington/formatter.nvim" },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	--Indent This plugin adds indentation guides to all lines (including empty lines).
	use({
		"lucastavaresa/simpleIndentGuides.nvim",
		config = function()
			vim.opt.list = true -- enable in all buffers
			require("simpleIndentGuides").setup("┊", "·")
		end,
	})

	-- Nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Terminal
	use("numToStr/FTerm.nvim")

	--use 'erietz/vim-terminator'

	--Dashboard

	use({
		"goolord/alpha-nvim",
	})
	--Debugger
	use("mfussenegger/nvim-dap")
	use("jay-babu/mason-nvim-dap.nvim")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
	})

	use({
		"nyngwang/NeoRoot.lua",
		config = function()
			require("neo-root").setup({
				CUR_MODE = 2, -- 1 for file/buffer mode, 2 for proj-mode
			})
		end,
	})
	-- Git
	use("tpope/vim-fugitive")
	-- python virtual enviroments
	use("AckslD/swenv.nvim")

    -- highlights for .log_file
    use("mtdl9/vim-log-highlighting")
end)
