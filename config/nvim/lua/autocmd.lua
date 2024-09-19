local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env*",
  group = group,
  callback = function(_) vim.diagnostic.enable(false) end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "BufRead" }, {
  pattern = ".env*",
  group = group,
  callback = function() vim.bo.filetype = "env" end,
})
-- {
--     "p00f/clangd_extensions.nvim", -- install lsp plugin
--     lazy = true,
--     init = function()
--       -- load clangd extensions when clangd attaches
--       local augroup =
--         vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
--       vim.api.nvim_create_autocmd("LspAttach", {
--         group = augroup,
--         desc = "Load clangd_extensions with clangd",
--         callback = function(args)
--           if
--             assert(vim.lsp.get_client_by_id(args.data.client_id)).name
--             == "clangd"
--           then
--             require("clangd_extensions")
--             -- add more `clangd` setup here as needed such as loading autocmds
--             vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
--           end
--         end,
--       })
--     end,
--   },
