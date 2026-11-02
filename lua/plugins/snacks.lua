-- wrap long lines in the picker's file preview pane
-- (picker.win.preview is passed through to Snacks.win, see
-- snacks.nvim lua/snacks/picker/core/preview.lua)
return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        win = {
          preview = {
            wo = { wrap = true, linebreak = true, breakindent = true },
          },
        },
      },
    },
  },
}
