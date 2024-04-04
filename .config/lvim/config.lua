-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "3"
-- pyright configuration
vim.lsp.set_log_level("info")

-- general
lvim.log.level = "info"
lvim.colorscheme = "tokyonight-moon"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}
lvim.leader = ","
-- add your own keymapping

-- setup formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
})

-- custom config
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120


-- require("lspconfig")["dockerls"].setup({})
lvim.lsp.automatic_servers_installation = false

reload("user.plugins")
reload("user.nvimtree")
reload("user.git")
reload("user.cmp")
reload("user.copilot-config")
reload("user.options")
reload("user.python")
reload("user.javascript")
reload("user.autocommands")
reload("user.keymaps")
reload("user.treesitter")
reload("user.whichkey")
reload("user.go")
reload("user.telescope")
