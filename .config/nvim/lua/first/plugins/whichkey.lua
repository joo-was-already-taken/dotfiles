local config = function()
  local whichkey = require("which-key")
  local mappings = {}
  local opts = { prefix = '<leader>' }
  whichkey.register(mappings, opts)
end

return {
	"folke/which-key.nvim",
  config = config,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	-- opts = {
	--
	-- }.
}
