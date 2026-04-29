return {
  "christoomey/vim-tmux-navigator",
  lazy = true,
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
    { "<C-\\>", "<cmd>TmuxNavigateLast<cr>", desc = "Tmux Navigate Last" },
  },
}
