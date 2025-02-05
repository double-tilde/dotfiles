return {
	"dgox16/oldworld.nvim",
	name = "Old World Theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("oldworld").setup({
			transparent = true,
		})

		vim.cmd.colorscheme("oldworld")

		-- Background Opacity
		vim.cmd.hi("Normal guibg=none")
		vim.cmd.hi("NonText guibg=none")
		vim.cmd.hi("Normal ctermbg=none")
		vim.cmd.hi("NonText ctermbg=none")

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
}
