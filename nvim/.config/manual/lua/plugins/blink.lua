return {
  {
    "saghen/blink.cmp",
dependencies = {
    'saghen/blink.lib',
  },
build = function()
    require('blink.cmp').build():wait(60000)
  end,
   version = "*",
    opts = {
fuzzy = { implementation = "prefer_rust_with_warning" },
      keymap = {
        preset = "enter",
      },

      completion = {
        list = {
          selection = {
            preselect = false, -- no auto-selection
          },
        },

        menu = {
          border = "rounded", -- rounded completion menu
        },

        documentation = {
          auto_show = true,
          window = {
            border = "rounded", -- rounded docs window
          },
        },

        ghost_text = {
          enabled = true, -- inline suggestion text
        },
      },

      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
}
