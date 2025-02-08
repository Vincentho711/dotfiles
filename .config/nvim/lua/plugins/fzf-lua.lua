return {
  "ibhagwan/fzf-lua",
  opts = {
    grep = {
      rg_glob = true, --Enable glob to be used in fzf-lua searches
    },
  },
  keys = {
    -- Change the "Show help page" keymap such that "Show hunk" of signify can use the <leader>sh keymap
    {"<leader>sx", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages"}
  }
}
