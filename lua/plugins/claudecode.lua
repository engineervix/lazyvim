return {
  "coder/claudecode.nvim",
  -- Override the default LazyVim ai.claudecode extra options.
  -- The other keybindings come from the extra itself.
  event = "VeryLazy", -- start the IDE server without waiting for a keypress
  keys = {
    -- The extra doesn't bind this for the Snacks explorer.
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file", ft = "snacks_picker_list" },
  },
  opts = {
    diff_opts = { open_in_new_tab = true },
  },
}
