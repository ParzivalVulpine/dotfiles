return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true, -- Enable tailwind colors
      },
    },
  },
}
