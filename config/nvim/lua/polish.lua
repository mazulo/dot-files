vim.keymap.set("n", "-", function()
  local reveal_file = vim.fn.expand "%:p"
  if reveal_file == "" then
    reveal_file = vim.fn.getcwd()
  else
    local f = io.open(reveal_file, "r")
    if f then
      f.close(f)
    else
      reveal_file = vim.fn.getcwd()
    end
  end
  require("neo-tree.command").execute {
    source = "filesystem",
    position = "float",
    reveal = true,
    toggle = false,
    reveal_file = reveal_file,
    reveal_force_cwd = true,
  }
end, { desc = "Open neo-tree at current file or working directory" })

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
