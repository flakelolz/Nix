-- TODO: Disable or change  Shift+Tab
return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      -- Disable smooth scrolling effect that's applied by default for some reason
      enabled = false,
    },
    terminal = {
      enabled = false,
      win = {
        position = "float",
        border = "rounded",
      },
    },
    picker = {
      layout = { preset = "vertical", cycle = false, layout = { width = 128 } },
      sources = {
        files = { hidden = true, ignored = false },
        grep = { hidden = true, ignored = false },
        explorer = { hidden = true, ignored = true, layout = { layout = { width = 32 } } },
        -- stylua: ignore
        buffers = { on_show = function() vim.cmd.stopinsert() end },
      },
    },
  },
}
