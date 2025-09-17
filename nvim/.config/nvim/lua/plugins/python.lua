return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        ty = {
          settings = {
            diagnosticMode = "workspace",
            experimental = { rename = true },
          },
        },
      },
    },
  },
}
