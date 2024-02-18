local config = function()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black,
			null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.diagnostics.ruff,
		},
	})

	local keymap = vim.keymap
	local opts = { noremap = true, silent = true }

	opts.desc = "Format file"
	keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
end

return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	config = config,
}
