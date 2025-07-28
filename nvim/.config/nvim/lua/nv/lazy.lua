-- LazyVim PLugin Manager
-- See :help lazy.nvim.txt or https://github.com/folke/lazy.nvim for more info

-- Must go first
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- To check the current status of your plugins, run :Lazy
-- To update plugins you can run :Lazy update
require("lazy").setup({
	-- Plugins that hae there own files for organization
	require("nv.plugins.autocomplete"),
	require("nv.plugins.autoformat"),
	require("nv.plugins.comments"),
	-- require("nv.plugins.debug"),
	require("nv.plugins.flash"),
	require("nv.plugins.harpoon"),
	require("nv.plugins.lint"),
	require("nv.plugins.lsp"),
	require("nv.plugins.lualine"),
	-- modules is smaller plugins like mini, css colors, git signs, etc
	require("nv.plugins.modules"),
	require("nv.plugins.oil"),
	require("nv.plugins.snacks"),
	require("nv.plugins.theme"),
	require("nv.plugins.treesitter"),
	require("nv.plugins.trouble"),

	-- For additional information, see :help lazy.nvim-lazy.nvim-structuring-your-plugins
	-- { import = 'custom.plugins' },
	-- require("custom.plugins.quickly"),
	-- require("custom.plugins.treesitter-tag-hop"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
