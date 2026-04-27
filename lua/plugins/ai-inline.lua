return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup {
        provider = "ollama",
        provider_options = {
          endpoint = "http://localhost:11434",
          model = "qwen3-coder-next",
        },

        -- THIS enables inline ghost text
        virtualtext = {
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            next = "<M-]>",
            prev = "<M-[>",
          },
        },
      }
    end,
  },
}
