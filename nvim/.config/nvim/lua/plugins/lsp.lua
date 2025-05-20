return {
  {
    "neovim/nvim-lspconfig",
    version = "1.11.0",
    opts = {
      servers = {
        gdscript = {},
        gdshader_lsp = {},
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              fixAll = true,
            },
          },
        },
        templ = {},
        gopls = {},
        html = {},
        htmx = {},
        tailwindcss = {},
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "1.32.0",
  },
}
