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
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:cat ~/.ai_secrets/anthropic",
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot"
        },
        inline = {
          adapter = "copilot"
        }
      },
      prompt_library = {
        ["Add Docstrings & Comments"] = {
          strategy = "chat",
          description = "Add docstrings and comments to code",
          opts = {
            mapping = "<LocalLeader>dc",
            modes = { "n", "v" },  -- Available in both normal and visual modes
            short_name = "docstring",
            auto_submit = true,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = function(context)
                return "You are an expert " .. context.filetype .. " developer who writes clear, concise documentation."
              end,
            },
            {
              role = "user",
              content = function(context)
                local text
                if context.is_visual then
                  -- If in visual mode, get the selected code
                  text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                else
                  -- If in normal mode, get the entire buffer content
                  local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                  text = table.concat(lines, "\n")
                end
                return "#buffer @editor Add docstrings and comments to this code\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
              end,
              opts = {
                contains_code = true,
              }
            },
          },
        },
      }
    })
    -- Command line abbreviation
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
