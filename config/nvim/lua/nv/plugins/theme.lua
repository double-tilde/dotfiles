return {
	{
		"folke/tokyonight.nvim",
		name = "Tokyonight Theme",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
			})
			-- Background Opacity
			vim.cmd.hi("Normal guibg=none")
			vim.cmd.hi("NonText guibg=none")
			vim.cmd.hi("Normal ctermbg=none")
			vim.cmd.hi("NonText ctermbg=none")
			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
	-- Other themes I like
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	name = "Gruvbox",
	-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
	-- {
	-- 	"diegoulloao/neofusion.nvim",
	-- 	name = "Neofusion Theme",
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd.colorscheme("neofusion")
	-- 	end,
	-- },
}
