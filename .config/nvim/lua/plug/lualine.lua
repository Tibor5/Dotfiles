return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require
    local palette = require("clrs.kanagawa.palette")
    local theme = require("clrs.kanagawa.theme")
    local kanagawaline = require("clrs.kanagawa.kanagawaline").setup(theme)
    local icon = S.Icons
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        always_divide_middle = true,
        theme = kanagawaline,
        globalstatus = true,
        disabled_filetypes = { statusline = {} },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          { function() return "  " end, color = { bg = "Normal" }, padding = { left = 2, right = 2 } },
          {
            "mode",
            fmt = function() return F.VimMode(false) end,
            color = { bg = palette.sumiInk4 },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
          { function() return "|" end, color = { fg = palette.fujiGray }, padding = { left = 1 } },
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          {
            "filename",
            cond = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
            path = 0,
            symbols = { modified = icon.ui.dot_large, readonly = icon.ui.lock, unnamed = "[Scratch]", newfile = "[New]" },
          },
          { function() return "%=" end },
        },
        lualine_x = {
          {
            "diff",
            cond = function()
              local filepath = vim.fn.expand("%:p:h")
              local gitdir = vim.fn.finddir(".git", filepath .. ";")
              return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
            source = function()
              local g = vim.b.gitsigns_status_dict
              if g then return { added = g.added, modified = g.changed, removed = g.removed } end
            end,
            symbols = { added = icon.git.added, modified = icon.git.modified_simple, removed = icon.git.removed },
            colored = true,
            diff_color = {
              added = { fg = theme.vcs.added },
              modified = { fg = theme.vcs.changed },
              removed = { fg = theme.vcs.removed },
            },
          },
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            symbols = {
              error = icon.diagnostics.error,
              warn = icon.diagnostics.warn,
              info = icon.diagnostics.info,
              hint = icon.diagnostics.hint,
            },
            diagnostics_color = {
              error = { fg = theme.diag.error },
              warn = { fg = theme.diag.warning },
              info = { fg = theme.diag.info },
              hint = { fg = theme.diag.hint },
            },
          },
          { "branch", icon = icon.git.branch, color = { fg = palette.dragonGreen } },
          { function() return "  " end, padding = { left = 2, right = 2 } },
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
