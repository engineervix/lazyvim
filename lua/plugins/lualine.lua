return {
  "nvim-lualine/lualine.nvim",
  -- Override the default LazyVim lualine options.
  -- `opts` here is the table LazyVim already built for this plugin,
  -- so we can tweak just the parts we care about.
  opts = function(_, opts)
    -- lualine_z is the rightmost section of the statusline.
    -- LazyVim puts the clock/time component here by default.
    -- Setting it to an empty table removes it entirely.
    opts.sections.lualine_z = {}
  end,
}
