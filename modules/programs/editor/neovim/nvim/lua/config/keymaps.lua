-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Centers cursor when doing this vim motions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump Up" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Jump Back" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Jump Forward" })
-- Leaves search terms in the middle
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search term" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search term" })
-- Leaves cursor at the same location instead of the end of the line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join next line" })

-- Inlay end hints
-- stylua: ignore
vim.keymap.set("n", "<leader>uH", function() require("lsp-endhints").toggle() end, { desc = "Toggle end inlay hints" })

-- Delete default floating terminal
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<C-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<C-_>")

-- Remap floating terminal
-- stylua: ignore
-- vim.keymap.set("n", "<C-T>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)", remap = true })
-- stylua: ignore
-- vim.keymap.set("t", "<C-T>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)", remap = true })

-- Comments - Because of how a terminal might be sending the input, need both / and _ keymaps
vim.keymap.set("n", "<C-/>", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { desc = "which_key_ignore", remap = true })

vim.keymap.set("v", "<C-/>", "gc", { desc = "Comment block", remap = true })
vim.keymap.set("v", "<C-_>", "gc", { desc = "which_key_ignore", remap = true })

-- Send highlighted text to void register before pasting
vim.keymap.set({ "x", "v" }, "<M-p>", '"_dP', { desc = "Void paste" })
-- Delete text and send to void register
vim.keymap.set({ "n", "v", "x" }, "<M-d>", '"_d', { desc = "Void delete" })

-- Make C-c same as Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Delete a word with C-Backspace in insert mode
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })
