return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require "lspconfig"

      lspconfig.r_language_server.setup(vim.tbl_deep_extend("force", opts, {
        handlers = {
          ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            if result and result.diagnostics then
              -- Filter out info and hint messages
              local filtered = {}
              for _, d in ipairs(result.diagnostics) do
                if d.severity ~= vim.diagnostic.severity.HINT and d.severity ~= vim.diagnostic.severity.INFO then
                  table.insert(filtered, d)
                end
              end
              result.diagnostics = filtered
            end
            vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
          end,
        },
      }))
    end,
  },
}
