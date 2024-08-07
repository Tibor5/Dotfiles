local gopls = {
  on_attach = require("core.func").LspAttach,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_patterns = { "*.go" },
  cmd = { "gopls" },
}

require("util.lsp").start(gopls)
