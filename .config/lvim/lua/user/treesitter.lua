-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.auto_install = false
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
}

vim.list_extend(
  lvim.builtin.treesitter.ignore_install,
  { "haskell", "yaml", "yamlls", "yaml-language-server", "yaml_language_server" }
)
lvim.builtin.treesitter.highlight.enable = true
vim.list_extend(lvim.lsp.automatic_configuration.skipped_filetypes, { "yaml", "yml" })
vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers,
  { "yamlls", "yaml-language-server", "yaml_language_server" }
)

local query = {
  filetype = "yaml", -- filetype
  method = require("null-ls").methods.FORMATTING, -- null-ls method
}
local nls = require("null-ls")
nls.disable("yaml")
nls.disable("yamlls")
nls.disable("yamlfix")
nls.disable("yamlfmt")
nls.disable("yaml-language-server")
nls.disable("yaml_language_server")
