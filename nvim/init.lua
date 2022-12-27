require("plugins")
require("file-explorer")
require("mason-config")
require("code-completion")
require("custom-keys")
require("debugging")
require("styling")
require("file-finder")
require("syntax-highlight")
require("lsp_config")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"quick_lint_js",
		"tsserver",
		"pylsp",
		"html",
	},
})
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"css",
		"json",
		"lua",
		"python",
	},
})
require("nvim-tree").setup({
	hijack_cursor = false,
	on_attach = function(bufnr)
		local bufmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- See :help nvim-tree.api
		local api = require("nvim-tree.api")

		bufmap("L", api.node.open.edit, "Expand folder or go to file")
		bufmap("H", api.node.navigate.parent_close, "Close parent folder")
		bufmap("gh", api.tree.toggle_hidden_filter, "Toggle hidden files")
	end,
})

vim.cmd([[
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline#extension#tabline#left_sep=' '
  let g:airline#extension#tabline#left_alt_sep='|'
  let g:airline#extension#tabline#formatter='unique_tail'
  set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
  set cursorline " Highlights the current line in the editor
  set autoindent " Indent a new line
  set mouse=a " Allow to use the mouse in the editor
  set number " Shows the line numbers
  set title
  filetype plugin indent on   " Allow auto-indenting depending on file type
  " Enable Tab / Shift Tab to cycle completion options
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  let g:completion_enable_fuzzy_match = 1
	set clipboard^=unnamed,unnamedplus
]])
