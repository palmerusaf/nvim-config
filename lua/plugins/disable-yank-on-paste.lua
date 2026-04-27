return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings = opts.mappings or {}

      opts.mappings.v = opts.mappings.v or {}

      -- FIX: prevent clipboard overwrite when pasting over selection
      opts.mappings.v.p = { '"_dP', desc = "Paste without yanking replaced text" }
    end,
  },
}
