-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Press ESC to remove search highlight" })

-- Quit neovim
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit neovim" })

-- Save the file
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save file" })

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

-- Paste what was last yanked
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste what was last yanked"})

-- Toggle relative and absolute line numbers, M = alt
vim.keymap.set("n", "<M-r>", "<cmd>set rnu! rnu?<CR>", { desc = "Toggle relative and absolte line numbers" })

-- Select a line in visual block mode and use capital J or K to move that line
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

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
-- See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Remapping common syntax
vim.keymap.set("i", "<M-u>", "=", { desc = "Press ALT+u to insert an equals symbol" })
vim.keymap.set("i", "<M-i>", "+", { desc = "Press ALT+i to insert a plus symbol" })
vim.keymap.set("i", "<M-o>", "-", { desc = "Press ALT+o to insert a minus symbol" })
vim.keymap.set("i", "<M-h>", '""<Esc>i', { desc = "Press ALT+h to insert double quotes and put cursor inside" })
vim.keymap.set("i", "<M-j>", "{}<Esc>i", { desc = "Press ALT+j to insert curly brackets and put cursor inside" })
vim.keymap.set("i", "<M-k>", "()<Esc>i", { desc = "Press ALT+k to insert brackets and put cursor inside" })
vim.keymap.set("i", "<M-l>", "[]<Esc>i", { desc = "Press ALT+l to insert square brackets and put cursor inside" })
