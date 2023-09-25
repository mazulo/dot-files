lvim.builtin.which_key.mappings.y = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings.p = { '"+p', "paste from clipboard" }
lvim.builtin.which_key.mappings.P = { '"+P', "Paste from clipboard" }
lvim.builtin.which_key.mappings.y = {
	y = {
		'"+yy',
		"Yank line to clipboard",
	},
}
lvim.builtin.which_key.vmappings.y = {
	'"+y',
	"Yank to clipboard",
}
lvim.builtin.which_key.vmappings.p = {
	'"+p',
	"Paste from clipboard",
}

lvim.builtin.which_key.mappings["g"] = {
	name = "Git",
	s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	C = {
		"<cmd>Telescope git_bcommits<cr>",
		"Checkout commit(for current file)",
	},
	d = {
		"<cmd>Gitsigns diffthis HEAD<cr>",
		"Git Diff",
	},
	-- g = { "<cmd>LazyGit<cr>", "LazyGit" },
	M = {
		":!git branch --merged | Select-String -Pattern '^(?!.*(master|.*-stable)).*$' | ForEach-Object { git branch -d $_.ToString().Trim() } <cr>",
		"clean merged branch",
	},
}
lvim.builtin.which_key.mappings["s"] = {
	name = "Search",
	c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	f = { "<cmd>Telescope find_files<cr>", "Find File" },
	h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
	M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	R = { "<cmd>Telescope registers<cr>", "Registers" },
	t = {
		"<cmd>lua require('telescope.builtin').live_grep({layout_strategy = 'vertical', layout_config = {width = 0.7, height = 0.8, preview_cutoff = 60, prompt_position = 'top'}})<cr>",
		"Text",
	},
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	C = { "<cmd>Telescope commands<cr>", "Commands" },
	l = { "<cmd>Telescope resume<cr>", "Resume last search" },
	p = {
		"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
		"Colorscheme with Preview",
	},
}
lvim.builtin.which_key.setup.layout = {
	height = { min = 100, max = 100 },
	width = { min = 160, max = 160 },
	spacing = 3,
	align = "center",
}

lvim.builtin.which_key.setup.plugins.presets["operators"] = false
lvim.builtin.which_key.setup.ignore_missing = true

lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

lvim.builtin.which_key.mappings["a"] = {
  name = "A.I.",
  c = { "<cmd>ChatGPT<cr>", "ChatGPT" },
  a = { "<cmd>ChatGPTActAs<cr>", "Act As GPT" },
  e = { "<cmd>ChatGPTEditWithInstructions<cr>", "Edit GPT" },
  r = { "<cmd>ChatRunCustomCodeAction<cr>", "Code Action GPT" },
  s = { "<cmd>Copilot suggestion<cr>", "Toggle Copilot Suggestion" },
  p = { "<cmd>Copilot panel<cr>", "Toggle Copilot Panel" },
  t = { "<cmd>Copilot toggle<cr>", "Toggle Copilot" },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
  O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
  g = { "<cmd>Neogit<cr>", "Neogit" },
  j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  l = { "<cmd>GitBlameToggle<cr>", "Blame" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  n = { ":!git checkout -b ", "Checkout New Branch" },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Diff",
  },
  G = {
    name = "Gist",
    a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
    d = { "<cmd>Gist -d<cr>", "Delete" },
    f = { "<cmd>Gist -f<cr>", "Fork" },
    g = { "<cmd>Gist -b<cr>", "Create" },
    l = { "<cmd>Gist -l<cr>", "List" },
    p = { "<cmd>Gist -b -p<cr>", "Create Private" },
  },
}

lvim.builtin.which_key.mappings["l"] = {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Get Capabilities" },
  -- c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
  d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
  w = {
    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    "Workspace Diagnostics",
  },
  f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
  F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
  H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    "Prev Diagnostic",
  },
  v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  o = { "<cmd>SymbolsOutline<cr>", "Outline" },
  q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
  r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
  u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Tab",
  t = {
    "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
    "Find Tab",
  },
  n = { "<cmd>tabnew %<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
  o = { "<cmd>tabonly<cr>", "Only Tab" },
}


-- lvim.builtin.which_key.mappings[";"] = nil
-- lvim.builtin.which_key.mappings["c"] = nil
-- lvim.builtin.which_key.mappings["L"] = nil
-- lvim.builtin.which_key.mappings["s"] = nil
-- lvim.builtin.which_key.mappings["w"] = nil
