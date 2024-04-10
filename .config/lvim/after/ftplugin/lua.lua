local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ command = "stylua", filetypes = { "lua" } })
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
