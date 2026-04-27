return {
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup {
        providers = {
          ollama = {
            endpoint = "http://localhost:11434/v1",
          },
        },

        default_provider = "ollama",
        default_model = "qwen3-coder-next", -- change if needed

        -- optional but useful
        chat_dir = vim.fn.stdpath "data" .. "/gp_chats",
      }
    end,
  },
}
