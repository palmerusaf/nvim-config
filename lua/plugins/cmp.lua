return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = {
    -- add the legacy cmp source as a dependency for `blink.cmp`
    "kdheepak/cmp-latex-symbols",
  },
  specs = {
    -- install the blink, nvim-cmp compatibility layer
    { "saghen/blink.compat", version = "*", lazy = true, opts = {} },
  },
  opts = {
    sources = {
      default = { "avante_commands", "avante_mentions", "avante_files" },
      providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },
      },
    },
  },
}
