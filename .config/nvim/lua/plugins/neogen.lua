return {
  "danymat/neogen",
  config = true,
  keys = function()
    local keys = {
      {
        "<leader>nf",
        function()
          require("neogen").generate()
        end,
        desc = "Neogen generate docstrings",
      },
    }
    return keys
  end,
}
