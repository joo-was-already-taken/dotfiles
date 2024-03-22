local config = function()
	local theme = require("lualine.themes.tokyonight")
	theme.normal.c.bg = nil

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			-- lualine_b = { "buffers" },
      lualine_b = {},
			lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opt = true },
	},
	config = config,
}
