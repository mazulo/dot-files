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
-- Automate Python venv selection
-- vim.api.nvim_create_autocmd("LspAttach", {
--   desc = "Auto select virtualenv Nvim open",
--   pattern = "*",
--   callback = function()
--     local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
--     if venv ~= "" then require("venv-selector").retrieve_from_cache() end
--   end,
--   once = true,
-- })
