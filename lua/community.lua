-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.tailwindcss" }, WARN: throws error
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  -- { import = "astrocommunity.media.presence-nvim" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- for leet cod open nvim with leetcode.nvim
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  -- import/override with your plugins folder
}
