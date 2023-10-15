W = {}

function W.open_window(el)
	local width = el.width
	local height = el.height
	local row = math.floor(height / 5)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = vim.tbl_extend("keep", (el.opts and el.opts.window_config) or {}, {
		relative = "win",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "shadow",
	})

	local bufnr = vim.api.nvim_create_buf(false, true)
	local winid = vim.api.nvim_open_win(bufnr, true, opts)
	vim.api.nvim_win_set_option(winid, "winhl", "Normal:Number")
	return { bufnr, winid }
end

function W.run_command(cmd, el)
	if cmd == nil then
		return
	end

	if type(cmd) == "function" then
		cmd = cmd()
	end

	vim.loop
		.new_async(vim.schedule_wrap(function()
			local wininfo = W.open_window(el)
			vim.api.nvim_command("terminal " .. cmd)
			vim.api.nvim_command("wincmd j")
			vim.api.nvim_buf_set_option(wininfo[1], "buflisted", false)
			vim.api.nvim_win_set_var(0, "alpha_section_terminal", wininfo)
			vim.api.nvim_command('let b:term_title ="alpha_terminal" ')
		end))
		:send()
end

function W.close_window()
	local ok, wininfo = pcall(vim.api.nvim_win_get_var, 0, "alpha_section_terminal")
	if ok and vim.api.nvim_buf_is_loaded(wininfo[1]) then
		vim.api.nvim_buf_delete(wininfo[1], { force = true })
	end
end

local terminal = {
	type = "terminal",
	command = "chafa -c full --fg-only --symbols braille ~/.config/nvim/static/15.gif",
	width = 58,
	height = 30,
	opts = {
		position = "center",
		redraw = true,
		window_config = {},
	},
}
function W.open()
	if terminal.opts and (terminal.opts.redraw == nil or terminal.opts.redraw) then
		terminal.opts.redraw = false
		W.run_command(terminal.command, terminal)
	end
	return {}, {}
end

return W
