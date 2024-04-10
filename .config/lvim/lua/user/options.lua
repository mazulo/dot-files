lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.illuminate.active = false
lvim.builtin.terminal.persist_mode = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.dap.active = true
-- general
lvim.log.level = "info"
lvim.colorscheme = "tokyonight-moon"
lvim.leader = ","

-- vim.o.foldcolumn = "1" -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- UFO folding
-- vim.o.foldcolumn = "1" -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- these are "extra", change them as you like
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- vim options
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldcolumn = "3"
-- custom config
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120

local options = {
  -- backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  -- hlsearch = true, -- highlight all matches on previous search pattern
  -- ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  -- showmode = false, -- we don't need to see things like -- INSERT -- anymore
  -- smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  -- swapfile = false, -- creates a swapfile
  -- termguicolors = true, -- set term gui colors (most terminals support this)
  -- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  -- cursorline = true, -- highlight the current line
  -- number = true, -- set numbered lines
  -- laststatus = 3,
  -- showcmd = false,
  -- ruler = false,
  relativenumber = false, -- set relative numbered lines
  -- numberwidth = 4, -- number column width
  -- signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  -- scrolloff = 0,
  -- sidescrolloff = 8,
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  -- title = true,
  -- titleold = vim.split(os.getenv("SHELL") or "", "/")[3] ,
  -- foldlevel = 20,
  -- foldmethod = "indent",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {"treesitter", "indent"}
--     end
-- })
