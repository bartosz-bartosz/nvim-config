-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Hide Copilot inline suggestions when blink.cmp menu is open
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "Dockerfile", "Dockerfile.*" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})
