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
      adapters = {
        -- Nvidia perflab endpoint for using LLMs like Claude or ChatGPT
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            -- url = "https://integrate.api.nvidia.com/v1/chat/completions",
            -- url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/o3-mini-20250131/chat/completions?api-version=2024-12-01-preview",
            -- url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/gpt-4.1-20250414/chat/completions",
            -- url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/claude-3-7-sonnet-20250219/chat/completions",
            url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/claude-sonnet-4-20250514/chat/completions",
            env = {
              -- api_key = "cmd:gpg --quiet --decrypt ~/.openai_api_key.asc",
              -- api_key = "cmd:gpg --quiet --decrypt ~/.perflab_api_key.asc",
              -- api_key = os.getenv("PERFLAB_API_KEY") or function()
              --   vim.notify("PERFLAB_API_KEY not found in environment", vim.log.levels.ERROR)
              --   return ""
              -- end
              api_key = function()
                local key = os.getenv("PERFLAB_API_KEY")
                if not key or key == "" then
                  require("noice").notify("PERFLAB_API_KEY not found or empty. Please set it in your environment.", "error", {
                    title = "CodeCompanion Error",
                    timeout = 5000,
                    render = "minimal",
                  })
                  return nil -- Return nil to make the error more obvious
                end
                return key
              end
            },
            schema = {
              model = {
                -- default = "nvdev/nvidia/llama-3.1-nemotron-70b-instruct",
                -- default = "nvdev/meta/llama-3.3-70b-instruct",
                -- default = "nvdev/deepseek-ai/deepseek-r1",
                -- default = "gpt-4o-20241120",
                -- default = "o3-mini-20250131",
                -- default = "claude-3-5-sonnet-20241022",
                -- default = "claude-3-5-sonnet-20240620",
                -- default = "claude-3-7-sonnet-20250219",
                default = "claude-sonnet-4-20250514",
              },
            },
          })
        end,
        -- Chipnemo endpoint
        chipnemo_copilot = function ()
          return require("codecompanion.adapters").extend("openai", {
            url = "https://chipnemo-chat-api.nvidia.com/api/v1/chat/completions",
            env = {
              api_key = function()
                local key = os.getenv("CHIPNEMO_QA_BOT_TOKEN")
                if not key or key == "" then
                  require("noice").notify("CHIPNEMO_QA_BOT_TOKEN not found or empty. Please set it in your environment to use chipnemo.", "error", {
                    title = "CodeCompanion Error",
                    timeout = 5000,
                    render = "minimal",
                })
                return nil -- Return nil to make the error more obvious
              end
              return key
            end
          },
          schema = {
            model = {
              order = 1,
              -- mapping = "parameters", -- "parameters" will make it part of the HTTP payload
              mapping = "temp", -- Use "temp" to avoid this model to make it to the HTTP payload
              type = "enum",
              default = "gpt4o",
              optional = true
            },
            stream = {
              order = 2,
              mapping = "parameters",
              type = "boolean",
              default = true
            },
            copilot = {
              order = 3,
              mapping = "parameters",
              optional = false,
              type = "enum",
              default = "router",
              choices = {
                "ghw-farm",
                "hwteg-info",
                "heteg-soul",
                "ghw-viva",
                "hwip-stepstone"
              },
              team = {
                order = 4,
                mapping = "parameters",
                type = "enum",
                default = "gpu",
                optional = true,
                choices = {
                  "gpu"
                }
              },
              is_agentic_rag = {
                order = 5,
                mapping = "parameters",
                type = "boolean",
                default = false
              },
            }
          }
        })
        end,
        gemini = function ()
          return require("codecompanion.adapters").extend("gemini", {
            -- url = "https://llm-proxy.perflab.nvidia.com/gemini/v1beta/models/gemini-2.5-pro:generateContent",
            url = "https://inference-api.nvidia.com/v1/chat/completions",
            env = {
              api_key = function()
                local key = os.getenv("INFERENCE_HUB_API_KEY")
                if not key or key == "" then
                  require("noice").notify("INFERENCE_HUB_API_KEY not found or empty. Please set it in your environment to use gemini.", "error", {
                    title = "CodeCompanion Error",
                    timeout = 5000,
                    render = "minimal",
                })
                return nil -- Return nil to make the error more obvious
              end
              return key
            end
          },
          schema = {
            model = {
              -- default = "gemini-2.5-pro"
              default = "gcp/google/gemini-3-pro"
            }
          }
        })
      end
      },
      display = {
        diff = {
          provider = "mini_diff",
        },
    	},
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "openai",
          slash_commands = {
            ["buffer"]  = { opts = { provider = "snacks", }, },
            ["file"]    = { opts = { provider = "snacks", }, },
            ["symbol"]  = { opts = { provider = "snacks", }, },
            ["help"]    = { opts = { provider = "snacks", }, },
          },
          tools = {
          },
        },
        inline = { adapter = "openai" },
        agent = { adapter = "openai" },
      },
    }
}

