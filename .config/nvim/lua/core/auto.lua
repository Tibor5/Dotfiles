local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ~ Large-file performance

autocmd("BufReadPre", {
  desc = "Better handle large files.",
  group = augroup("LargeFileSettings", { clear = true }),
  callback = function(info)
    vim.b.bigfile = false
    if F.IsLargeFile(info.buf) then
      vim.b.bigfile = true
      vim.opt_local.spell = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.breakindent = false
      vim.opt_local.colorcolumn = ""
      vim.opt_local.statuscolumn = ""
      vim.opt_local.signcolumn = "no"
      vim.opt_local.foldcolumn = "0"
      vim.opt_local.winbar = ""
      vim.opt_local.syntax = ""
      autocmd("BufReadPost", {
        once = true,
        buffer = info.buf,
        callback = function()
          vim.opt_local.syntax = ""
          return true
        end,
      })
    end
  end,
})

-- ~ Highlight on yank

autocmd("TextYankPost", {
  desc = "Highlight yanked text.",
  group = augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

-- ~ Auto cd

autocmd({ "BufWinEnter", "FileChangedShellPost" }, {
  desc = "Automatically change current working directory based on predefined markers.",
  group = augroup("AutoCWD", { clear = true }),
  pattern = "*",
  callback = function(info)
    if info.file == "" or vim.bo[info.buf].bt ~= "" then return end
    local win = vim.api.nvim_get_current_win()
    vim.schedule(function()
      if
        not vim.api.nvim_buf_is_valid(info.buf)
        or not vim.api.nvim_win_is_valid(win)
        or not vim.api.nvim_win_get_buf(win) == info.buf
      then
        return
      end
      vim.api.nvim_win_call(win, function()
        local dir_from = vim.fn.getcwd(0)
        local dir_to = require("util.fs").root(info.file)
        if dir_to ~= nil and dir_to ~= "" and dir_to ~= dir_from then
          pcall(vim.cmd.lcd, dir_to)
        end
      end)
    end)
  end,
})

-- ~ Close special buffers with `q`

autocmd({ "FileType" }, {
  desc = "Close special buffers with `q`.",
  group = augroup("qCloseSpecialFT", { clear = true }),
  pattern = table.concat(S.FtSpecial, ","),
  callback = function() F.bmap("n", "q", "<C-w>c", 0, "Close current buffer.") end,
})

-- ~ Turn off Ruff LSP Hover when used with Pylsp

autocmd("LspAttach", {
  desc = "LSP: Disable Ruff's hover if used with Pylsp.",
  group = augroup("DisableRuffHover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})

autocmd("ModeChanged", {
  desc = "Change cursor color based on the active mode.",
  group = augroup("CursorColorMode", { clear = true }),
  callback = function()
    local palette = require("clrs.kanagawa.palette")
    local color = palette.lotusYellow5
    local mode = vim.fn.mode()
    if mode == "n" then
      color = palette.lotusYellow5
    elseif mode == "v" or mode == "V" or vim.fn.visualmode() == "" then
      color = palette.crystalBlue
    elseif mode == "i" then
      color = palette.lotusWhite3
    end
    vim.cmd.highlight({ args = { "Cursor", "guibg=" .. color }, bang = true })
  end,
})
