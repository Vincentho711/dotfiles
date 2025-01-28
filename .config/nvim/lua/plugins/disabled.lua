return {
  -- NV specific
  { "saghen/blink.cmp", enabled = false }, -- Disable blink.cmp as one of its prebuilt .so requires glibc >=2.18 which doesn't exist on CentOS7. Use nvim-cmp instead.
}
