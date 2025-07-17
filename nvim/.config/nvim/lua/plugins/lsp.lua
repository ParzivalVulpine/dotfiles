return {
  {
    "neovim/nvim-lspconfig",
    version = "1.11.0",
    opts = {
      servers = {
        gdscript = {
          cmd = { "nc", "127.0.0.1", "6005" },
          filetypes = { "gd", "gdscript", "gdscript3" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "project.godot",
              ".git"
            )(fname)
          end,
          single_file_support = false,
          settings = {},
        },
        gdshader_lsp = {},
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              fixAll = true,
            },
          },
        },
        pyright = {},
        templ = {},
        gopls = {},
        html = {},
        tailwindcss = {},
      },
    },
    init = function()
      -- File type detection for GDScript
      vim.filetype.add({
        extension = {
          gd = "gdscript",
        },
        filename = {
          ["project.godot"] = "gdresource",
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "1.32.0",
  },
  -- Ensure GDScript treesitter parser is installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gdscript" })
    end,
  },
}
