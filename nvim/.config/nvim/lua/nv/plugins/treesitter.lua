return {
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		name = "Treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				-- Makes jumping better using syntax aware text-objects
				"nvim-treesitter/nvim-treesitter-textobjects",
				name = "Treesitter Text Objects",
				lazy = true,
				config = function()
					require("nvim-treesitter.configs").setup({
						textobjects = {
							select = {
								enable = true,
								lookahead = true,

								keymaps = {
									["a:"] = {
										query = "@property.outer",
										desc = "Select outer part of an object property",
									},
									["i:"] = {
										query = "@property.inner",
										desc = "Select inner part of an object property",
									},
									["l:"] = {
										query = "@property.lhs",
										desc = "Select left part of an object property",
									},
									["r:"] = {
										query = "@property.rhs",
										desc = "Select right part of an object property",
									},

									["aa"] = {
										query = "@parameter.outer",
										desc = "Select outer part of a parameter/argument",
									},
									["ia"] = {
										query = "@parameter.inner",
										desc = "Select inner part of a parameter/argument",
									},

									["ai"] = {
										query = "@conditional.outer",
										desc = "Select outer part of a conditional",
									},
									["ii"] = {
										query = "@conditional.inner",
										desc = "Select inner part of a conditional",
									},

									["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
									["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

									["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
									["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

									["am"] = {
										query = "@function.outer",
										desc = "Select outer part of a method/function definition",
									},
									["im"] = {
										query = "@function.inner",
										desc = "Select inner part of a method/function definition",
									},

									["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
									["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

									-- TODO: Check if this functions properly
									-- ["at"] = { query = "@tag.outer", desc = "Select outer part of a tag" },
									-- ["it"] = { query = "@tag.inner", desc = "Select inner part of a tag" },
								},
							},
							move = {
								enable = true,
								set_jumps = true,
								goto_next_start = {
									["]f"] = { query = "@call.outer", desc = "Next function call start" },
									["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
									["]c"] = { query = "@class.outer", desc = "Next class start" },
									["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
									["]l"] = { query = "@loop.outer", desc = "Next loop start" },
									["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
									["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
									["]t"] = { query = "@tag.inner", desc = "Next tag start" },
								},
								goto_next_end = {
									["]F"] = { query = "@call.outer", desc = "Next function call end" },
									["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
									["]C"] = { query = "@class.outer", desc = "Next class end" },
									["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
									["]L"] = { query = "@loop.outer", desc = "Next loop end" },
									["]T"] = { query = "@tag.outer", desc = "Next tag end" },
								},
								goto_previous_start = {
									["[f"] = { query = "@call.outer", desc = "Prev function call start" },
									["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
									["[c"] = { query = "@class.outer", desc = "Prev class start" },
									["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
									["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
									["[t"] = { query = "@tag.inner", desc = "Prev tag start" },
								},
								goto_previous_end = {
									["[F"] = { query = "@call.outer", desc = "Prev function call end" },
									["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
									["[C"] = { query = "@class.outer", desc = "Prev class end" },
									["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
									["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
									["[T"] = { query = "@tag.outer", desc = "Prev tag end" },
								},
							},
						},
					})

					local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

					-- Repeats in the direction you were moving.
					vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
					vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

					-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
					vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
					vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
					vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
					vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
				end,
			},
		},
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"go",
				"gotmpl",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"rust",
				"svelte",
				"typescript",
				"yaml",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>n",
					node_incremental = "<leader>n",
					scope_incremental = false,
					node_decremental = "<leader><bs>",
				},
			},
		},
		config = function(_, opts)
			-- See :help nvim-treesitter
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		-- Shows the nested structure of the code at the top of the screen
		"nvim-treesitter/nvim-treesitter-context",
		name = "Treesitter Context",
		event = "VeryLazy",
		opts = {},
	},
	{
		"double-tilde/treesitter-tag-hop.nvim",
		name = "Treesitter Tag Hop",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local tth = require("treesitter-tag-hop")
			tth.setup({
				show_messages = false,
				filetypes = { "html", "php" },
			})
			vim.keymap.set({ "n", "v" }, "<leader>j", function()
				require("treesitter-tag-hop").jump_tag("next")
			end, { desc = "Jump to next tag" })
			vim.keymap.set({ "n", "v" }, "<leader>J", function()
				require("treesitter-tag-hop").jump_tag("prev")
			end, { desc = "Jump to previous tag" })
		end,
	},
}
