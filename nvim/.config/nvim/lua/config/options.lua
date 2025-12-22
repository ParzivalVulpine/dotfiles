-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.g.lazyvim_prettier_needs_config = false
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.o.scrolloff = 999
vim.opt.spelllang = { "en", "es" }
vim.o.textwidth = 80
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 180
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
end
