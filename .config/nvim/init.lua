local Tim = require("lazyTim")
require("core.functions")
require("core.options")
require("core.keymaps")
require("lazy").setup("plugins", Tim)
require("core.autocmds")
F.DisableBuiltin()
vim.cmd.colorscheme("kanagawa")
