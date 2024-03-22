return {
  "folke/tokyonight.nvim",
  lazy = false,
  name = "tokyonight",
  priority = 1000,
  opts = {},
  config = function()
	  vim.cmd.colorscheme("tokyonight")
  end,
}
