return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	name = "Harpoon 2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end, { desc = "Add to Harpoon list" })
		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon menu" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon to file 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon to file 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon to file 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon to file 4" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon to file 5" })
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Harpoon to file 6" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>pp", function()
			harpoon:list():prev()
		end, { desc = "Harpoon to the previous file" })
		vim.keymap.set("n", "<leader>nn", function()
			harpoon:list():next()
		end, { desc = "Harpoon to the next file" })
	end,
}
