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
        model = "qwen2.5-coder:7b",

        -- optional but useful
        chat_dir = vim.fn.stdpath "data" .. "/gp_chats",
      }
    end,
  },
}
