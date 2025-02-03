return {
	{
		"vague2k/vague.nvim",
		name = "Vague Theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true,
			})
			-- Background Opacity
			vim.cmd.hi("Normal guibg=none")
			vim.cmd.hi("NonText guibg=none")
			vim.cmd.hi("Normal ctermbg=none")
			vim.cmd.hi("NonText ctermbg=none")
			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
			vim.cmd.colorscheme("vague")
		end,
	},
	-- Other themes I like
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	name = "Tokyonight Theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	name = "Gruvbox",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
}
