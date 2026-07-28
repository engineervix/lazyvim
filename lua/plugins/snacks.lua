return {
  "folke/snacks.nvim",
  -- AeroSpace grabs Alt globally (alt-h = "focus left" etc.), so the
  -- picker's default <a-h>/<a-i> toggles never reach kitty/nvim.
  -- Add Ctrl-based alternates that AeroSpace never intercepts, alongside
  -- (not replacing) the stock alt- bindings.
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<C-h>"] = "toggle_hidden",
            ["<C-i>"] = "toggle_ignored",
          },
        },
      },
    },
  },
}
