return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Can toggle inlay hints with <leader>uh
    inlay_hints = { enabled = true },
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
  },
}
