local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M = {}

---table that defines the look and layout of the prompt
local center_prompt = {
	layout_strategy = "vertical",
	layout_config = {
		height = 10,
		width = 0.3,
		prompt_position = "top",
	},
	sorting_strategy = "ascending",
}

---takes the current entry and switches to that style
---@param prompt_bufnr number buffer number of the prompt
local function enter(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	vim.cmd.colorscheme(selected[1])
	actions.close(prompt_bufnr)
end

---options to call telescope with
local opts = {
	finder = finders.new_table({
		"nightfox",
		"carbonfox",
		"dawnfox",
		"dayfox",
		"duskfox",
		"nordfox",
		"terafox",
		"rose-pine",
		"gruvbox",
		"tokyonight-night",
		"tokyonight-storm",
		"tokyonight-day",
		"tokyonight-moon",
	}),
	prompt_title = "Antonio",
	results_title = "colorscheme",
	sorter = sorters.get_fzy_sorter({}),
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	attach_mappings = function(_, map)
		map("i", "<CR>", enter)
		map("n", "<CR>", enter)
		return true
	end,
}

---find styles using telesope
M.find = function()
	local colors = pickers.new(center_prompt, opts)
	colors:find()
end

local theme = require("last-color").recall() or "rose-pine"
vim.cmd(("colorscheme %s"):format(theme))

-- M.Transparent = function (a)
--      vim.api.nvim_set_hl(a, "Normal", { bg = "none" })
--      vim.api.nvim_set_hl(a, "NormalFloat", { bg = "none" })
--  end

return M
