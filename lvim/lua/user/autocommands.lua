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
  {
    { "FileType", },
    {
        group = "lvim_user",
        pattern = "zsh",
        callback = function()
        -- let treesitter use bash highlight for zsh files as well
            require("nvim-treesitter.highlight").attach(0, "bash")
        end,
    },
  },
}
  
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})