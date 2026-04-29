-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable lsp semantic tokens for highlighting
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local blacklist = { "rust-analyzer", "marksman", "vtsls", "lua_ls", "clangd" }
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      for _, name in ipairs(blacklist) do
        if client.name == name then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end
    end
  end,
})

-- disable colorcolumn for all filetypes
vim.cmd([[autocmd FileType * set colorcolumn=0]])

-- change textwidth and activate colorcolumn for markdown files only
vim.cmd([[autocmd FileType markdown set tw=99 colorcolumn=100]])

-- change textwidth and activate colorcolumn for neorg files only
vim.cmd([[autocmd FileType norg set tw=99 colorcolumn=100]])

-- stop auto commenting on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl_bevy"
  end,
})

-- gdscript indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gd", "gdscript", "gdscript3" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.indentexpr = ""
  end,
})

-- C/C++ indentation
vim.cmd([[autocmd FileType c,cpp set shiftwidth=4]])

-- ZMK keymap
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.keymap" },
  callback = function()
    vim.opt.filetype = "c"
  end,
})
