-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Yank from the current position to the end of the line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

-- Yank and paste to clipboard
-- vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "Y", '"+y$', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "P", '"+P', { noremap = true, silent = true })


vim.api.nvim_set_keymap("n", "<Leader>p", '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", '"+y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>d", '"_d', { noremap = true, silent = true })

-- Reset the 'L' and 'H' navigation keys to default
-- lvim.keys.normal_mode["L"] = "L"
-- lvim.keys.normal_mode["H"] = "H"

-- Navigate to next buffer
vim.api.nvim_set_keymap("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
lvim.keys.normal_mode["<A-Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<A-Left>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-Up>"] = ":lua require('harpoon.ui').nav_prev()<CR>"
lvim.keys.normal_mode["<A-Down>"] = ":lua require('harpoon.ui').nav_next()<CR>"

-- my own keymaps
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.cmd("nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>")
vim.cmd("nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>")