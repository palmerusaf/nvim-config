-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        --Session lowercase s remap
        ["<Leader>s"] = { name = "󱂬 Session" },
        ["<Leader>sl"] = { function() require("resession").load "Last Session" end, desc = "Load last session" },
        ["<Leader>ss"] = { function() require("resession").save() end, desc = "Save this session" },
        ["<Leader>sS"] = {
          function() require("resession").save(vim.fn.getcwd(), { dir = "dirsession" }) end,
          desc = "Save this dirsession",
        },
        ["<Leader>st"] = { function() require("resession").save_tab() end, desc = "Save this tab's session" },
        ["<Leader>sd"] = { function() require("resession").delete() end, desc = "Delete a session" },
        ["<Leader>sD"] = {
          function() require("resession").delete(nil, { dir = "dirsession" }) end,
          desc = "Delete a dirsession",
        },
        ["<Leader>sf"] = { function() require("resession").load() end, desc = "Load a session" },
        ["<Leader>sF"] = {
          function() require("resession").load(nil, { dir = "dirsession" }) end,
          desc = "Load a dirsession",
        },
        ["<Leader>s."] = {
          function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end,
          desc = "Load current dirsession",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["<Leader>S"] = false,
        ["<Leader>Sl"] = false,
        ["<Leader>Ss"] = false,
        ["<Leader>SS"] = false,
        ["<Leader>St"] = false,
        ["<Leader>Sd"] = false,
        ["<Leader>SD"] = false,
        ["<Leader>Sf"] = false,
        ["<Leader>SF"] = false,
        ["<Leader>S."] = false,
      },
    },
  },
}
