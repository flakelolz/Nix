return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.highlight = {
      enable = true,
      disable = function(_, bufnr)
        local max_filesize = 10000 * 1024 -- 10 MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    }
    vim.list_extend(opts.ensure_installed, {
      "glsl",
      "css",
      -- "sql",
      -- "htmldjango",
      -- "gdscript",
      -- "godot_resource",
      "wgsl",
      "wgsl_bevy",
      -- "norg",
      -- "zig",
    })
  end,
}
