return {
  "Saghen/blink.cmp",
  opts = {
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
    },
    -- signature = { enabled = true, window = { border = "rounded" } },
    keymap = {
      preset = "default",
      ["<C-Space>"] = { "fallback" },
      ["<C-K>"] = { "show_documentation", "hide_documentation", "show", "fallback" },
    },

    -- LazyDev configuration
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
}
