local clangd = {
  on_attach = require("core.func").LspAttach,
  filetypes = { "c", "h", "cpp", "chh" },
  root_patterns = { "*.clangd" },
  cmd = { "clangd" },
}

LSP.start(clangd)
