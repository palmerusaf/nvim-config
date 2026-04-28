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
    input = {
      provider = "snacks",
    },
    selector = {
      provider = "snacks",
    },
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
        temperature = 0,
        disable_tools = false,
        max_tokens = 8192,
        auto_fix_tool_errors = true,
        stream = true,
        num_ctx = 64000,
        mode = "legacy",
        api_key_name = "",
        is_env_set = function() return true end,
      },
    },
  },
}
