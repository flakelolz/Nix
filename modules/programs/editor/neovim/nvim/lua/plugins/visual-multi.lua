return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Select Cursor Up"] = "<M-C-Up>",
      ["Select Cursor Down"] = "<M-C-Down>",
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
  keys = {
    {
      "<C-n>",
      mode = { "n", "x", "v" },
      desc = "VM Find Under",
    },
    {
      "<M-C-Up>",
      mode = { "n", "x", "v" },
      desc = "VM Select Cursor Up",
    },
    {
      "<M-C-Down>",
      mode = { "n", "x", "v" },
      desc = "VM Select Cursor Down",
    },
  },
}
