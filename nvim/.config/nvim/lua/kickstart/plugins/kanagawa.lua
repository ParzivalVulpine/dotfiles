return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			vim.cmd.colorscheme("kanagawa-dragon")
			-- You can configure highlights by doing something like:
		end,
	},
}
