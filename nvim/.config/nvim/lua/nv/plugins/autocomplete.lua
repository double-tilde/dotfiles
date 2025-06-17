return {
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		name = "CMP Autocomplete",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{ "saadparwaiz1/cmp_luasnip" },
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			-- Adds other completion capabilities.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			-- See :help cmp
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})
			luasnip.filetype_extend("htmlhugo", { "html" })
			luasnip.filetype_extend("php", { "html" })

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sorting = {
					comparators = {
						cmp.config.compare.locality,
						cmp.config.compare.recently_used,
						cmp.config.compare.score,
						cmp.config.compare.offset,
						cmp.config.compare.order,
					},
				},

				completion = { completeopt = "menu,menuone,noselect" },
				preselect = cmp.PreselectMode.None,

				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- Accept ([y]es) the completion.
					-- This will auto-import if your LSP supports it.
					-- This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					-- Manually trigger a completion from nvim-cmp.
					["<C-Space>"] = cmp.mapping.complete({}),
					-- <c-l> will move you to the right of each of the expansion locations.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{ name = "supermaven", priority = 5 },
					{ name = "luasnip", priority = 4 },
					{ name = "nvim_lsp", priority = 3 },
					{ name = "path", priority = 2 },
					{ name = "cmdline", priority = 1 },
				},
			})
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		name = "Super Maven",
		event = "VeryLazy",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
