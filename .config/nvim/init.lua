local Tim = require("lazyTim")
require("core.functions")
F.DisableBuiltin()
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("lazy").setup("plugins", Tim)
vim.cmd.colorscheme("kanagawa")
