return {
  {
    'nvim-mini/mini.pairs',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- Skip autopairing when the next character would produce noisy input.
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { 'string' },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  {
    'folke/ts-comments.nvim',
  },
  {
    'folke/lazydev.nvim',
  },
}
