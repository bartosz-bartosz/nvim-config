return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Chat" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to CodeCompanion Chat" },
  },
  config = function()
    require("codecompanion").setup({
      -- Your codecompanion options here if needed
      strategies = {
        chat = {
          adapter = "copilot"
        },
        inline = {
          adapter = "copilot"
        }
      }
    })
    -- Command line abbreviation
    vim.cmd([[cab cc CodeCompanion]])
  end,

}
