return {
  {
    "neovim/nvim-lspconfig",
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
}
