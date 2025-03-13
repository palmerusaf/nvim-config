-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- this will set the file time to latex when your are in a md file and between $$ signs
-- this is so you get latex auto completion for math symbols

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*.md",
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Get current column position

    -- Check for inline math mode: `$...$`
    local before_cursor = line:sub(1, col)
    local after_cursor = line:sub(col + 1)

    local inside_inline_math = before_cursor:match "%$[^$]*$" and after_cursor:match "^[^$]*%$"

    -- Check for block math mode: `$$...$$`
    local inside_block_math = before_cursor:match "%$%$[^$]*$" and after_cursor:match "^[^$]*%$%$"

    if inside_inline_math or inside_block_math then
      vim.bo.filetype = "tex" -- Switch to LaTeX syntax
    else
      vim.bo.filetype = "markdown"
    end
  end,
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    }
  end,
})
