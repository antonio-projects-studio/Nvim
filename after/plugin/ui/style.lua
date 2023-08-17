local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

B = {}

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
	actions.close(prompt_bufnr)
	vim.api.nvim_command(":Styler " .. selected[1])
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

B.st = function()
	local colors = pickers.new(center_prompt, opts)
	colors:find()
end
