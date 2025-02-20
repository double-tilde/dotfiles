return {
	{
		"laytan/cloak.nvim",
		name = "Cloak",
		opts = {
			patterns = {
				{
					file_pattern = ".env*",
					cloak_pattern = { "=.+", ":.+", "-.+" },
				},
				{
					file_pattern = "ENV",
					cloak_pattern = { "=.+", ":.+", "-.+" },
				},
				{
					file_pattern = "*.env",
					cloak_pattern = { "=.+", ":.+", "-.+" },
				},
			},
		},
	},
	{
		"NTBBloodbath/color-converter.nvim",
		name = "Color Converter",
		opts = {
			hsl_pattern = "hsl([h]deg, [s], [l])",
			hsla_pattern = "hsl([h]deg, [s], [l] / [a]%)",
			rgb_pattern = "rgb([r], [g], [b])",
			rgba_pattern = "rgb([r], [g], [b], / [a]%)",
		},
		keys = {
			{
				"<leader>cc",
				function()
					require("color-converter").cycle()
				end,
				mode = "n",
				desc = "[C]olor [C]onverter",
			},
		},
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		name = "Git Signs",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		-- Highlight RGB colors
		"brenoprata10/nvim-highlight-colors",
		name = "Highlight Colors",
		opts = {},
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"echasnovski/mini.nvim",
		name = "Mini Addons",
		opts = {},
		config = function()
			-- Better Around/Inside textobjects
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		name = "Render Markdown",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
	},
	{
		-- Undo Tree lets you go back through undo-history in a non-linear way
		"mbbill/undotree",
		name = "Undo Tree",
		config = function()
			vim.keymap.set("n", "<leader>-", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })
		end,
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
		name = "Sleuth",
	},
}
