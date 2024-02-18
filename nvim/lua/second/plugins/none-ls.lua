local none_ls_config = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      -- lua
      null_ls.builtins.formatting.stylua,

      -- python
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.diagnostics.pyproject_flake8,
      null_ls.builtins.formatting.blue,
    },
  })

  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

return {
  {
    "nvimtools/none-ls.nvim",
    config = none_ls_config,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "flake8",
        "pyproject-flake8",
        "blue",
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- if run_on_start is set to true
      debounce_hours = 12, -- if auto_update is set to true
    },
  },
}
