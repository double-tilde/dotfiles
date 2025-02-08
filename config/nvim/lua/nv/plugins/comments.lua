return {
	{
		-- Comment uncomment with gcc
		"numToStr/Comment.nvim",
		name = "numToStr Smart Commenting",
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		name = "Todo Comments",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}

-- Example of the comment highlighting - use : after each keyword
-- TODO: Get back to this
-- HACK: This code looks funky
-- PERF: Fully optimised
-- NOTE: Adding a quick note
-- FIX: This needs fixing asap
-- WARNING: What is happening here?
