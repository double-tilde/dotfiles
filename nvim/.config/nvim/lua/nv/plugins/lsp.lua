return {
	{
		"neovim/nvim-lspconfig",
		name = "Neovim LSP Config",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				-- Useful status updates for LSP.
				"j-hui/fidget.nvim",
				name = "Fidget",
				opts = {
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},
		},
		config = function()
			local util = require("lspconfig/util")

			-- This function gets run when an LSP attaches to a particular buffer.
			-- That is to say, every time a new file is opened that is associated with
			-- an lsp (for example, opening main.rs is associated with rust_analyzer) this
			-- function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local toggleInlay = function()
						local current_value = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
						vim.lsp.inlay_hint.enable(not current_value, { bufnr = 0 })
					end

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Toggle LSP Inlay Hints
					map("<leader>ii", toggleInlay, "Toggle [I]nlays")
					-- Rename the variable under your cursor.
					-- Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					-- Opens a popup that displays documentation about the word under your cursor
					-- See :help K for why this keymap.
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					-- This is not Goto Definition, this is Goto Declaration.
					-- For example, in C this would take you to the header.
					map("gD", function()
						vim.lsp.buf.declaration()
						vim.cmd("normal! zz")
					end, "[G]oto [D]eclaration")
					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
					if client and client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, event.buf)
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			-- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server. to see the options for lua_ls, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- See :help lspconfig-all for a list of all the pre-configured LSPs
				gopls = {
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gompl" },
					root_dir = util.root_pattern("go.work", "go.mod", ".git"),
					settings = {
						gopls = {
							completeUnimported = true,
							usePlaceholders = true,
							analyses = {
								unusedparams = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							hint = {
								enable = true,
							},
							diagnostics = {
								globals = {
									"vim",
									"require",
								},
								-- Ignore Lua_LS's noisy missing-fields warnings
								disable = { "missing-fields" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
						},
					},
				},
				ts_ls = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					cmd = { "typescript-language-server", "--stdio" },
					root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
					end,
				},
				pyright = {
					filetypes = { "python" },
				},

			}

			-- Ensure the servers and tools are installed
			-- To check the current status of installed tools and/or manually install other tools, you can run :Mason
			-- You can press g? for help in this menu.
			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"black",
				"cssls",
				"eslint-lsp",
				"gofumpt",
				"goimports",
				"golangci-lint",
				"golines",
				"gopls",
				"html",
				"isort",
				"jdtls",
				"jsonlint",
				"php-cs-fixer",
				"prettier",
				"pyright",
				"typescript-language-server",
				-- "stylua",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
