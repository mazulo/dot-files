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
        cmd = "Copilot",
        event = "InsertEnter",
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
        event = { "InsertEnter", "LspAttach" },
        fix_pairs = true,
        config = function ()
            require("copilot_cmp").setup()
        end,
    },
    { "onsails/lspkind-nvim" },
	{ "ChristianChiarulli/swenv.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "mfussenegger/nvim-dap-python" },
    {"vmchale/just-vim"},
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
}
