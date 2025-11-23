return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ruff = {
        init_options = {
          settings = {
            configurationPreference = "filesystemFirst",
          },
        },
      },
      ty = {
        settings = {
          ty = {
            experimental = { rename = true, autoImport = true },
            diagnosticMode = "workspace",
          },
        },
      },
      html = {},
      htmx = {},
    },
  },
}
