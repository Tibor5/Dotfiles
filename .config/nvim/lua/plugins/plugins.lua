return {
  -- ~  This file contains various plugins with little to no setup
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "tpope/vim-sleuth",
    event = "BufReadPost",
  },
  {
    "tpope/vim-surround",
    event = "BufEnter",
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
    event = "VeryLazy",
    opts = {},
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
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
}
