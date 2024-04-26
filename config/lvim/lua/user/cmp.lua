local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- disable cmp completion in comments
lvim.builtin.cmp.enabled = function()
  local context = require("cmp.config.context")
  if vim.api.nvim_get_mode().mode == "c" then
    return true
  else
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
lvim.builtin.cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lvim.builtin.cmp.window = {
  completion = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
    col_offset = -3,
    side_padding = 1,
    scrollbar = false,
    scrolloff = 8,
  },
  documentation = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
  },
}

vim.opt.pumblend = 10

lvim.builtin.cmp.formatting.source_names = {}

lvim.builtin.cmp.sources[2].entry_filter = function(entry, ctx)
  local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
  if kind == "Snippet" and ctx.prev_context.filetype == "java" then
    return false
  end

  if kind == "Text" and not ctx.prev_context.filetype == "markdown" then
    return false
  end

  return true
end

-- cmp.setup({
--   view = {
--     entries = { name = 'custom', selection_order = 'near_cursor' }
--   },
-- })

-- Add signature help to cmp completion
table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })

-- Add copilot to cmp completion
table.insert(lvim.builtin.cmp.sources, { name = "copilot", group_index = 2 })
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
