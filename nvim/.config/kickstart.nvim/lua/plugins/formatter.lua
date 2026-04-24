local formatters_by_ft = {
  awk = { 'gawk' },
  fish = { 'fish_indent' },
  go = { 'goimports', 'gofmt' },
  javascript = { 'oxlint', 'oxfmt' },
  javascriptreact = { 'oxlint', 'oxfmt' },
  jq = { 'gojq' },
  json = { 'oxfmt' },
  jsonc = { 'oxfmt' },
  markdown = { 'markdownlint', 'markdownfmt' },
  typescript = { 'oxlint', 'oxfmt' },
  typescriptreact = { 'oxlint', 'oxfmt' },
}

local function get_formatters(bufnr)
  local filetype = vim.bo[bufnr].filetype
  local formatters = formatters_by_ft[filetype]
  if type(formatters) ~= 'table' then return {} end

  local names = {}
  for _, formatter in ipairs(formatters) do
    if type(formatter) == 'string' then
      table.insert(names, formatter)
    end
  end
  return names
end

local function notify_missing_formatter(bufnr)
  local filetype = vim.bo[bufnr].filetype
  if filetype == '' then filetype = 'this buffer' end
  vim.notify('No formatter configured for ' .. filetype, vim.log.levels.INFO)
end

local function has_conform_formatter(bufnr)
  local conform = require 'conform'
  for _, formatter in ipairs(get_formatters(bufnr)) do
    local info = conform.get_formatter_info(formatter, bufnr)
    if info.available then return true end
  end
  return false
end

local function has_lsp_formatter(bufnr)
  for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
    if client:supports_method('textDocument/formatting') then return true end
  end
  return false
end

local function get_format_opts(bufnr)
  if has_conform_formatter(bufnr) then
    return { bufnr = bufnr, lsp_format = 'never' }
  end

  if has_lsp_formatter(bufnr) then
    return { bufnr = bufnr, lsp_format = 'prefer' }
  end
end

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
      },
    },
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local format_opts = get_format_opts(bufnr)
          if not format_opts then
            notify_missing_formatter(bufnr)
            return
          end

          format_opts.async = true
          require('conform').format(format_opts)
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_no_formatters = false,
      notify_on_error = false,
      format_on_save = function(bufnr)
        local format_opts = get_format_opts(bufnr)
        if format_opts then return vim.tbl_extend('force', format_opts, { timeout_ms = 500 }) end

        notify_missing_formatter(bufnr)
      end,
      formatters_by_ft = formatters_by_ft,
    },
  },
}
