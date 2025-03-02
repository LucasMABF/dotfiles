return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      auto_install = true,
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "rust", "c",
        "markdown", "markdown_inline",
        "typescript", "javascript", "tsx",
        "diff", "asm", "bash", "powershell" -- diff for telescope commits 
  		},
      silent = true,
  	},
  },
  {
   'mrcjkb/rustaceanvim',
   version = '^5', -- Recommended
   lazy = false, -- This plugin is already lazy
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'saecki/crates.nvim',
    ft = {'toml'},
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = {{name = 'crates'}}
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
      require('nvim-ts-autotag').setup();
    end
  },
}
