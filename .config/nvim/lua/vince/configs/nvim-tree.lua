local nvim_tree_setup, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_setup then
  return
end

nvim_tree.setup()
