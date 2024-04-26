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

require('ts_context_commentstring').setup({
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
  },
})
