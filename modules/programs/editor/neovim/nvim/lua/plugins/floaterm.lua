local function run_in_floaterm(opts)
  local buf = 0

  -- open first, otherwise window_id's dont exist and `switch_buf` will fail
  require("floaterm").open()

  for _, term in ipairs(require("floaterm.state").terminals) do
    if term.name == opts.name then
      buf = term.buf
      break
    end
  end

  if buf == 0 then
    require("floaterm.api").new_term({ cmd = opts.cmd, name = opts.name })
  else
    if opts.force then
      require("floaterm.api").send_cmd({ cmd = opts.cmd, buf = buf })
    end
    require("floaterm.utils").switch_buf(buf)
  end
end

local function IsInSrcFolder()
  -- Get the full path of the current buffer
  local file_path = vim.fn.expand("%:p")

  -- Get the parent directory
  -- ':p:h' expands to the full path of the file, then its head (directory part)
  local parent_dir = vim.fn.fnamemodify(file_path, ":p:h")

  -- Get just the name of the parent directory
  -- ':t' gets the tail (last component/basename) of the path
  local parent_dir_name = vim.fn.fnamemodify(parent_dir, ":t")

  -- Check if the name is 'src'
  if parent_dir_name == "src" then
    print("main.c is inside a src folder.")
    return true
  else
    print("main.c is not directly inside a src folder.")
    return false
  end
end

return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    border = true,
    size = { h = 80, w = 80 },

    mappings = {
      term = function(buf)
        vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>FloatermToggle<CR>", { buffer = buf })
        vim.keymap.set({ "n", "t" }, "q", "<cmd>FloatermToggle<CR>", { buffer = buf })

        vim.keymap.set({ "n", "t" }, "<C-n>", function()
          require("floaterm.api").cycle_term_bufs("next")
        end, { buffer = buf })

        vim.keymap.set({ "n", "t" }, "<C-p>", function()
          require("floaterm.api").cycle_term_bufs("prev")
        end, { buffer = buf })

        vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { silent = true, buffer = buf })

        vim.keymap.del("n", "<esc>", { buffer = buf })
      end,
      sidebar = function(buf)
        vim.keymap.set("n", "<C-t>", "<cmd>FloatermToggle<CR>", { buffer = buf })
        vim.keymap.set("n", "q", "<cmd>FloatermToggle<CR>", { buffer = buf })

        --TODO: select a terminal with <CR>

        vim.keymap.set("n", "<esc>", "", { buffer = buf })
      end,
    },
  },
  cmd = "FloatermToggle",
  keys = {
    vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>FloatermToggle<CR>", { desc = "Terminal (Root Dir)", remap = true }),

    vim.keymap.set("n", "<F5>", function()
      local cmd = ""
      local ft = vim.bo.filetype

      if ft == "rust" then
        cmd = "cargo run"
      elseif ft == "c" then
        if IsInSrcFolder() then
          cmd = "gcc src/main.c -o main ; ./main"
        else
          cmd = "gcc main.c -o main ; ./main"
        end
      end

      run_in_floaterm({ name = "Run", cmd = cmd, force = true })
    end, { desc = "Floaterm: Run app" }),

    vim.keymap.set("n", "<F6>", function()
      local cmd = ""
      local name = ""
      local ft = vim.bo.filetype

      if ft == "rust" then
        cmd = "bacon clippy"
        name = "Bacon"
      end

      run_in_floaterm({ name = name, cmd = cmd, force = false })
    end, { desc = "Floaterm: Run tools" }),
  },
}
