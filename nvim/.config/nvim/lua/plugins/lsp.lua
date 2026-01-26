return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    diagnostics = {
      virtual_text = false,
      virtual_lines = true,
    },
    servers = {
      ruff = {
        init_options = {
          settings = {
            configurationPreference = "filesystemFirst",
            showSyntaxErrors = false,
          },
        },
      },
      ty = {
        root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", ".git" },
        settings = {
          ty = {
            experimental = { rename = true, autoImport = true },
            diagnosticMode = "workspace",
          },
        },
      },
      html = {},
      htmx = {},
      basedpyright = { enabled = false },
    },
  },
}
