return {
	dir = "~/docs/projects/treesitter-tag-hop.nvim/",
	name = "Treesitter Tag Hop",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local tth = require("treesitter-tag-hop")
		tth.setup({
			messages = false,
		})
		vim.keymap.set("n", "<leader>t", function()
			tth.jump_tag("next")
		end, { desc = "Go to next html [T]ag" })
		vim.keymap.set("n", "<leader>t", function()
			tth.jump_tag("prev")
		end, { desc = "Go to previous [T]ag" })
	end,
}
