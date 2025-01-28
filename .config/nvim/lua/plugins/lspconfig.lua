return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local lspconfig = require("lspconfig")

    -- Setup Verible LSP with custom root_dir
    lspconfig.verible.setup({
      root_dir = function()
        return vim.loop.cwd() -- Use the current working directory as the root
      end,
      -- Additional configuration options can go here
    })

    -- Setup clangd LSP with custom root_dir
    lspconfig.clangd.setup({
      root_dir = function()
        return vim.loop.cwd() -- Use the current working directory as the root
      end,
      -- NV specific
      -- Specify the clangd version to be used by path
      -- Otherwise, the default clangd installed in /home/viho/.local/share/nvim/mason/bin/clangd
      -- will have an older version of glibc which causes an error
      cmd = {
      "/home/utils/llvm-14.0.0/bin/clangd", -- Specify the path to clangd
      },    -- In the future, we can add the nvboot_common path such that definitions can be found by clangd LSP
    })
  end,
}
