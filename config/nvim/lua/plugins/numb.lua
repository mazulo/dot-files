return {
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup {
        show_numbers = true,
        show_cursorline = true,
        hide_relativenumbers = true,
        number_only = false,
        centered_peeking = true,
      }
    end,
  },
}