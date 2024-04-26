-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
lvim.autocommands = {
  {
    { "BufEnter", "BufWinEnter" },
    {
      group = "lvim_user",
      pattern = "Makefile",
      command = "setlocal shiftwidth=2 tabstop=2 noexpandtab",
    },
    {
      group = "lvim_user",
      pattern = "justfile",
      command = "setlocal shiftwidth=2 tabstop=2 noexpandtab",
    },
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "zsh" },
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "FileChangedShellPost", "BufEnter", "BufWinEnter" }, {
  pattern = { "*.lua" },
  command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})

vim.api.nvim_create_autocmd({ "FileType", "FileChangedShellPost", "BufEnter", "BufWinEnter" }, {
  pattern = { "*.py" },
  command = "setlocal tabstop=2 shiftwidth=4 expandtab",
})

vim.api.nvim_create_autocmd({ "FileType", "FileChangedShellPost", "BufEnter", "BufWinEnter" }, {
  pattern = { "*.sh", "*.zsh" },
  command = "setlocal tabstop=4 shiftwidth=4 cmdheight=1",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = { "*.py" },
  command = "e %",
})
