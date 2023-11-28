-- require("alpha").setup(require("alpha.themes.dashboard").config)
local _, alpha = pcall(require, "alpha")
local dashboard = require("alpha.themes.dashboard")

-- Function to retrieve console output
-- local function capture(cmd)
-- 	local handle = assert(io.popen(cmd, "r"))
-- 	local output = assert(handle:read("*a"))
-- 	handle:close()
-- 	return output
-- end

-- local function get_plugins_list()
-- 	local short_name = require("packer.util").get_plugin_short_name
-- 	local list_plugins = require("packer.plugin_utils").list_installed_plugins
--
-- 	local opt, start = list_plugins()
-- 	local plugin_paths = vim.tbl_extend("force", opt, start)
-- 	local plugins = {}
--
-- 	for path in pairs(plugin_paths) do
-- 		local name, _ = short_name({ path }):gsub(".nvim", "")
-- 		table.insert(plugins, name)
-- 	end
--
-- 	table.sort(plugins)
--
-- 	return plugins
-- end
--
-- local function button(sc, txt, keybind, keybind_opts)
-- 	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
--
-- 	local opts = {
-- 		position = "center",
-- 		shortcut = sc,
-- 		cursor = 5,
-- 		width = 30,
-- 		align_shortcut = "right",
-- 		hl_shortcut = "Keyword",
-- 	}
--
-- 	if keybind then
-- 		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
-- 		opts.keymap = { "n", sc_, keybind, keybind_opts }
-- 	end
--
-- 	local function on_press()
-- 		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
-- 		vim.api.nvim_feedkeys(key, "normal", false)
-- 	end
--
-- 	return {
-- 		type = "button",
-- 		val = txt,
-- 		on_press = on_press,
-- 		opts = opts,
-- 	}
-- end

-- Obtain Date Info
-- local date = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
-- local date_info = "󰨲 Today is " .. date:read("*a")
-- date:close()

-- Configuration
local get_fortune = function(fortune_list)
	-- selects an entry from fortune_list randomly
	math.randomseed(os.time())
	if fortune_list == nil then
		local x = math.random(1, 20)
		return string.format(x)
	end
	local ind = math.random(1, #fortune_list)
	return fortune_list[ind]
end

local fortune_list_head = {
	-- {
	-- 	[[* g o a t s e x * g o a t s e x * g o a t s e x *]],
	-- 	[[g                                               g ]],
	-- 	[[o /     \             \            /    \       o ]],
	-- 	[[a|       |             \          |      |      a ]],
	-- 	[[t|       `.             |         |       :     t ]],
	-- 	[[s`        |             |        \|       |     s ]],
	-- 	[[e \       | /       /  \\\   --__ \\       :    e ]],
	-- 	[[x  \      \/   _--~~          ~--__| \     |    x ]],
	-- 	[[*   \      \_-~                    ~-_\    |    * ]],
	-- 	[[g    \_     \        _.--------.______\|   |    g ]],
	-- 	[[o      \     \______// _ ___ _ (_(__>  \   |    o ]],
	-- 	[[a       \   .  C ___)  ______ (_(____>  |  /    a ]],
	-- 	[[t       /\ |   C ____)/      \ (_____>  |_/     t ]],
	-- 	[[s      / /\|   C_____)       |  (___>   /  \    s ]],
	-- 	[[e     |   (   _C_____)\______/  // _/ /     \   e ]],
	-- 	[[x     |    \  |__   \\_________// (__/       |  x ]],
	-- 	[[*    | \    \____)   `----   --'             |  * ]],
	-- 	[[g    |  \_          ___\       /_          _/ | g ]],
	-- 	[[o   |              /    |     |  \            | o ]],
	-- 	[[a   |             |    /       \  \           | a ]],
	-- 	[[t   |          / /    |         |  \           |t ]],
	-- 	[[s   |         / /      \__/\___/    |          |s ]],
	-- 	[[e  |         / /        |    |       |         |e ]],
	-- 	[[x  |          |         |    |       |         |x ]],
	-- 	[[* g o a t s e x * g o a t s e x * g o a t s e x  *]],
	-- },
	{
		[[    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ]],
		[[    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ]],
		[[   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ]],
		[[   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ]],
		[[  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ]],
		[[  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ]],
		[[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ]],
		[[ ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ]],
		[[ ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ]],
		[[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ]],
		[[  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ]],
		[[   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ]],
		[[     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ]],
		[[        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ]],
		[[ ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ]],
	},
	{
		[[        /\          /\          /\       ]],
		[[     /\//\\/\    /\//\\/\    /\//\\/\    ]],
		[[  /\//\\\///\\/\//\\\///\\/\//\\\///\\/\ ]],
		[[ //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\]],
		[[ \\//\/                            \/\\//]],
		[[  \/                                  \/ ]],
		[[  /\                                  /\ ]],
		[[ //\\  Neovim IDE with LSP and DAP   //\\]],
		[[ \\//                                \\//]],
		[[  \/                                  \/ ]],
		[[  /\                                  /\ ]],
		[[ //\\/\                            /\//\\]],
		[[ \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//]],
		[[  \/\\///\\\//\/\\///\\\//\/\\///\\\//\/ ]],
		[[      \/\\//\/    \/\\//\/    \/\\//\/   ]],
		[[         \/          \/          \/      ]],
	},
	{
		"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣿⣿⣿⣿⣿⣿⢟⢍⣼⣿⣿⣿⣿⣿⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣿⣿⣿⣿⢟⣵⢏⣾⣿⣿⣿⣷⣿⣟⣤⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣿⣿⣿⣫⡿⠋⠀⢻⣿⣿⣿⡿⠿⢸⠏⠠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣿⣿⢣⠟⠀⠀⠀⠀⠙⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⠀⠀⠀",
		"⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣸⣧⠀⠀⠀⠀",
		"⣿⠻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠈⠉⠑⠀⠀⢀⠀⠀⠀⡄⢩⣿⣧⡀⣖⢋",
		"⣿⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡦⡜⣤⢸⣦⣸⣦⡀⠀⢸⡆⠀⡀⠀⢈⠀",
		"⣿⣿⠁⠀⠀⣴⡆⠀⠀⠀⠀⢀⠀⣻⣿⣿⣽⣿⣿⣿⣿⣿⣷⣾⣧⢦⣵⣄⣿⠀",
		"⣿⣿⡄⣰⣬⣿⣇⠀⠀⠀⠀⢸⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀",
		"⣯⣝⣷⣿⡿⢻⣿⡄⠀⠀⢸⣦⠀⠀⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀",
		"⣿⣿⢯⣶⣿⣿⣿⣿⣦⣀⠘⢿⢨⡆⡜⣶⡝⠿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⣀⣠",
		"⣽⣯⣾⣿⣿⣿⡿⠛⠿⠿⠿⠒⠻⠓⢚⢘⣴⣿⡬⣝⣛⣻⣽⣶⣏⡄⢸⣿⠋⡟",
	},
}
require("alpha.term")
-- Terminal header
--/usr/local/bin/asciiquarium
dashboard.section.terminal = {
	type = "terminal",
	command = string.format("chafa -c full --fg-only --symbols braille ~/.config/nvim/static/%s.gif", get_fortune()),
    -- command = string.format("cmatrix"),

	width = 64,
	height = 32,
	opts = {
		-- position = "left",
		redraw = true,
		window_config = {},
	},
}
dashboard.section.header = {
	type = "text",
	val = get_fortune(fortune_list_head),
	opts = {
		position = "center",
		hl = "Statement",
	},
}
dashboard.section.date = {
	type = "text",
	val = "Danya_LOX",
	opts = {
		position = "center",
		hl = "Keyword",
	},
}
dashboard.section.buttons = {
	type = "group",
	val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("s", "  Change Colorscehme", ":lua M.find() <CR>"),
		dashboard.button("w", "  Transparent window", ":TransparentToggle <CR>"),
		dashboard.button("c", "  Configuration", ":e $HOME/.config/nvim/lua/antonio/packer.lua <CR>"),
		dashboard.button("p", "  Projects", ":e $HOME/Projects/Hello_luser.txt <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local function footer()
	-- Number of plugins
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date("%d-%m-%Y %H:%M:%S")
	local plugins_text = "   "
		.. total_plugins
		.. " plugins"
		.. "   v"
		.. vim.version().major
		.. "."
		.. vim.version().minor
		.. "."
		.. vim.version().patch
		.. "   "
		.. datetime

	-- Quote
	local fortune = require("alpha.fortune")
	local quote = table.concat(fortune(), "\n")

	return plugins_text .. "\n" .. quote
end
dashboard.section.footer = {
	type = "text",
	-- val = fortune(),
	val = footer(),
	opts = {
		position = "center",
		hl = "Statement",
	},
}
-- dashboard.section.terminal.command = "chafa -c full --fg-only --symbols braille ~/.config/nvim/static/7gKO.gif"
-- dashboard.section.terminal.opts = {
-- 	width = 100,
-- 	height = 100,
-- }

-- local function button(sc, txt, keybind, keybind_opts)
-- 	local b = dashboard.button(sc, txt, keybind, keybind_opts)
-- 	b.opts.hl = "AlphaButtonText"
-- 	b.opts.hl_shortcut = "AlphaButtonShortcut"
-- 	return b
-- end
-- dashboard.section.buttons.val = {
-- 	button("l", "   Load session", ':lua require("persisted").load()<CR>'),
-- 	button("s", "   Find session", ":Telescope persisted<CR>"),
-- 	button("n", "   New file", ":ene <BAR> startinsert <CR>"),
-- 	button("b", "   Bookmarks", ":Telescope harpoon marks<CR>"),
-- 	button("r", "   Recently used files", ":Telescope frecency<CR>"),
-- 	button("f", "   Find file", ":Telescope find_files hidden=true path_display=smart<CR>"),
-- 	button("u", "   Update plugins", ":lua om.PackerSync()<CR>"), -- Packer sync
-- 	button("q", "   Quit Neovim", ":qa<CR>"),
-- }
-- dashboard.section.buttons.opts = {
-- 	spacing = 0,
-- }

-- Footer

-- Layout
dashboard.opts = {
	layout = {
        -- dashboard.section.terminal,
		{ type = "padding", val = 5},
		dashboard.section.header,
        { type = "padding", val = 10},
		dashboard.section.date,
		{ type = "padding", val = 1 },
		dashboard.section.buttons,
		{ type = "padding", val = 1 },
		dashboard.section.footer,
	},
	opts = {
		margin = 0,
		noautocmd = false,
		redraw_on_resize = true,
	},
}

alpha.setup(dashboard.opts)
