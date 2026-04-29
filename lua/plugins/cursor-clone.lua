return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "ollamalocal",
    use_absolute_path = true,
    web_search_engine = {
      provider = "tavily", -- tavily, serpapi, google, kagi, brave, or searxng
      proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
    },
    -- input = {
    --   provider = "telescope",
    -- },
    -- selector = {
    --   provider = "telescope",
    -- },
    tools = {
      glob = false,
    },
    providers = {
      ---@type AvanteProvider
      ollamalocal = {
        ["local"] = true,
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen3.5:9b",
        -- model = "qwen3.5:14b",
        -- model = "qwen2.5-coder:14b", --doesn't work with tools
        -- model = "VladimirGav/Qwen3.6-27B-16GB-VRAM-Uncensored:latest",
        temperature = 0,
        disable_tools = false,
        max_tokens = 8192,
        auto_fix_tool_errors = true,
        stream = true,
        -- num_ctx = 64000, -- for heavy rewrites
        -- num_ctx = 8192, --this doesn't seem to do anything
        mode = "legacy",
        api_key_name = "",
        is_env_set = function() return true end,
      },
    },
  },
}
