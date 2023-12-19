return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
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
      cmp.event:on("confirm_done", npairs.on_confirm_done())
      return {
        check_ts = true,
        ts_config = { lua = { "string" }, java = false }
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    opts = {
      opleader = { line = "gc", block = "gb" },
      mappings = { basic = true, extra = true },
      toggler = { line = "gcc", block = "gbc" },
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
    opts = { indent = { char = "│" } }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = { current = false, uppercase = false, after = false, before = true },
      modes = {
        char = {
          jump_labels = true,
          label = { exclude = "hjkliadc" },
          keys = { "f", "F", "t", "T", ";", "," },
        },
      },
    },
    keys = {
      -- { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}
