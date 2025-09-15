-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.lsp.config("ty", {
  settings = {
    ty = {
      experimental = {
        rename = true,
      },
    },
  },
})
vim.lsp.enable("ty")
