return {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  opts = { -- required, even if empty
    -- default settings
    icons = {
      -- type = "󰜁 ",
      type = "|> ",
      -- parameter = "󰏪 ",
      -- parameter = " ",
      parameter = "⦿ ",
      -- offspec = " ", -- hint kind not defined in official LSP spec
      offspec = "-> ", -- hint kind not defined in official LSP spec
      unknown = "󰏪 ", -- hint kind is nil
    },
    label = {
      padding = 1,
      marginLeft = 0,
      bracketedParameters = true,
    },
    autoEnableHints = false,
  },
}
