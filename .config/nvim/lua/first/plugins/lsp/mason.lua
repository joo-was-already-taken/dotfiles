local config = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		pip = {
			upgrade_pip = true,
		},
	})

	local ensure_installed = {
		-- LSPs
		"lua_ls",
		"pyright",
		"tsserver",
		"html",
		"cssls",
		"rust_analyzer",
    "jsonls",

    -- DAP
    -- "debugpy",

		-- Linters
		-- "mypy",
		-- "ruff",

		-- Formatters
		-- "stylua",
    -- "black",
	}

	require("mason-lspconfig").setup({
		ensure_installed = ensure_installed,
		automatic_installation = true,
	})

	vim.api.nvim_create_user_command("MasonInstallAll", function()
		vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
	end, {})
end

return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- lazy = false,
	},
	config = config,
}
