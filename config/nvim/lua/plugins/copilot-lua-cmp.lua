-- return {
--   "zbirenbaum/copilot.lua",
--   specs = {
--     { import = "astrocommunity.completion.copilot-lua" },
--     {
--       "hrsh7th/nvim-cmp",
--       dependencies = { "zbirenbaum/copilot.lua" },
--       opts = function(_, opts)
-- local cmp, copilot = require "cmp", require "copilot.suggestion"
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then return end
-- local function has_words_before()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
-- end
-- if not opts.mapping then opts.mapping = {} end
-- opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
--   if copilot.is_visible() then
--     copilot.accept()
--   elseif cmp.visible() then
--     cmp.select_next_item()
--   elseif luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   elseif has_words_before() then
--     cmp.complete()
--   else
--     fallback()
--   end
-- end, { "i", "s" })
--
-- opts.mapping["<C-x>"] = cmp.mapping(function()
--   if copilot.is_visible() then copilot.next() end
-- end)
--
-- opts.mapping["<C-z>"] = cmp.mapping(function()
--   if copilot.is_visible() then copilot.prev() end
-- end)
--
--         opts.mapping["<C-up>"] = cmp.mapping(function()
--           if copilot.is_visible() then copilot.accept_word() end
--         end)
--
--         opts.mapping["<C-l>"] = cmp.mapping(function()
--           if copilot.is_visible() then copilot.accept_word() end
--         end)
--
--         opts.mapping["<C-down>"] = cmp.mapping(function()
--           if copilot.is_visible() then copilot.accept_line() end
--         end)
--
--         opts.mapping["<C-j>"] = cmp.mapping(function()
--           if copilot.is_visible() then copilot.accept_line() end
--         end)
--
--         opts.mapping["<C-c>"] = cmp.mapping(function()
--           if copilot.is_visible() then copilot.dismiss() end
--         end)
--
--         return opts
--       end,
--     },
--   },
-- }
---@type LazySpec
return {
  "zbirenbaum/copilot-cmp",
  event = "User AstroFile",
  opts = {},
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      opts = {
        suggestion = {
          enabled = false,
          keymap = {
            accept = "<CR>",
            accept_word = true,
            accept_line = true,
            next = "<C-x>",
            prev = "<C-z>",
            dismiss = "<C-c>",
          },
        },
        panel = { enabled = false },
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 5, -- #completions for panel
              inlineSuggestCount = 4, -- #completions for getCompletions
            },
          },
        },
      },
    },
  },
  specs = {
    { import = "astrocommunity.completion.copilot-lua" },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "zbirenbaum/copilot-cmp" },
      opts = function(_, opts)
        -- Inject copilot into cmp sources, with high priority
        table.insert(opts.sources, 1, {
          name = "copilot",
          group_index = 1,
          priority = 10000,
        })
        -- local cmp, copilot = require "cmp", require "copilot.suggestion"
        -- local snip_status_ok, luasnip = pcall(require, "luasnip")
        -- if not snip_status_ok then return end
        -- local function has_words_before()
        --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
        -- end
        --
        -- if not opts.mapping then opts.mapping = {} end
        -- opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        --   if copilot.is_visible() then
        --     copilot.accept()
        --   elseif cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   elseif has_words_before() then
        --     cmp.complete()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" })
      end,
    },
    {
      "onsails/lspkind.nvim",
      optional = true,
      -- Adds icon for copilot using lspkind
      opts = function(_, opts) opts.symbol_map.Copilot = "" end,
    },
  },
}
