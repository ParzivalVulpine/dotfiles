return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}, -- equivalent to config = true, but explicit
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "emmylua_ls" },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- setup all installed servers
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end

      -- Overrides

    end,
  },
}
