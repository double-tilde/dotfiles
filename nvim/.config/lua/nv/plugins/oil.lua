return {
	{
		"stevearc/oil.nvim",
		name = "Oil File Navigation",
		opts = {},
		config = function()
			require("oil").setup({
				columns = { "size", "icon" },
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

	-- Set muted color for file sizes
	vim.api.nvim_set_hl(0, "OilColumn.Size", { fg = "#353539" }), -- Adjust color as needed
}
