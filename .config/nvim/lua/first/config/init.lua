local setup_name = "first"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require(setup_name .. ".config.globals")
require(setup_name .. ".config.options")
require(setup_name .. ".config.keymaps")

local opts = {
	defaults = {
		lazy = true,
	},
	-- install = {
	--   colorscheme = { "your favorite colorscheme" },
	-- },
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	-- change_detection {
	--   notify = true,
	-- },
}

require("lazy").setup({
	{ import = setup_name .. ".plugins" },
	{ import = setup_name .. ".plugins.lsp" },
}, opts)
