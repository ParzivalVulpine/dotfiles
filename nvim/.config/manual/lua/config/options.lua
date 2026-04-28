vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

vim.o.inccommand = "split"
vim.o.cursorline = true

vim.o.confirm = true
vim.o.scrolloff = 999
vim.opt.spelllang = { "en", "es" }
vim.o.textwidth = 80

vim.opt.termguicolors = true
vim.g.snacks_animate = false

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 180
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
end
