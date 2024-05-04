return {
  -- ~ ITALIC ------------------------------------------------------------------------- ~ --

  -- ~  Material
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1010,
    init = function() vim.g.material_style = "deep ocean" end,
    opts = {
      contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        lsp_virtual_text = false,
        non_current_windows = false,
        filetypes = {},
      },
      styles = {
        comments = { italic = true },
        strings = {},
        keywords = {},
        functions = { bold = true },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = { "flash", "gitsigns", "indent-blankline", "neogit", "noice", "nvim-cmp", "nvim-web-devicons" },
      disable = { colored_cursor = false, borders = false, background = false, term_colors = false, eob_lines = false },
      high_visibility = { lighter = true, darker = true },
      lualine_style = "stealth",
      async_loading = true,
      custom_colors = nil,
      custom_highlights = {},
    },
  },

  -- ~  Midnight
  -- { "dasupradyumna/midnight.nvim", lazy = false, priority = 1010 },

  -- ~  Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1010,
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      overrides = function(colors)
        local t = colors.theme
        -- local p = colors.palette
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- NormalDark = { fg = t.ui.fg_dim, bg = t.ui.bg_m3 },
          MasonNormal = { bg = "none", fg = t.ui.fg_dim },
          LazyNormal = { bg = "none", fg = t.ui.fg_dim },
          -- TelescopeTitle = { fg = p.lotusWhite3, bold = true },
          -- TelescopePromptNormal = { fg = p.lotusWhite3 },
          -- TelescopePromptBorder = { fg = p.lotusWhite3, bg = t.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = p.lotusWhite3, bg = t.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = p.lotusWhite3, bg = t.ui.bg_m1 },
          -- TelescopePreviewNormal = { fg = p.lotusWhite3, bg = t.ui.bg_dim },
          -- TelescopePreviewBorder = { fg = p.lotusWhite3, bg = t.ui.bg_dim },
        }
      end,
      -- fg fg_dim fg_reverse bg_dim bg_gutter bg_m3 bg_m2 bg_m1
      -- bg_p1 bg_p2 special nontext whitespace bg_search bg_visual
      colors = { theme = { all = { ui = { bg_gutter = "none" } }, wave = { ui = { bg = "#0F1419" } } } },
      theme = "wave",
    },
  },

  -- ~ -------------------------------------------------------------------------------- ~ --

  -- ~  Neodark/er (ayu / neobones)
  -- { "VDuchauffour/neodark.nvim", lazy = false, priority = 1010, opts = { theme_style = "neodarker" } },
}
