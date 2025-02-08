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
