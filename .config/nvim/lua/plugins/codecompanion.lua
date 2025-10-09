return {
    "olimorris/codecompanion.nvim",
    dependencies = {
      {"nvim-mini/mini.diff", opts = {}},
      {"folke/noice.nvim"}, -- For showing the status of LLM, used by companion-notification.lua
      {"nvim-lua/plenary.nvim" },
    },
    keys = {
      { mode = { 'n', 'x' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'toggle ai chat' },
      { mode = { 'n', 'x' }, '<leader>ai', ':CodeCompanion<cr>',                desc = 'ask chat inline' },
      { mode = { 'n', 'x' }, '<leader>am', ':CodeCompanionActions<cr>',         desc = 'CodeCompanionActions' },
      { mode = { 'v' },      '<leader>aa', '<cmd>CodeCompanionChat Add<cr>',    desc = 'CodeCompanionChat add' },
    },
    init = function()
      require("plugins.ai.extensions.companion-notification").init()
    end,
    opts = {
      display = {
        diff = {
          provider = "mini_diff",
        },
    	},
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "copilot",
          slash_commands = {
            ["buffer"]  = { opts = { provider = "snacks", }, },
            ["file"]    = { opts = { provider = "snacks", }, },
            ["symbol"]  = { opts = { provider = "snacks", }, },
            ["help"]    = { opts = { provider = "snacks", }, },
          },
          tools = {
          },
        },
        inline = { adapter = "copilot" },
        agent = { adapter = "copilot" },
      },
    }
}

