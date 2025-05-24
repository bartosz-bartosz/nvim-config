return {

  {
    "zbirenbaum/copilot.lua",
    optional = true,
    config = function()
      require("copilot").setup({
        copilot_model = "claude-4-opus",
      })
    end,
  },
}
