lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "lunarvim/colorschemes" },
	{ "tiagovla/tokyodark.nvim" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{ "mg979/vim-visual-multi", enabled = true, config = function() end },
	{ "ekalinin/Dockerfile.vim" },
	{
		"zbirenbaum/copilot.lua",
		config = function()
			-- vim.defer_fn(function()
			require("copilot").setup({
				plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
			})
			-- end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua", "nvim-cmp" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{ "ChristianChiarulli/swenv.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "mfussenegger/nvim-dap-python" },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup({
	-- 				plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
	-- 				suggestion = {
	-- 					enabled = false,
	-- 					keymap = {
	-- 						next = "<C-]>",
	-- 						prev = "<C-[>",
	-- 						dismiss = "<C-\\>",
	-- 					},
	-- 				},
	-- 				panel = { enabled = false },
	-- 				filetypes = { "lua", "c", "javascript", "typescript", "rust", "python", "html" },
	-- 			})
	-- 		end, 100)
	-- 	end,
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = { "copilot.lua", "nvim-cmp" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			method = "getCompletionsCycling",
	-- 			formatters = {
	-- 				insert_text = require("copilot_cmp.format").remove_existing,
	-- 				preview = require("copilot_cmp.format").deindent,
	-- 				label = require("copilot_cmp.format").format_label_text,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
