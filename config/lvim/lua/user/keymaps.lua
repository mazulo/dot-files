-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", ":SessionLoad<CR>", {})

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>ql", ":Telescope persisted<CR>", {})

-- save the current session
vim.api.nvim_set_keymap("n", "<leader>qS", ":SessionSave<CR>", {})

-- delete the current session
vim.api.nvim_set_keymap("n", "<leader>qD", ":SessionDelete<CR>", {})

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

-- my own keymaps
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.cmd("nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>")
vim.cmd("nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>")

-- triptych
vim.keymap.set('n', '<Leader>-', ':Triptych<CR>', { silent = true })

-- trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

