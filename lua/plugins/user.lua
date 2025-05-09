-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim", WARN: this throws errors related to discord bug
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = " ", key = "d", desc = "Dir", action = "<CMD>norm -<CR>" },
          },
          header = table.concat({
            "neovim",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "NotifyBackground",
      fps = 30,
      level = 2,
      minimum_width = 50,
      max_width = 200,
      render = "compact",
      stages = "static",
      timeout = 2000,
      top_down = true,
    },
  },
  {
    "delphinus/vim-firestore",
    event = "BufEnter *.rules",
  },
  {
    "evesdropper/luasnip-latex-snippets.nvim",
  },
  -- edits the directory in buffer press '-' to activate
  {
    "stevearc/oil.nvim",
    opts = {
      win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", mode = { "n" }, desc = "Open parent directory" },
      {
        "gc",
        function()
          local oil = require "oil"
          local dir = oil.get_current_dir()
          if dir then
            vim.cmd("cd " .. dir)
            print("Changed directory to: " .. dir)
          else
            print "Failed to get Oil directory"
          end
        end,
        mode = { "n" },
        desc = "Change to current Oil directory",
      },
    },
  },
  {
    "Wansmer/treesj",
    keys = { "<leader>m", "<leader>j", "<leader>S" },
    opts = {
      max_join_length = 240,
      max_split_length = 240,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup { --[[ your config ]]
      }
    end,
  },
  {
    "danymat/neogen",
    opts = {},
    keys = {
      { "<leader>lj", "<cmd>Neogen<cr>", mode = { "n" }, desc = "Create JsDoc" },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
