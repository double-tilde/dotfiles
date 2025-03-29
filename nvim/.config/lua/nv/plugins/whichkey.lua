return {
	"folke/which-key.nvim",
	name = "Which Key",
	-- Load after ui and other autocommands
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
