-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Disable autoformat on save
vim.g.autoformat = false

-- Windows specific
if vim.fn.has("win32") == 1 then
  -- Shell for floating terminal
  vim.o.shell = "nu"
  -- Python location
  vim.g.python3_host_prog = "C:/Users/Flake/AppData/Local/Programs/Python/Python312/python.exe"
end
