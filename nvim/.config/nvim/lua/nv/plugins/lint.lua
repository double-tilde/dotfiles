return {
	-- Linting
	"mfussenegger/nvim-lint",
	name = "Nvim Lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			json = { "jsonlint" },
			go = { "golangcilint" },
			php = { "php" },
			typescript = { "eslint_d" },
			-- python = { "ruff" },
		}

		-- Custom config for global eslint_d settings
		require("lint").linters.eslint_d = {
			cmd = "eslint_d",
			args = {
				"--config",
				vim.fn.expand("~/.config/eslint/eslintrc.config.js"),
				"--format",
				"json",
				"--stdin",
				"--stdin-filename",
				function()
					return vim.api.nvim_buf_get_name(0)
				end,
			},
			stdin = true,
			ignore_exitcode = true,
			parser = function(output)
				local decoded = vim.json.decode(output)
				local diags = {}

				for _, result in ipairs(decoded) do
					for _, msg in ipairs(result.messages) do
						table.insert(diags, {
							lnum = msg.line - 1,
							col = msg.column - 1,
							end_lnum = msg.endLine and (msg.endLine - 1) or nil,
							end_col = msg.endColumn and (msg.endColumn - 1) or nil,
							severity = ({
								[1] = vim.diagnostic.severity.ERROR,
								[2] = vim.diagnostic.severity.WARN,
								[3] = vim.diagnostic.severity.INFO,
								[4] = vim.diagnostic.severity.HINT,
							})[msg.severity],
							message = msg.message,
							source = "eslint_d",
							code = msg.ruleId,
						})
					end
				end
				return diags
			end,
		}

		-- You can disable the default linters by setting their filetypes to nil:
		-- lint.linters_by_ft['markdown'] = nil

		-- Create autocommand which carries out the actual linting
		-- on the specified events.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>li", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
