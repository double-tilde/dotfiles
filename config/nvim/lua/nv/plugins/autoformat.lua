return {
	-- Autoformat
	"stevearc/conform.nvim",
	name = "Conform Formatter",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = false,
		-- format_on_save = function(bufnr)

		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style.
		-- local disable_filetypes = { c = true, cpp = true }
		formatters_by_ft = {
			-- Conform can run multiple formatters sequentially
			-- html = { "" },
			go = { "goimports", "gofumpt", "golines" },
			lua = { "stylua" },
			-- nix = { "nixfmt" },
			-- python = { "isort", "black" },
			-- You can use a sub-list to tell conform to run *until* a formatter is found.
			javascript = { "prettier" },
			php = { "php-cs-fixer" },
		},
	},
}
