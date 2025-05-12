return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({

			-- NOTE: These can probably be removed when 0.11 is adopted more
			vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#161617", fg = "#92a2d5" }),
			vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "#161617", fg = "#92a2d5" }),
			vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { fg = "#92a2d5", bold = true }),
			vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { fg = "#c9c7cd" }),
			vim.api.nvim_set_hl(0, "NoiceLspProgressSpinner", { fg = "#c9c7cd" }),

			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		})
		require("notify").setup({
			stages = "static",
			render = "minimal",
			timeout = 1500,
			background_colour = "#161617",
		})
	end,
}
