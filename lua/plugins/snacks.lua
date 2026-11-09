-- wrap long lines in the picker's file preview pane
-- (picker.win.preview is passed through to Snacks.win, see
-- snacks.nvim lua/snacks/picker/core/preview.lua)
return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        -- shrink the margin around the default float (stock: 0.8 x 0.8, see
        -- https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/picker/config/layouts.lua#L5-L10)
        layouts = {
          default = { layout = { width = 0.9, height = 0.9 } },
        },
        win = {
          preview = {
            wo = { wrap = true, linebreak = true, breakindent = true },
          },
        },
      },
    },
  },
}
