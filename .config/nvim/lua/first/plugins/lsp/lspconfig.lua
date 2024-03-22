local config = function()
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local keymap = vim.keymap
  local opts = { noremap = true, silent = true }

  local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
    opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>xd", "<cmd>Lspsaga show_line_diagnostics<CR><cmd>set wrap<CR>", opts)
    opts.desc = "Jump to next diagnostic"
		keymap.set("n", "<leader>xj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    opts.desc = "Jump to previous diagnostic"
		keymap.set("n", "<leader>xk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    opts.desc = "Rename"
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    opts.desc = "Hover documentation"
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Go to definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Code actions"
    keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  local default_setup = function(servers)
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  end

  default_setup({
    "pyright",
    "tsserver",
    "html",
    "cssls",
    "rust_analyzer",
  })

  lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })

end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").setup({
          move_in_saga = { prev = "<C-k>", next = "<C-j>" },
          finder_action_keys = { open = "<CR>" },
          definition_action_keys = { edit = "<CR>" },
        })
      end,
    },
  },
  config = config,
}
