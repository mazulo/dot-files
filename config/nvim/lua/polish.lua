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
vim.opt.laststatus = 3
