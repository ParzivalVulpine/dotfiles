return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter")

      ts.setup({})
      ts.install(opts.ensure_installed, { summary = true })

      local group = vim.api.nvim_create_augroup("nvim-treesitter-features", { clear = true })

      local function enable(bufnr, lang)
        pcall(vim.treesitter.start, bufnr, lang)

        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        for _, winid in ipairs(vim.fn.win_findbuf(bufnr)) do
          vim.wo[winid].foldmethod = "expr"
          vim.wo[winid].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[winid].foldlevel = 99
        end
      end

      local function setup_buffer(bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
          return
        end

        local filetype = vim.bo[bufnr].filetype
        if filetype == "" then
          return
        end

        local lang = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.list_contains(ts.get_available(), lang) then
          return
        end

        local loaded = vim.treesitter.language.add(lang)
        if loaded then
          enable(bufnr, lang)
          return
        end

        ts.install(lang, { summary = true }):await(function(err, ok)
          if err or not ok then
            return
          end

          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(bufnr) then
              enable(bufnr, lang)
            end
          end)
        end)
      end

      vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
        group = group,
        callback = function(event)
          setup_buffer(event.buf)
        end,
      })

      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        setup_buffer(bufnr)
      end
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        -- LazyVim extention to create buffer-local keymaps
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
  },
}
