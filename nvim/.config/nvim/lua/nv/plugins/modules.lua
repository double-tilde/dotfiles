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
		"nvimdev/dashboard-nvim",
		name = "dashboard",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "TelescopeSearchDotfiles",
							key = "d",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
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
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			max_count = 5,
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
			hint = false,
			notification = false,
			disable_mouse = false,
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		},
	},
	{
		-- Highlight RGB colors
		"brenoprata10/nvim-highlight-colors",
		name = "Highlight Colors",
		opts = {},
		event = "VeryLazy",
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
			-- va)  - [V]isually select [A]round [)]paren
			-- yinq - [Y]ank [I]nside [N]ext [']quote
			-- ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- sd'   - [S]urround [D]elete [']quotes
			-- sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		name = "Makrdown Preview",
		event = "VeryLazy",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_auto_start = 1
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_browser = "firefox"
			vim.g.mkdp_port = "8181"
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
		-- Undo Tree lets you go back through undo-history in a non-linear way
		"mbbill/undotree",
		name = "Undo Tree",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>-", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })
		end,
	},
	{
		-- Vim Be Good Game
		-- Run the following command :VimBeGood
		"ThePrimeagen/vim-be-good",
		event = "VeryLazy",
		name = "Vim Be Good",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
		name = "Sleuth",
	},
}
