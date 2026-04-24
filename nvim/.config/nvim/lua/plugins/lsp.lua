return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    diagnostics = {
      virtual_text = false,
      virtual_lines = true,
    },
    servers = {
      -- Python
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
      -- HTML
      html = {},
      htmx = {},
      -- CSS
      tailwindcss = {},
      cssls = { enabled = false },
      --Typescript
      oxfmt = {},
      oxlint = {},
      -- Elixir
      elixirls = { ensure_installed = true },
      -- Lua
      emmylua_ls = {},
    },
  },
}
