return {
	"mfussenegger/nvim-dap",
	name = "Nvim DAP",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"rcarriga/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require "dap"
		local dapui = require "dapui"

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "Debug: Run to cursor" })

		-- Eval var under cursor
		vim.keymap.set("n", "<leader>le", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })


		vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debug: Step into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug: Step over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug: Step out" })
		vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debug: Step back" })
		vim.keymap.set("n", "<F12>", dap.restart, { desc = "Debug: Restart" })

		vim.keymap.set("n", "<F9>", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("nvim-dap-virtual-text").setup({
			enabled = true,
		})
		require("dapui").setup()

		-- Install golang specific config
		require("dap-go").setup()
	end,
}
