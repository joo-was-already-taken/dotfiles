local function config()
  require("harpoon").setup({})

  local keymap = vim.keymap
  local opts = { noremap = true, silent = true }

  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  local notify = require("notify")

  keymap.set("n", "<leader>a", function()
    mark.add_file()
    notify(
      "Harpooned successfully",
      "notification",
      { title = "Harpoon" }
    )
  end, opts)

  keymap.set("n", "<leader>m", function()
    ui.toggle_quick_menu()
  end, opts)

  keymap.set("n", "<leader>hh", function()
    ui.nav_next()
  end, opts)

  keymap.set("n", "<leader>hk", function()
    ui.nav_prev()
  end, opts)
end


return {
  "ThePrimeagen/harpoon",
  branch = "master",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify",
  },
  config = config,
}
