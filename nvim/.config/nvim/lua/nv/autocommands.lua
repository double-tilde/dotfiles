-- Autocommands
-- See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
-- See :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set .webc files to be treated as html files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.webc",
	callback = function()
		vim.bo.filetype = "html"
	end,
})

-- Show the commandline when I am recording a macro, then hide it again when I am not
-- This setting is needed as in my base.lua file I have hidden the command line by
-- default for aesthetic reasons
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		vim.opt.cmdheight = 1
	end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		vim.opt.cmdheight = 0
	end,
})
