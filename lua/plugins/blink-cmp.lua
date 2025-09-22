return {
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
      "fang2hou/blink-copilot",
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<CR>"] = { "fallback" },
      },
    },
  },
}
