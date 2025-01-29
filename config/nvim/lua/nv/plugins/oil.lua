return {
	{
		"stevearc/oil.nvim",
		name = "Oil File Navigation",
		opts = {},
		config = function()
			require("oil").setup({
				view_options = {
					-- Show hidden files by default
					show_hidden = true,
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Use "-" to open oil whilst in normal mode
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
