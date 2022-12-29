local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader><space>", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fa", telescope_builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.grep_string, {})
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>p", '"+p')

