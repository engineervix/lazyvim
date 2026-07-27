return {
  "lewis6991/gitsigns.nvim",
  -- Override the default LazyVim gitsigns options.
  -- `opts` here is merged (deep-extended) into LazyVim's own gitsigns
  -- spec, so existing keymaps (<leader>ghb, <leader>ghB, etc.) still work.
  opts = {
    -- Always-on inline blame for the current line, instead of the
    -- one-shot popups from <leader>ghb / <leader>ghB.
    current_line_blame = true,
    current_line_blame_opts = {
      -- Delay (ms) before the blame virtual text appears after moving
      -- the cursor, so it doesn't flicker while scrolling/jumping.
      delay = 300,
    },
    current_line_blame_formatter = "   <author>, <author_time:%R> - <summary>",
  },
}
