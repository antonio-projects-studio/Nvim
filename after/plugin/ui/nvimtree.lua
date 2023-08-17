require("nvim-tree").setup({
	sync_root_with_cwd = true,
	prefer_startup_root = true,
	-- reload_on_bufenter = true,
	respect_buf_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 30,
		hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
				{ key = "h", action = "close_node" },
				{ key = "v", action = "vsplit" },
				{ key = "c", action = "cd" },
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_label = ":t",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			glyphs = {
				folder = {
					default = "",
					open = "",
					empty_open = "",
					empty = "",
					symlink = "",
				},
			},
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
	tab = {
		sync = {
			close = true,
		},
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd("quit")
		end
	end,
})
-- auto_reload_on_write = false,
-- disable_netrw = false,
-- hijack_cursor = false,
-- hijack_netrw = true,
-- sort_by = "name",
-- root_dirs = {},
-- open_on_tab = false,
-- }``
--

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- vim.g.nvim_tree_icons = {
--     folder = {
--         default = "",
--         open = "",
--         empty_open = "",
--         empty = "",
--         symlink = "",
--     }
-- }
