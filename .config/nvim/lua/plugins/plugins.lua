return {
  -- ~  This file contains various plugins with little to no setup
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "tpope/vim-sleuth",
    event = "BufReadPost",
  },
  {
    "tpope/vim-surround",
    event = "InsertEnter",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = function()
      local npairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        npairs.on_confirm_done()
      )
      return {
        check_ts = true,
        ts_config = {
          lua = { "string" },
          java = false,
        }
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    opts = {
      opleader = {
        line = "gc",
        block = "gb",
      },
      mappings = {
        basic = true,
        extra = true,
      },
      toggler = {
        line = "gcc",
        block = "gbc",
      },
    }
  },
  {
    "Pocco81/true-zen.nvim",
    lazy = true,
    event = { "VeryLazy", "BufEnter" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      indent = {
        char = "│"
      }
    },
  },
}
