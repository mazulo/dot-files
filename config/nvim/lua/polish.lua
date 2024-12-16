-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
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
    source = "filesystem", -- OPTIONAL, this is the default value
    position = "float", -- OPTIONAL, this is the default value
    reveal = true,
    toggle = false,
    reveal_file = reveal_file, -- path to file or folder to reveal
    reveal_force_cwd = true, -- change cwd without asking if needed
  }
end, { desc = "Open neo-tree at current file or working directory" })
vim.opt.laststatus = 3
