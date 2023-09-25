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
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
