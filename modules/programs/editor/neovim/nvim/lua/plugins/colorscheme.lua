return {
  -- Add themes
  {
    {
      -- "catppuccin/nvim",
      -- name = "catppuccin",
      -- tag = "v1.10.0", -- Before the VSCode recolor thing
      -- opts = {
      --   transparent_background = true,
      --   no_italic = true,
      --   no_bold = true,
      --   integrations = {},
      -- },
      -- enabled = false,
    },
    {
      "catppuccin/nvim",
      lazy = true,
      name = "catppuccin",
      -- tag = "v1.10.0", -- Before the VSCode recolor thing
      opts = {
        custom_highlights = function(C)
          local O = require("catppuccin").options
          return {
            -- ["@variable.member"] = { fg = C.lavender }, -- For fields.
            ["@module"] = { fg = C.lavender }, -- For identifiers referring to modules and namespaces.
            ["@function.macro"] = { fg = C.teal },
            ["@string.special.url"] = { fg = C.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
            ["@type.builtin"] = { fg = C.yellow }, -- For builtin types.
            ["@property"] = { fg = C.lavender, style = O.styles.properties or {} }, -- Same as TSField.
            ["@constructor"] = { fg = C.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
            ["@keyword.operator"] = { link = "Operator" }, -- For new keyword operator
            ["@keyword.export"] = { fg = C.sky, style = O.styles.keywords },
            ["@markup.strong"] = { fg = C.maroon, style = { "bold" } }, -- bold
            ["@markup.italic"] = { fg = C.maroon, style = { "italic" } }, -- italic
            ["@markup.heading"] = { fg = C.blue, style = { "bold" } }, -- titles like: # Example
            ["@markup.quote"] = { fg = C.maroon, style = { "bold" } }, -- block quotes
            ["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
            ["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
            ["@markup.link.url"] = { fg = C.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
            ["@markup.raw"] = { fg = C.teal }, -- used for inline code in markdown and for doc in python (""")
            ["@markup.list"] = { link = "Special" },
            ["@tag"] = { fg = C.mauve }, -- Tags like html tag names.
            ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } }, -- Tags like html tag names.
            ["@tag.delimiter"] = { fg = C.sky }, -- Tag delimiter like < > /
            ["@boolean"] = { fg = C.red }, -- true or false
            -- Lua
            ["@constructor.lua"] = { fg = C.flamingo }, -- For constructor calls and definitions: = { } in Lua.
            ["@namespace.builtin.lua"] = { fg = C.red },

            -- Rust
            ["@lsp.type.enumMember"] = { fg = C.peach },
            ["@lsp.type.enumMember.rust"] = { fg = C.peach },
            ["@lsp.type.decorator.rust"] = { fg = C.teal },
            ["@lsp.type.macro.rust"] = { fg = C.teal },

            ["@lsp.typemod.function.defaultLibrary.rust"] = { fg = C.blue },
            ["@lsp.typemod.enumMember.library"] = { fg = C.peach },
            ["@lsp.typemod.enumMember.library.rust"] = { fg = C.peach },
            -- Optional: keep consistency if other modifiers appear later
            ["@lsp.typemod.enumMember"] = { fg = C.peach },
            ["@lsp.typemod.enumMember.rust"] = { fg = C.peach },
            -- Disable semantic tokes and let Treesitter handle this
            ["@lsp.type.property.rust"] = {},
            ["@lsp.typemod.property.rust"] = {},
            ["@lsp.typemod.property.library.rust"] = {},

            -- CSS
            ["@property.css"] = { fg = C.lavender },
            ["@property.id.css"] = { fg = C.blue },
            ["@type.tag.css"] = { fg = C.mauve },
            ["@string.plain.css"] = { fg = C.peach },
            -- typescript
            ["@property.typescript"] = { fg = C.lavender, style = O.styles.properties or {} },
            ["@constructor.typescript"] = { fg = C.lavender },
            -- TSX (Typescript React)
            ["@constructor.tsx"] = { fg = C.lavender },
            ["@tag.attribute.tsx"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
            ["@type.builtin.c"] = { fg = C.yellow, style = {} },
            ["@type.builtin.cpp"] = { fg = C.yellow, style = {} },
            -- Nix
            ["@variable.member.nix"] = { fg = C.lavender },
            ["@lsp.type.property.nix"] = { fg = C.lavender },
            ["@variable.parameter.bash"] = { fg = C.maroon },
          }
        end,
        transparent_background = true,
        no_italic = true,
        no_bold = true,
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          fzf = true,
          grug_far = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          snacks = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      },
      specs = {
        -- {
        --   "akinsho/bufferline.nvim",
        --   optional = true,
        --   opts = function(_, opts)
        --     if (vim.g.colors_name or ""):find("catppuccin") then
        --       opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
        --     end
        --   end,
        -- },
      },
    },
  },
  -- Configure LazyVim to load themes
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
