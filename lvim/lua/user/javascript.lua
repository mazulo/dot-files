-- setup formatting
local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
	{ command = "clang-format", filetypes = { "javascript", "json" } },
})
