return {
	{
		"echasnovski/mini.nvim",
		name = "Mini Addons",
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
	{
		-- Highlight css / hex / rgb colors
		"brenoprata10/nvim-highlight-colors",
		name = "Highlight Colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
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
		"MeanderingProgrammer/render-markdown.nvim",
		name = "Render Markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		opts = {},
	},
}
