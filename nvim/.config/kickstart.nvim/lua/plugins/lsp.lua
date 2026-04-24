local server_config = require 'lsp.servers'

return {
  {
    'mason-org/mason.nvim',
    ---@module 'mason.settings'
    ---@type MasonSettings
    ---@diagnostic disable-next-line: missing-fields
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'mason-org/mason.nvim',
    },
    opts = {
      ensure_installed = server_config.ensure_installed,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason-lspconfig.nvim',
      'saghen/blink.cmp',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    opts = {
      servers = server_config.servers,
    },
    config = function(_, opts)
      require('config.lsp').setup(opts.servers)
    end,
  },
}
