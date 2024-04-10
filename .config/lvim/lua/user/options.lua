lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.illuminate.active = false
lvim.builtin.terminal.persist_mode = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.dap.active = true
lvim.log.level = "info"
lvim.colorscheme = "tokyonight-moon"
lvim.leader = ","


local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  showcmd = false,
  relativenumber = false,                  -- set relative numbered lines
  wrap = false,                            -- display lines as one long line
  title = true,
  -- titleold = vim.split(os.getenv("SHELL") or "", "/")[3] ,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
