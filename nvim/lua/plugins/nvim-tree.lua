local on_attach = function(bufnr)
	local api = require("nvim-tree.api")
	local opts = function(description)
		return {
			desc = "nvim-tree: " .. description,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	api.config.mappings.default_on_attach(bufnr)

	local keymap = vim.keymap
	keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	lazy = false,
	config = {
		sort = {
			sorter = "case_sensitive",
		},
		-- filters = {
		--   dotfiles = true,
		-- },
		on_attach = on_attach,
		view = {
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local window_w = screen_w * WIDTH_RATIO
					local window_h = screen_h * HEIGHT_RATIO
					local window_w_int = math.floor(window_w)
					local window_h_int = math.floor(window_h)
					local center_x = (screen_w - window_w) / 2
					local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
					return {
						border = "rounded",
						relative = "editor",
						row = center_y,
						col = center_x,
						width = window_w_int,
						height = window_h_int,
					}
				end,
			},
			width = function()
				return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
			end,
		},
	},
}
