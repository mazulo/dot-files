---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = false,
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "lua",
        },
        ignore_filetypes = {
          "python",
        },
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {},
    handlers = {},
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          event = { "CursorHold", "CursorHoldI" },
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        x = { '"_x' },
        d = { '"_d' },
        D = { '"_D' },
        p = { '"_dP' },
        y = { '"+y' },
        Y = { '"+y$' },
      },
      v = {
        x = { '"_x' },
        d = { '"_d' },
        D = { '"_D' },
        y = { '"+y' },
      },
    },
  },
  on_attach = function(client, _)
    if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end
  end,
}
