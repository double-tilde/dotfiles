-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Press ESC to remove search highlight" })

-- Save the file
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "[W]rite file" })

-- Remap backtick as I use it in tmux
vim.keymap.set("n", "`", "<cmd>echo 'Tmux prefix'<CR>", { desc = "Disable backtick in normal mode" })

-- Disable arrow keys in normal mode to promote use of the home row
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move"<CR>')

-- Disable arrow keys in insert mode to promote use of the home row
vim.keymap.set("i", "<left>", '<cmd>echo "Use h in normal mode to move"<CR>')
vim.keymap.set("i", "<down>", '<cmd>echo "Use j in normal mode to move"<CR>')
vim.keymap.set("i", "<up>", '<cmd>echo "Use k in normal mode to move"<CR>')
vim.keymap.set("i", "<right>", '<cmd>echo "Use l in normal mode to move"<CR>')

-- Put what was deleted in a different register
vim.keymap.set("n", "<C-p>", '"_dP', { desc = "Delete visually selected to the void register" })
-- Paste from the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from the clipboard" })
-- Yank to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to the clopboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank to the clopboard" })
-- Delete to Void
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete to void register" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Delete to void register" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Delete to void register" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete to void register" })

-- Toggle relative and absolute line numbers, M = alt
vim.keymap.set("n", "<M-r>", "<cmd>set rnu! rnu?<CR>", { desc = "Toggle relative and absolte line numbers" })

-- Select a line in visual block mode and use capital J or K to move that line
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })

-- Better line concatinate
vim.keymap.set("n", "J", "mzJ`z", { desc = "Concatinate lines without cursor jumps" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })

-- Vertical movements
-- When jumping by half a page up and down, keep the cursor in the center of the window
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go a page down and center the cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go a page up and center the cursor" })
-- When jumping by paragraph, keep the cursor in the center of the window
vim.keymap.set("n", "{", "{zz", { desc = "Go to the next paragraph and center the cursor" })
vim.keymap.set("n", "}", "}zz", { desc = "Go to the next paragraph and center the cursor" })

-- Search movements
-- When jumping through search results, keep the cursor in the center of the window
vim.keymap.set("n", "n", "nzz", { desc = "Go to the next search result and center the cursor" })
vim.keymap.set("n", "N", "Nzz", { desc = "Go to the previous search result and center the cursor" })

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
-- See :help wincmd for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Remapping common syntax
vim.keymap.set("i", "<M-u>", "=", { desc = "Press ALT+u to insert an equals symbol" })
vim.keymap.set("i", "<M-i>", "+", { desc = "Press ALT+i to insert a plus symbol" })
vim.keymap.set("i", "<M-o>", "-", { desc = "Press ALT+o to insert a minus symbol" })
vim.keymap.set("i", "<M-p>", "{}<Esc>i", { desc = "Press ALT+p to insert curly brackets and put cursor inside" })
vim.keymap.set("i", "<M-j>", '""<Esc>i', { desc = "Press ALT+j to insert double quotes and put cursor inside" })
vim.keymap.set("i", "<M-k>", "()<Esc>i", { desc = "Press ALT+k to insert brackets and put cursor inside" })
vim.keymap.set("i", "<M-l>", "[]<Esc>i", { desc = "Press ALT+l to insert square brackets and put cursor inside" })

-- Substitute remaps
vim.keymap.set("v", "<leader>S", 'y:s/<C-r>"//<left>', { desc = "Substite and replace visually selected text" })
vim.keymap.set(
	"v",
	"<leader>gs",
	'y:%s/<C-r>"//g<left><left>',
	{ desc = "Substite and replace visually selected text globally" }
)
vim.keymap.set(
	"v",
	"<leader>gc",
	'y:%s/<C-r>"//gc<left><left><left>',
	{ desc = "Substite and replace visually selected text globally confirmed" }
)

-- Quickfix list navigation - using pcall to stop "E553 No more items"
vim.keymap.set("n", "<C-n>", function()
	pcall(function()
		vim.cmd("cnext")
	end)
end, { desc = "See next item in quickfix list" })
vim.keymap.set("n", "<C-p>", function()
	pcall(function()
		vim.cmd("cprev")
	end)
end, { desc = "See previous item in quickfix list" })

-- Toggle quickfix visibility
vim.keymap.set("n", "<leader>q", function()
	local qf_exists = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_exists = true
			break
		end
	end
	if qf_exists then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "Toggle quickfix list visibility" })
