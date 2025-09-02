return {
	{
		"LunarVim/breadcrumbs.nvim",
		name = "Breadcrumbs",
		lazy = false,
		dependencies = {
			{ "SmiteshP/nvim-navic" },
		},
		config = function()
			require("breadcrumbs").setup()
		end,
	},
	{
		"laytan/cloak.nvim",
		name = "Cloak",
		event = "VeryLazy",
		opts = {
			patterns = {
				{
					file_pattern = { ".env", "*.env", "ENV" },
					cloak_pattern = { "=.+", ":.+", "-.+" },
				},
				{
					file_pattern = { "*id_ed25519", "*id_rsa", "*.pem", "*.key", "*.crt" },
					cloak_pattern = { ".+" },
				},
			},
		},
	},
	{
		"NTBBloodbath/color-converter.nvim",
		name = "Color Converter",
		event = "VeryLazy",
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
		"lewis6991/gitsigns.nvim",
		name = "Git Signs",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		name = "Highlight Colors",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"echasnovski/mini.nvim",
		name = "Mini Addons",
		lazy = false,
		opts = {},
		config = function()
			-- Better Around/Inside textobjects
			-- va)  - [V]isually select [A]round [)]paren
			-- yinq - [Y]ank [I]nside [N]ext [']quote
			-- ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"arnamak/stay-centered.nvim",
		name = "Stay centered",
		lazy = false,
		opts = {
			skip_filetypes = {},
		},
	},
	{
		"mbbill/undotree",
		name = "Undo Tree",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>-", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })
		end,
	},
	{
		-- Run the following command :VimBeGood
		"ThePrimeagen/vim-be-good",
		name = "Vim Be Good",
		event = "VeryLazy",
	},
	{
		"phelipetls/vim-hugo",
		name = "Vim Hugo",
		event = "VeryLazy",
	},
	{
		"tpope/vim-sleuth",
		name = "Sleuth",
	},
	{
		"tpope/vim-surround",
		name = "Vim Surround",
		event = "VeryLazy",
	},
}
